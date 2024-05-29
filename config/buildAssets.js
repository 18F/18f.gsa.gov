/* eslint no-restricted-syntax: 'off', no-shadow: 'off', no-console: 'off' */
/** eslint doesn't like iterators/generators */

/** we are using console.logs for logging asset builds */

const fs = require('fs/promises');
const path = require('path');
const esbuild = require('esbuild');
const { sassPlugin } = require('esbuild-sass-plugin');

// A recursive generator function to list all of the files in a directory
async function* getFilesInDirectory(dir) {
  const dirents = await fs.readdir(dir, { withFileTypes: true });
  for (const dirent of dirents) {
    const res = path.join(dir, dirent.name);
    if (dirent.isDirectory()) {
      yield* getFilesInDirectory(res);
    } else {
      yield res;
    }
  }
}

async function createAssetPaths() {
  let pathPrefix = '';

  if (process.env.BASEURL) {
    pathPrefix = process.env.BASEURL;
  }

  const assetPath = path.join(__dirname, '../_site/assets');
  const assetDirs = await fs.readdir(assetPath);
  const assetsFiles = await Promise.all(
    assetDirs.map(async (dir) => {
      const files = [];
      for await (const f of getFilesInDirectory(
        path.join(__dirname, '../_site/assets', dir),
      )) {
        files.push(f);
      }
      return files.map((file) => {
        const { name, ext } = path.parse(file);
        const publicDir = '_site/';
        const assetDirs = file.slice(
          file.indexOf(publicDir) + publicDir.length,
        );
        const hashedAt = name.lastIndexOf('-');
        const originalName = name.slice(0, hashedAt);
        const key = `${originalName}${ext}`;
        return {
          [key]: `${pathPrefix}/${assetDirs}`,
        };
      });
    }),
  );
  const assets = Object.assign({}, ...assetsFiles.flat());
  const outputData = path.join(__dirname, '../_data/assetPaths.json');

  return await fs.writeFile(outputData, JSON.stringify(assets, null, 2));
}

esbuild
  .build({
    entryPoints: [
      'assets/_common/styles/styles.scss',
      'assets/_common/js/app.js',
      'assets/_common/js/admin.js',
    ],
    entryNames: '[dir]/[name]-[hash]',
    outdir: '_site/assets/',
    format: 'iife',
    loader: {
      '.jpg': 'dataurl',
      '.png': 'dataurl',
      '.svg': 'dataurl',
      '.ttf': 'dataurl',
      '.woff': 'dataurl',
      '.woff2': 'dataurl',
    },
    minify: process.env.ELEVENTY_ENV === 'production',
    sourcemap: process.env.ELEVENTY_ENV !== 'production',
    target: ['chrome58', 'firefox57', 'safari11', 'edge18'],
    plugins: [
      sassPlugin({
        loadPaths: [
          './node_modules/@uswds',
          './node_modules/@uswds/uswds/packages',
        ],
      }),
    ],
    bundle: true,
  })
  .then(() => createAssetPaths())
  .then(() => {
    console.log('Assets have been built!');
    process.exit();
  })
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });

const fs = require('fs');

const browserSyncPlugin = (eleventyConfig) => {
  // Override Browsersync defaults (used only with --serve)
  eleventyConfig.setBrowserSyncConfig({
    callbacks: {
      ready (err, browserSync) {
        const content404 = fs.readFileSync('_site/404/index.html');

        browserSync.addMiddleware('*', (req, res) => {
          // Provides the 404 content without redirect.
          res.writeHead(404, { 'Content-Type': 'text/html; charset=UTF-8' });
          res.write(content404);
          res.end();
        });
      },
    },
    ui: false,
    ghostMode: false,
  });
}

module.exports = browserSyncPlugin;

const passthroughPlugin = (eleventyConfig) => {
  // Copying assets was doing something weird, and this fixed it
  // I don't like not knowing why, but, here we are.
  eleventyConfig.setServerPassthroughCopyBehavior('passthrough');

  // Copy the `admin` folders to the output
  eleventyConfig.addPassthroughCopy('admin');
  eleventyConfig.addPassthroughCopy('assets');

  // Copy USWDS init JS so we can load it in HEAD to prevent banner flashing
  eleventyConfig.addPassthroughCopy({'./node_modules/@uswds/uswds/dist/js/uswds-init.js': 'assets/js/uswds-init.js'});

  // Specific scripts to guides
  eleventyConfig.addPassthroughCopy('./assets/common/js/*');
  eleventyConfig.addPassthroughCopy('./assets/**/js/*');

  // Let's find a way to keep everything in assets
  eleventyConfig.addPassthroughCopy({'./assets/common/img/favicons/favicon.ico': './favicon.ico' });
  // @todo The folder _site/img is not something we want forever, but it's being created
  // here and in the shortcodes that use the 11ty/image plugin.
  eleventyConfig.addPassthroughCopy({'./assets/common/img/favicons': './img/favicons' });

  eleventyConfig.addPassthroughCopy({'content/robots.txt': '/robots.txt' });

  // This is a Google-specific setting
  eleventyConfig.addPassthroughCopy('google16a62a069d0c4fa4.html');
}

module.exports = passthroughPlugin;

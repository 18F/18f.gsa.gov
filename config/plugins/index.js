const { EleventyRenderPlugin } = require('@11ty/eleventy');
const embedTwitter = require('eleventy-plugin-embed-twitter');
const pluginNavigation = require('@11ty/eleventy-navigation');
const pluginRss = require('@11ty/eleventy-plugin-rss');
const svgSprite = require('eleventy-plugin-svg-sprite');
const syntaxHighlight = require('eleventy-plugin-shiki-twoslash');

const pluginsPlugin = (eleventyConfig) => {

  eleventyConfig.addPlugin(EleventyRenderPlugin);

  // Embeds tweets
  eleventyConfig.addPlugin(embedTwitter, {
    cacheText: true,
    cacheDuration: '*' // caches tweets forever
  });

  eleventyConfig.addPlugin(pluginNavigation);
  eleventyConfig.addPlugin(pluginRss);

  // USWDS: USWDS icons
  eleventyConfig.addPlugin(svgSprite, {
    path: './node_modules/@uswds/uswds/dist/img/uswds-icons',
    svgSpriteShortcode: 'uswds_icons_sprite',
    svgShortcode: 'uswds_icons'
  });

  // USWDS: USA icons
  eleventyConfig.addPlugin(svgSprite, {
    path: './node_modules/@uswds/uswds/dist/img/usa-icons',
    svgSpriteShortcode: 'usa_icons_sprite',
    svgShortcode: 'usa_icons'
  });

  // Style code blocks
  eleventyConfig.addPlugin(syntaxHighlight, { theme: 'github-light' });

}

module.exports = pluginsPlugin;

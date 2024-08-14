const redirect = require('../../lib/redirect')

module.exports = (eleventyConfig) => {
  eleventyConfig.addJavaScriptFunction('redirect', redirect);
};

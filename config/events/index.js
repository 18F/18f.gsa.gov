const { pa11yScan } = require('../../lib/pa11y')

const events = (eleventyConfig) => {
  eleventyConfig.on('eleventy.after', pa11yScan);
}

module.exports = events;

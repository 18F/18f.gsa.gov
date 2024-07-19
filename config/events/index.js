const { pa11yScan } = require('../../lib/pa11y')
const generateRelatedPosts = require('../../lib/related_posts')

const events = (eleventyConfig) => {
  eleventyConfig.on('eleventy.before', generateRelatedPosts);
  eleventyConfig.on('eleventy.after', pa11yScan);
}

module.exports = events;

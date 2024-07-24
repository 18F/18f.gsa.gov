const image = require('./image')
const imageWithClass = require('./imageWithClass')
const uswdsIcon = require('./uswdsIcon')

const shortcodesPlugin = (eleventyConfig) => {
  eleventyConfig.addShortcode('image', image)
  eleventyConfig.addShortcode('image_with_class', imageWithClass)
  eleventyConfig.addShortcode('uswds_icon', uswdsIcon)
}

module.exports = shortcodesPlugin;

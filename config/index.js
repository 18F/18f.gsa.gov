// const assets = require('./plugins/assets')
const collections = require('./collections')
const data = require('./data')
const dataExtensions = require('./data_extensions')
const events = require('./events')
const filters = require('./filters')
const ignores = require('./ignores')
const markdown = require('./markdown')
const passthroughs = require('./passthroughs')
const plugins = require('./plugins')
const shortcodes = require('./shortcodes')
const templateFunctions = require('./template_functions')

// Wrapper for custom bits for 18f.gsa.gov
module.exports = function EighteenF(eleventyConfig) {
  // Asset building
  // eleventyConfig.addPlugin(assets)
  eleventyConfig.addPlugin(collections)
  eleventyConfig.addPlugin(data)
  eleventyConfig.addPlugin(dataExtensions)
  eleventyConfig.addPlugin(events)
  eleventyConfig.addPlugin(filters)
  eleventyConfig.addPlugin(ignores)
  eleventyConfig.addPlugin(markdown)
  eleventyConfig.addPlugin(passthroughs)
  eleventyConfig.addPlugin(plugins)
  eleventyConfig.addPlugin(shortcodes)
  eleventyConfig.addPlugin(templateFunctions)
}

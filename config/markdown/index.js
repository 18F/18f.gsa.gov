const markdownLibrary = require('./base')

const markdownPlugin = (eleventyConfig) => {
  eleventyConfig.setLibrary('md', markdownLibrary);
}

module.exports = markdownPlugin

const posts = require('./posts')
const services = require('./services')
const tags = require('./tags')

const collectionPlugin = (eleventyConfig) => {
  eleventyConfig.addCollection('posts', posts)
  eleventyConfig.addCollection('services', services)
  eleventyConfig.addCollection('tags', tags)
}

module.exports = collectionPlugin;

const ignoresPlugin = (eleventyConfig) => {
  eleventyConfig.watchIgnores.add('.cache/related-posts-*.md')
}

module.exports = ignoresPlugin;

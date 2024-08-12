const { parse } = require('csv-parse/sync'); /* eslint-disable-line import/no-unresolved */
const yaml = require('js-yaml')

// Allow YAML and CSV data to be used in the data dir
const dataExtensionsPlugin = (eleventyConfig) => {
  eleventyConfig.addDataExtension('csv', (contents) => parse(contents, { columns: true, skip_empty_lines: true }));
  eleventyConfig.addDataExtension('yml, yaml', contents => yaml.load(contents))
}

module.exports = dataExtensionsPlugin;

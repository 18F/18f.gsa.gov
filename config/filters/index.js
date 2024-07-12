const asAbsoluteUrl   = require('./asAbsoluteUrl');
const capitalize      = require('./capitalize');
const dateToXMLSchema = require('./dateToXMLSchema');
const embed           = require('./embed');
const filterTagList   = require('./filterTagList');
const head            = require('./head');
const htmlDateString  = require('./htmlDateString');
const limit           = require('./limit');
const markdownify     = require('./markdownify');
const matching        = require('./matching');
const min             = require('./min');
const readableDate    = require('./readableDate');
const teamLink        = require('./teamLink');
const teamPhoto       = require('./teamPhoto');
const toDatePath      = require('./toDatePath');

const filterPlugin = (eleventyConfig) => {
  eleventyConfig.addFilter('asAbsoluteUrl', asAbsoluteUrl)
  eleventyConfig.addFilter('capitalize', capitalize);
  eleventyConfig.addFilter('date_to_xmlschema', dateToXMLSchema);
  eleventyConfig.addFilter('embed', embed)
  eleventyConfig.addFilter('filterTagList', filterTagList)
  eleventyConfig.addFilter('head', head)
  eleventyConfig.addFilter('htmlDateString', htmlDateString)
  eleventyConfig.addFilter('limit', limit);
  eleventyConfig.addFilter('markdownify', markdownify)
  eleventyConfig.addFilter('matching', matching);
  eleventyConfig.addFilter('min', min)
  eleventyConfig.addFilter('readableDate', readableDate)
  eleventyConfig.addFilter('team_link', teamLink)
  eleventyConfig.addFilter('team_photo', teamPhoto)
  eleventyConfig.addFilter('toDatePath', toDatePath);
};

module.exports = filterPlugin;

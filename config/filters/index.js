const asAbsoluteUrl   = require('./asAbsoluteUrl');
const byAuthor        = require('./byAuthor');
const byTag           = require('./byTag');
const capitalize      = require('./capitalize');
const dateToXMLSchema = require('./dateToXMLSchema');
const embed           = require('./embed');
const filterTagList   = require('./filterTagList');
const head            = require('./head');
const htmlDateString  = require('./htmlDateString');
const limit           = require('./limit');
const markdownify     = require('./markdownify');
const min             = require('./min');
const readableDate    = require('./readableDate');
const relatedPosts    = require('./relatedPosts');
const teamLink        = require('./teamLink');
const teamPhoto       = require('./teamPhoto');
const toDatePath      = require('./toDatePath');

const filterPlugin = (eleventyConfig) => {
  eleventyConfig.addFilter('asAbsoluteUrl', asAbsoluteUrl)
  eleventyConfig.addFilter('byAuthor', byAuthor);
  eleventyConfig.addFilter('byTag', byTag);
  eleventyConfig.addFilter('capitalize', capitalize);
  eleventyConfig.addFilter('date_to_xmlschema', dateToXMLSchema);
  eleventyConfig.addFilter('embed', embed)
  eleventyConfig.addFilter('filterTagList', filterTagList)
  eleventyConfig.addFilter('head', head)
  eleventyConfig.addFilter('htmlDateString', htmlDateString)
  eleventyConfig.addFilter('limit', limit);
  eleventyConfig.addFilter('markdownify', markdownify)
  eleventyConfig.addFilter('min', min)
  eleventyConfig.addFilter('readableDate', readableDate)
  eleventyConfig.addFilter('related', relatedPosts)
  eleventyConfig.addFilter('team_link', teamLink)
  eleventyConfig.addFilter('team_photo', teamPhoto)
  eleventyConfig.addFilter('toDatePath', toDatePath);
};

module.exports = filterPlugin;

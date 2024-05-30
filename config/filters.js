// Keep filter source code here.

const { DateTime } = require('luxon');

const readableDate = (dateObj) => DateTime.fromJSDate(dateObj, { zone: 'utc' }).toFormat(
  'dd LLL yyyy',
);

// https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#valid-date-string
const htmlDateString = (dateObj) => DateTime.fromJSDate(dateObj, { zone: 'utc' }).toFormat('yyyy-LL-dd');

// Get the first `n` elements of a collection.
const head = (array, n) => {
  if (!Array.isArray(array) || array.length === 0) {
    return [];
  }
  if (n < 0) {
    return array.slice(n);
  }
  return array.slice(0, n);
};

// Return the smallest number argument
const min = (...numbers) => Math.min.apply(null, numbers);

const filterTagList = (tags) => (tags || []).filter(
  (tag) => ['all', 'nav', 'post', 'posts'].indexOf(tag) === -1,
);

const embed = (url, title=url) => {
  return `<div class='embed-container'><iframe src='${url}' title='${title}' width='560' height='315' frameborder='0' allowfullscreen></iframe></div>`
}

// TODO These all need implementation, they're just placeholders so the site builds at all
const team_photo = (slug) => { return `TODO PHOTO FOR ${slug}` }
const team_link = (slug) => { return `TODO LINK FOR ${slug}` }
const find_collection = (site, collection) => { return [] }
const weighted_sort = (array, weight_name, sort_name) => { return array }
const in_groups = (array, groups) => { return array }
const oembed = (url) => { return `TODO EMBED ${url}` }
const relative_url = (url) => { return url }
const match_posts = (page, property="tags") => { return [] }

// FIXME
// The markdownify filter in this site is mostly a smell,
// indicating that a different layout should be used.
// This is a placeholder, so I can get the site to build.
// My sense is it should not be used in production.
const markdownify = (content) => { return content }


module.exports = {
  readableDate,
  htmlDateString,
  head,
  min,
  filterTagList,
  embed,
  team_photo,
  team_link,
  find_collection,
  markdownify,
  weighted_sort,
  in_groups,
  oembed,
  relative_url,
  match_posts,
};

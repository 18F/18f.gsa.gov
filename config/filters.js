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

module.exports = {
  readableDate,
  htmlDateString,
  head,
  min,
  filterTagList,
};

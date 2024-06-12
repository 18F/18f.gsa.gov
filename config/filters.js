// Keep filter source code here.
const fs = require('fs');
const { DateTime } = require('luxon');
const markdownIt = require('markdown-it');
const { parse } = require('csv-parse/sync');  /* eslint-disable-line import/no-unresolved */

const { imageShortcode } = require('./index');

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

const embed = (url, title=url) => `<div class='embed-container'><iframe src='${url}' title='${title}' width='560' height='315' frameborder='0' allowfullscreen></iframe></div>`

const teamData = parse(
  fs.readFileSync('./_data/team_members.csv', 'utf8'), {
    columns: true,
    skip_empty_lines: true
  }
);

const findPerson = (id) => {
  const maybePerson = teamData.find((person) => person.id === id);
  if (maybePerson === undefined) {
    console.warn(id, 'is undefined') /* eslint-disable-line no-console */
  }
  return maybePerson
}

const fullName = (person) => {
  if (person.full_name !== '') {
    return person.full_name;
  }
    return `${person.first_name} ${person.last_name}`

}

const teamPhoto = (slug) => {
  const maybePerson = findPerson(slug)
  const maybeImage = `assets/img/team/${slug}.jpg`
  let imagePath;
  let caption;
  let placeholderImage;

  if (fs.existsSync(maybeImage)) {
    imagePath = maybeImage;
    placeholderImage = false;
  } else {
    imagePath = 'assets/img/logos/18F-Logo-M.png';
    placeholderImage = true;
  }

  if (maybePerson) {
    if (placeholderImage) {
      caption = `Placeholder image for 18F team member ${fullName(maybePerson)} (18F logo)`;
    } else {
      caption = `Photo of 18F team member ${fullName(maybePerson)}`;
    }
  } else {
    caption = 'Placeholder photo for 18F team member';
  }

  return imageShortcode(imagePath, caption);
}

const teamLink = (slug) => {
  const name = fullName(findPerson(slug))
  return `<a href="/author/${slug.toLowerCase()}/">${name}</a>`
}

// TODO These all need implementation, they're just placeholders so the site builds at all
// TODO remove the eslint-disable directive after implementation
/* eslint-disable */
const weightedSort = (array, weight_name, sort_name) => array
const asRelativeUrl = (url) => url
const matchPosts = (page, property='tags') => []
/* eslint-enable */

const md = markdownIt({ html: true });
const markdownify = (content) => md.render(content)

module.exports = {
  readableDate,
  htmlDateString,
  head,
  min,
  filterTagList,
  embed,
  teamPhoto,
  teamLink,
  markdownify,
  weightedSort,
  asRelativeUrl,
  matchPosts,
};

// Keep filter source code here.
const fs = require('fs');
const { parse } = require('csv-parse/sync');
const { DateTime } = require('luxon');
const { imageShortcode, imageWithClassShortcode } = require('./index');

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

const teamData = parse(
  fs.readFileSync('./_data/team_members.csv', 'utf8'), {
    columns: true,
    skip_empty_lines: true
  }
);

const findPerson = (id) => {
  const maybePerson = teamData.find((person) => person.id == id);
  if (maybePerson === undefined) {
    console.log(id, "is undefined")
  }
  return maybePerson
}

const fullName = (person) => {
  if (person.full_name != '') {
    return person.full_name;
  } else {
    return `${person.first_name} ${person.last_name}`
  }
}

const team_photo = (slug) => {
  const maybePerson = findPerson(slug)
  const maybeImage = `assets/img/team/${slug}.jpg`
  var imagePath;
  var caption;
  var placeholderImage;

  if (fs.existsSync(maybeImage)) {
    imagePath = maybeImage;
    placeholderImage = false;
  } else {
    imagePath = "assets/img/logos/18F-Logo-M.png";
    placeholderImage = true;
  }

  if (maybePerson) {
    if (placeholderImage) {
      caption = `Placeholder image for 18F team member ${fullName(maybePerson)} (18F logo)`;
    } else {
      caption = `Photo of 18F team member ${fullName(maybePerson)}`;
    }
  } else {
    caption = "Placeholder photo for 18F team member";
  }

  return imageShortcode(imagePath, caption);
}

const team_link = (slug) => {
  const name = fullName(findPerson(slug))
  return `<a href="/author/${slug}">${name}</a>`
}

// TODO These all need implementation, they're just placeholders so the site builds at all
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

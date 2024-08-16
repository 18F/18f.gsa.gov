const fs = require('fs');
const imageShortcode = require('../shortcodes/image');
const { findPerson, fullName } = require('../../lib/team');

// @todo Refactor: caption and image path could be their own functions
module.exports = async (slug) => {
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

const { findPerson, fullName } = require('../../lib/team');

module.exports = async (slug) => {
  const name = fullName(findPerson(slug))
  return `<a href="/author/${slug.toLowerCase()}/" itemprop="name">${name}</a>`
}

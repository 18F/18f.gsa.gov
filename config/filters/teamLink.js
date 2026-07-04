const { findPerson, fullName } = require('../../lib/team');

module.exports = async (slug) => {
  const name = fullName(findPerson(slug))
  return `<span itemprop="name">${name}</span>`
}

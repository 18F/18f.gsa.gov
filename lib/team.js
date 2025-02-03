const fs = require('fs');
const { parse } = require('csv-parse/sync');  /* eslint-disable-line import/no-unresolved */

// const teamData = parse(
//   fs.readFileSync('./data/team_members.csv', 'utf8'), {
//     columns: true,
//     skip_empty_lines: true
//   }
// );

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

module.exports = {
  findPerson,
  fullName,
}

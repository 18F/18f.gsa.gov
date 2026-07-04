const titleizeSlug = (id) => id
  .split('-')
  .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
  .join(' ');

const findPerson = (id) => ({
  id,
  first_name: titleizeSlug(id),
  last_name: '',
  full_name: titleizeSlug(id),
});

const fullName = (person) => {
  if (person.full_name !== '') {
    return person.full_name;
  }
  return `${person.first_name} ${person.last_name}`;
};

module.exports = {
  findPerson,
  fullName,
};

const dateObject = async (date) => {
  switch(typeof date) {
  case 'object': return date;
  case 'string': return new Date(date);
  default: throw new Error(`Expected date (${date}) to be string or object`)
  }
}

module.exports = {
  dateObject
}

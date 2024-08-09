const string = require('string')

module.exports = s => string(s).replaceAll('.', '-').slugify().toString()

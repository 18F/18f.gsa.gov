const { DateTime } = require('luxon');

module.exports = async (dateObj) => DateTime.fromJSDate(dateObj, { zone: 'utc' }).toFormat

const { dateObject } = require('../../lib/date')

module.exports = async (date) => (await dateObject(date)).toISOString();

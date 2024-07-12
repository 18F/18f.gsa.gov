const { dateObject } = require('../../lib/date')

// Generates the "yyyy/mm/dd" part of permalinks for blog posts
// @example date is Jan 1, 2020
//    returns "2020/01/01"
// const toDatePath = async

module.exports = async (date) => (await dateObject(date)).toISOString().split('T')[0].split('-').join('/');

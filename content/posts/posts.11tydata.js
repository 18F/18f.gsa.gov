const {DateTime} = require('luxon')

module.exports = {
  layout: 'post.html',
  permalink: '/{{ page.date | toDatePath }}/{{ page.fileSlug }}/',
  eleventyComputed: {
    dateString: ({page}) => DateTime.fromJSDate(page.date, {zone: 'utc'}).toLocaleString(DateTime.DATE_FULL)
  }
}

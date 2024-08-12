const EighteenF = require('./config');

module.exports = function (config) { /* eslint-disable-line func-names */
  config.addPlugin(EighteenF);

  // If BASEURL env variable exists, use it as the path prefix
  const pathPrefix = process.env.BASEURL || '/'

  return {
    templateFormats: ['md', 'njk', 'html', 'liquid'],
    markdownTemplateEngine: 'liquid',
    htmlTemplateEngine: 'liquid',

    // If your site deploys to a subdirectory, change `pathPrefix`.
    pathPrefix,

    dir: {
      input: '.',
      includes: 'templates',
      layouts: 'templates/layouts',
      data: 'data',
      output: '_site',
    },
  };
};

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uncss: {
      dist: {
        options: {
          stylesheets: [
            'assets/css/styles.css'
          ]
        },
        files: {
          'tidy.css': [
            'http://127.0.0.1:4000/',
            'http://127.0.0.1:4000/404',
            'http://127.0.0.1:4000/500',
            'http://127.0.0.1:4000/team/',
            'http://127.0.0.1:4000/team/jamie/',
            'http://127.0.0.1:4000/consulting/',
            'http://127.0.0.1:4000/blog/',
            'http://127.0.0.1:4000/2015/08/10/18f-design-methods/',
            'http://127.0.0.1:4000/tags/open-source/',
            'http://127.0.0.1:4000/linking-policy/'
          ]
        }
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-uncss');

  // Default task(s).
  grunt.registerTask('default', ['uncss']);

};

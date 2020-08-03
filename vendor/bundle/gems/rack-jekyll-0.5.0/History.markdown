# Rack-Jekyll Release History

## master / 2016-03-09

### Enhancements

  * Drop support of Ruby < 1.9.3
  * Add release history
  * Include example/ directory in the gem
  * Use markdown source files for demo site instead of HTML
  * Improve demo site pages, CSS, and `_config.yml`
  * Remove Thorfile

### Bug Fixes

  * Fix wrong HTML tag in default layout of demo site

### Development Fixes

  * Move helper methods into a tested Utils module
  * Use require_relative
  * Remove unnecessary require statements
  * Remove Rack::ShowStatus middleware from demo site
  * Avoid "unused variable" warning for ruby -w


## 0.4.5 / 2015-11-06

### Enhancements

  * Allow serving of files with unknown media type
  * Support HEAD requests

### Bug Fixes

  * Fix detection of 404s for directories without index.html
  * Fix detection of 404s with partially matching paths
  * Fix default media type for unknown extension (`application/octet-stream`)

### Development Fixes

  * Increase test coverage
  * Major refactorings


## 0.4.3, 0.4.4

not to be used, superseded by 0.4.5


## 0.4.2 / 2015-10-12

### Enhancements

  * Loosen dependency on Jekyll to also allow Jekyll 2
  * Add `:config` option for custom configuration file
  * Add `:force_build` option to always generate site
  * Wait while regenerating the site before returning a response
  * Use "listen" gem instead of "directory_watcher"
  * Clean up and improve demo site: use Markdown, add CSS, ...
  * Clean up and improve README
  * Add some RDoc

### Bug Fixes

  * Fix typo in Content-Length header
  * Fix broken initialization of instance variables
  * Fix broken configuration loading
  * Fix updating of @files list
  * Fix auto-regeneration

### Development Fixes

  * Major refactorings
  * Start testing the actual code instead of a fake app
  * Add many test cases and clean up tests
  * Use "minitest" instead of "test-unit"
  * Fix Cucumber tests which were always passing
  * Let the @files list be an array
  * Fix misplaced instance variable assignment
  * Fix effectless debugging statement
  * Add "listen" gem as dependency
  * Clean up gemspec
  * Remove some unused legacy code


## 0.4.1 / 2013-05-15

See commit log.

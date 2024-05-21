/* gulpfile.js */

/**
* Import uswds-compile
*/
const uswds = require('@uswds/compile')

/**
* USWDS version
* Set the major version of USWDS you're using
* (Current options are the numbers 2 or 3)
*/
uswds.settings.version = 3

/**
* Path settings
* Set as many as you need
*/
uswds.paths.src.projectSass = './_sass'
uswds.paths.dist.img = './assets/uswds/img'
uswds.paths.dist.fonts = './assets/uswds/fonts'
uswds.paths.dist.js = './assets/uswds/js'
uswds.paths.dist.css = './assets/css'
uswds.paths.dist.theme = './_sass/'

/**
* Exports
* Add as many as you need
*/
exports.compile = uswds.compile
exports.compileIcons = uswds.compileIcons
exports.compileSass = uswds.compileSass
exports.copyAssets = uswds.copyAssets
exports.copyImages = uswds.copyImages
exports.watch = uswds.watch
exports.default = this.watch

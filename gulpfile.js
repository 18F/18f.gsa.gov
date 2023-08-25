/* gulpfile.js */

/**
* Import uswds-compile
*/
const uswds = require("@uswds/compile");

/**
* USWDS version
* Set the major version of USWDS you're using
* (Current options are the numbers 2 or 3)
*/
uswds.settings.version = 3;

/**
* Path settings
* Set as many as you need
*/
uswds.paths.src.projectSass = "./_sass";
uswds.paths.dist.img = "./_site/assets/uswds/img";
uswds.paths.dist.fonts = "./_site/assets/uswds/fonts";
uswds.paths.dist.js = "./_site/assets/uswds/js";
uswds.paths.dist.css = "./_site/assets/css";
uswds.paths.dist.theme = "./_sass/";

/**
* Exports
* Add as many as you need
*/
exports.copyAssets = uswds.copyAssets;
exports.compile = uswds.compile;
exports.compileSass = uswds.compileSass;
exports.watch = uswds.watch;
exports.default = this.watch;

var gulp = require('gulp'),
    minifycss = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    clean = require('gulp-clean'),
    concat = require('gulp-concat');

var scripts = ['js/jquery-dotdotdot/src/js/jquery.dotdotdot.js', 'js/18f.js', 'js/slideshow.js'];
var styles = ['styles/fonts.css', 'styles/18f.css'];

// CSS
gulp.task('styles', function() {
    return gulp.src(styles)
        .pipe(concat('18f.min.css'))
        .pipe(minifycss())
        .pipe(gulp.dest('styles'));
});

// Scripts
gulp.task('scripts', function() {
  return gulp.src(scripts)
    .pipe(concat('18f.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('js'));
});

// Clean
gulp.task('clean', function() {
  return gulp.src(['styles/18f.min.css', 'js/18f.min.js'], {read: false})
    .pipe(clean());
});

// Default task
gulp.task('default', ['clean'], function() {
    gulp.start('styles', 'scripts');
});

// Watch
gulp.task('watch', function() {
    // Watch .css files
    gulp.watch(styles, ['styles']);

    // Watch .js files
    gulp.watch(scripts, ['scripts']);
});
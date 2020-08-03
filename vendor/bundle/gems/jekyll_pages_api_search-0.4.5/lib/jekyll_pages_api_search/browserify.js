#! /usr/bin/env node

'use strict';

var browserify = require('browserify');
var fs = require('fs');
var path = require('path');
var zlib = require('zlib');

var SOURCE = process.argv[2];
var TARGET = process.argv[3];
var errors = [];

if (!SOURCE) {
  errors.push('source file not defined');
} else if (!fs.existsSync(SOURCE)) {
  errors.push('source file ' + SOURCE + ' does not exist');
}

if (!TARGET) {
  errors.push('target file not defined');
} else if (!fs.existsSync(path.dirname(TARGET))) {
  errors.push('parent directory of target file ' + TARGET + ' does not exist');
}

if (errors.length !== 0) {
  process.stderr.write(errors.join('\n') + '\n');
  process.exit(1);
}

var bundler = browserify({ standalone: 'renderJekyllPagesApiSearchResults' });
var outputStream = fs.createWriteStream(TARGET);

bundler.add(SOURCE)
  .transform({ global: true }, 'uglifyify')
  .bundle()
  .pipe(outputStream);

outputStream.on('close', function() {
  var gzip = zlib.createGzip({ level: zlib.BEST_COMPRESSION });
  fs.createReadStream(TARGET)
    .pipe(gzip)
    .pipe(fs.createWriteStream(TARGET + '.gz'));
});

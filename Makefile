all: gulp

gulp:
	./node_modules/gulp/bin/gulp.js

watch:
	./node_modules/gulp/bin/gulp.js watch

.PHONY: gulp

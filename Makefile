all: gulp

gulp:
	./node_modules/gulp/bin/gulp.js

watch:
	./node_modules/gulp/bin/gulp.js watch

clean:
	./node_modules/gulp/bin/gulp.js clean	

.PHONY: gulp

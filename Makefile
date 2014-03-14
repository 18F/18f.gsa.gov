all: js css

js:
	./node_modules/uglify-js/bin/uglifyjs js/jquery-dotdotdot/src/js/jquery.dotdotdot.js js/18f.js js/slideshow.js --comments -c -m -o js/18f.min.js

css:
	cat styles/fonts.css styles/18f.css | ./node_modules/clean-css/bin/cleancss -c -o styles/18f.min.css

clean:
	rm js/18f.min.js

.PHONY: clean js css

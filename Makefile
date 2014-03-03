all: js css

js:
	uglifyjs js/jquery-dotdotdot/src/js/jquery.dotdotdot.js js/18f.js --comments -c -m -o js/18f.min.js

css:
	cat styles/fonts.css styles/18f.css | cleancss -c -o styles/18f.min.css

clean:
	rm js/18f.min.js

.PHONY: clean js css

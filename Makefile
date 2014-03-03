all: js

js:
	uglifyjs js/jquery-dotdotdot/src/js/jquery.dotdotdot.js js/18f.js --comments -c -m -o js/18f.min.js

clean:
	rm js/18f.min.js

.PHONY: clean js

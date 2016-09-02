This is a repo to design a beta version of 18f.gsa.gov based on the U.S.
Web Design Standards and with a complete refresh of much of the content.

## Where Contributions Go

Thanks for planning to contribute. Please read the below guidelines to know what to expect before submitting a contribution. Submit contributions to https://github.com/18F/18f.gsa.gov as pull requests to the `master` branch. 18F team members should submit pull requests from a branch. Outside contributors will need to fork this repo.

## Front end architecture
### CSS
- Styling will be built from the US Web Design Standards.
- CSS methodology will be inherited from the WDS, which inherits mostly from the [18f front end guide](https://pages.18f.gov/frontend/css-coding-styleguide/architecture/).
  - Use [18F modifed BEM naming convention](https://pages.18f.gov/frontend/css-coding-styleguide/naming/)
  - Componentized CSS: start with tag rules and only becomes more specific as necessary, using component classes.
- Will update the WDS library when it publishes a change required by the site. Otherwise will update bi-monthly (see #1877).
- The codebase will be visual regression tested when a suitable tool is found for 18F.
- The Sass code should be linted with `scss-lint` (see #1878)
  - The [18F CSS linting configuration](https://raw.githubusercontent.com/18F/frontend/18f-pages-staging/.scss-lint.yml) will be used.
  - If linting fails, it will also fail the tests, but not the build.
- Will default to [semantic HTML5](http://www.w3schools.com/html/html5_semantic_elements.asp).


### Images
- Will use `<svg>` and `xlink` (looking for link) for icons.
- All blog images should be under 800kb in total, un-minified size.
- Images should be under 600Kb after being minified
- All raster images should be minified with a tool such as [grunt-imagemin](https://github.com/gruntjs/grunt-contrib-imagemin).


### JavaScript
- The site will be developed with Jekyll so will have a ruby-based build.
- Is required to work without JavaScript.
- jQuery will be required for the WDS.
- No heavy JS framework is required.
- Should use the AirBnB linter configuration for JavaScript, if linting fails, it will also fail the tests, but not the build. (See: #1879)
- Ruby gems will be used for front end dependency management.
- JavaScript will not be bundled.
- There will be a manual testing script that will be required to walk through for each PR.


### Devices
-  All versions of IE that Microsoft supports; newest Chrome/FF.
-  Mobile first will be employed.
-  Every applicable change should be run through HTML code sniffer.


### Performance
- Will measure against the following custom events:
  - Time to blog post image
  - Time to main image and callout text.
  - Time til first blog post title shows up on page with all blog posts.
- Each of these should load in under a second

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

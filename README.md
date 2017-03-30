[![Code Climate](https://codeclimate.com/github/18F/18f.gsa.gov/badges/gpa.svg)](https://codeclimate.com/github/18F/18f.gsa.gov) [![Test Coverage](https://codeclimate.com/github/18F/18f.gsa.gov/badges/coverage.svg)](https://codeclimate.com/github/18F/18f.gsa.gov/coverage)

# 18F’s flagship website

This repo houses the 18F website. We use the [Draft U.S. Web Design standards](https://standards.usa.gov/) as a front end framework. The site is built and served through [the Federalist platform](https://federalist.fr.cloud.gov/).

### Style and style guide

18f.gsa.gov extends the [U.S. Web Design Standards](https://standards.usa.gov/) and [18F Brand guidelines](https://pages.18f.gov/brand/) to create a style that is professional, unique, and informative. The style guide, located at [18f.gsa.gov/styleguide/](https://18f.gsa.gov/styleguide/) documents the patterns and components used to create this theme.

[View style guide](https://18f.gsa.gov/styleguide/)

### History

A detailed history of the past work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov).

## Installation

Run each of the following steps to get the site up and running.

1. `git clone git@github.com:18F/18f.gsa.gov`
2. `cd 18f.gsa.gov`
3. `bundle install`
4. `./serve`

To dramatically reduce the build time, there are two commands that you can run instead of `./serve`:

* `./serve-fast`: This will eliminate all of the blog posts and the search index, but generates all other pages
* `./serve-blog`: This will eliminate all but the latest three blog posts, but keeps the rest of the site intact.

You should be able to see the site at: http://127.0.0.1:4000/site/

## Alternative Installation using Docker
Using Docker can make dependencies management easier, but can also slow down your build time. You can find out more in
[this discussion](https://github.com/18F/18f.gsa.gov/pull/1688#issue-152998027).

*To try this out on MacOS:*

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox).
2. Make sure Docker is running and `cd` into your project folder.
3. Run `docker-compose build` to build the docker image and its dependencies. You only need to build once, but if there was an error with the build , rebuild using  the  `--no-cache` option like so `docker-compose build --no-cache`  to avoid using the old version of the docker image.
4. Run `docker-compose up`.
   **Note**: if you want to run a single command and bypass your `Dockerfile` for debugging purposes, you can do like so `docker-compose run app <COMMAND>` (for instance, you can run bundle  `docker-compose run app bundle install`). Our site is large, so **this could take awhile**.
5. Visit [http://localhost:4000/site/](http://127.0.0.1:4000/site/) in your browser. Make sure that you include the trailing slash.

## System security controls

The site is a static website with HTML, CSS, and Javascript. Deployments are done through Federalist.

1. Federalist runs in its own organization and space in [cloud.gov](https://cloud.gov/), which piggybacks on [AWS GovCloud](https://aws.amazon.com/govcloud-us/).
1. Federalist Admin: https://federalist.fr.cloud.gov/.
1. Federalist responds to a webhook on GitHub and runs Jekyll to generate static web files and puts them in an S3 bucket.
1. We map 18f.gsa.gov URL to the S3 bucket.

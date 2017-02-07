[![Code Climate](https://codeclimate.com/github/18F/18f.gsa.gov/badges/gpa.svg)](https://codeclimate.com/github/18F/18f.gsa.gov) [![Test Coverage](https://codeclimate.com/github/18F/18f.gsa.gov/badges/coverage.svg)](https://codeclimate.com/github/18F/18f.gsa.gov/coverage)

# 18F’s flagship website

This repo houses the 18F website. We use the [Draft U.S. Web Design standards](https://standards.usa.gov/) as a front end framework. The site is built and served through [the Federalist platform](https://federalist.18f.gov).

### History

A detailed history of the work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov). An archived copy of the original website can be found [on a Federalist preview](https://federalist.18f.gov/preview/18F/18f.gsa.gov/staging).

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
[this discussion](https://github.com/18F/18f.gsa.gov/pull/1688#issue-152998027)

*To try this out on MacOS:*

1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox).
2. Make sure Docker is running and `cd` into your project folder
3. Run `docker-compose build` to build the docker image and its dependencies. You only need to build once, but if there was an error with the build , rebuild using  the  `--no-cache` option like so `docker-compose build --no-cache`  to avoid using the old version of the docker image.
4. Run `docker-compose up`.
   Note: if you want to run a single command and bypass your `Dockerfile` for debugging purposes, you can do like so `docker-compose run app <COMMAND>` (for instance, you can run bundle  `docker-compose run app bundle install`)
5. Visit [http://192.168.99.100:4000](http://192.168.99.100:4000/) in your browser.

## System security controls

The site is a static website with HTML, CSS, and Javascript. Deployments are done through the Federalist platform.

1. Federalist runs in its own organization and space in CloudFoundry
1. Federalist Admin: https://federalist.18f.gov/
1. Using the Federalist editor that requires GitHub Oauth and writes commits as auth'd GitHub user, changes are then passed through a webhook back to Federalist
1. Federalist uses a CloudFoundry S3 service to write to the bucket, the Federalist instance only derives S3 credentials from the CloudFoundry S3 service and can only read/write to federalist.18f.gov/*
1. Federalist responds to a webhook on GitHub and runs Jekyll to generate static web files and puts them in an S3 bucket
1. We map 18f.gsa.gov URL to the S3 bucket

### Constraints

* We use Cloudfront to map 18f.gsa.gov to an S3 endpoint
* Federalist, and Cloudfront do not support the following HTTPS implementations:
  * [HSTS Headers](https://github.com/18F/18f.gsa.gov/issues/1871)
  * [HTTP/2](https://github.com/18F/18f.gsa.gov/issues/1872)
  * [OSCP Stapling](https://github.com/18F/18f.gsa.gov/issues/292)

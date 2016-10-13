# 18F’s flagship website

This repo houses the 18F website. We use the [Draft U.S. Web Design standards](https://standards.usa.gov/) as a front end framework. The site is built and served through [the Federalist platform](https://federalist.18f.gov).

### History

A detailed history of the work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov). An archived copy of the original website can be found [on a Federalist preview](https://federalist.18f.gov/preview/18F/18f.gsa.gov/staging).

## Installation

Run each of the following steps to get the site up and running.

<!-- THESE INSTRUCTIONS ONLY WORK FOR 18F FOLK -->
1. `git clone git@github.com:18F/18f.gsa.gov`
2. `cd 18f.gsa.gov`
3. `bundle install`
4. `./serve`

To enable the ability to search and see archives, you can run `bundle exec jekyll serve` instead of `./serve` for the server start command. This will **slow down rebuild times dramatically**, so use this command with discretion.

You should be able to see the site at: http://127.0.0.1:4000

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

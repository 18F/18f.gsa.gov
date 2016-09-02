# 18F's flagship website

A fresh start for 18f.gsa.gov. Online at beta.18f.gov. We use the [Draft U.S. Web Design standards](https://standards.usa.gov/) as a frontend framework. The site is built and served through [the Federalist platform](https://federalist.18f.gov). A detailed history of the work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov) and an archived copy of the original website, can be found [on a Federalist preview](https://federalist.18f.gov/preview/18F/18f.gsa.gov/staging).

## Installation

Run each of the following steps to get the site up and running.

1. `git clone git@github.com:18F/18f.gsa.gov`
2. `cd 18f.gsa.gov`
3. `bundle install`
4. `bundle exec jekyll serve`

To dramatically speed up rebuild times (from more than 20 seconds to around 5), you can also run `./serve` or `./build` for step 4. These are shorthand for a combination of commands that disable certain plugins. This is especially useful if you're drafting a blog post or formatting single pages. **With this method you will disable search and all archives.**

You should be able to see the site at: http://127.0.0.1:4000

## System security controls

The site is a static website with HTML, CSS, and Javascript. Deployments are done through the Federalist platform.

1. Federalist runs in its own organization and space in CloudFoundry
1. Federalist Admin: https://federalist.18f.gov/
1. Using the Federalist editor that requires GitHub Oauth and writes commits as auth'd GitHub user, changes are then passed through a webhook back to Federalist
1. Federalist uses a CloudFoundry S3 service to write to the bucket, the Federalist instance only derives S3 credentials from the CloudFoundry S3 service and can only read/write to federalist.18f.gov/*
1. Federalist responds to a webhook on GitHub and runs Jekyll to generate static web files and puts them in an S3 bucket
1. We map 18f.gsa.gov URL to the S3 bucket

### Protected branches

Any 18F team member should be able to make a branch of the site and submit a pull request. Doing so will also generate a preview URL we can use to inspect your changes. **The `master` `staging` and `production` branches are protected** this means that only administrators of the repo can push directly to those branches. 18F teammates who don't think they have the correct permissions should hit us up in the #18f-site channel.

### Constraints

* We use Cloudfront to map 18f.gsa.gov to an S3 endpoint
* IE 9 and above
* Federalist, and Cloudfront do not support the following HTTPS implementations:
  * [HSTS Headers](https://github.com/18F/18f.gsa.gov/issues/1871)
  * [HTTP/2](https://github.com/18F/18f.gsa.gov/issues/1872)
  * [OSCP Stapling](https://github.com/18F/18f.gsa.gov/issues/292)

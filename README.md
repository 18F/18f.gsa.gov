# 18F's flagship website

A fresh start for 18f.gsa.gov. Online at beta.18f.gov. We plan to use the U.S. Web Design standards as a frontend framework.

## Installation

Run each of the following steps to get the site up and running.

1. `git clone git@github.com:18F/beta.18f.gov`
2. `cd beta.18f.gov`
3. `bundle install`
4. `jekyll serve`

To dramatically speed up rebuild times (from more than 20 seconds to around 5), you can also run `./serve` or `./build` for step 4. These are shorthand for a combination of commands that disable certain plugins. This is especially useful if you're drafting a blog post or formatting single pages.

You should be able to see the site at: http://127.0.0.1:4000

## System security controls

The site is a static website with HTML, CSS, and Javascript. Deployments are done through the Federalist platform.

1. Federalist runs in its own organization and space in CloudFoundry
1. Federalist Admin: https://federalist.18f.gov/
1. Using the Federalist editor that requires GitHub Oauth and writes commits as auth'd GitHub user, changes are then passed through a webhook back to Federalist
1. Federalist uses a CloudFoundry S3 service to write to the bucket, the Federalist instance only derives S3 credentials (IAM user: s3-sb-federalist.18f.gov) from the CloudFoundry S3 service and can only read/write to federalist.18f.gov/*
1. Federalist responds to a webhook on GitHub and runs Jekyll to generate static web files and puts them in an S3 bucket
1. We map whatever.agency.gov URL to the S3 bucket

### Constraints

* We'll use Cloudfront to map beta.18f.gov to an S3 endpoint
* IE 9 and above
* Federalist, and the CloudFoundry platform do not support the following HTTPS implementations:
  * HTTP/2
  * OSCP Stapling

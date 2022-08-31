# 18F’s main website

[![CircleCI](https://circleci.com/gh/18F/18f.gsa.gov.svg?style=shield)](https://circleci.com/gh/18F/18f.gsa.gov)
[![Known Vulnerabilities](https://snyk.io/test/github/18F/18f.gsa.gov/badge.svg)](https://snyk.io/test/github/18F/18f.gsa.gov)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

This repository houses the 18F website. We use the [U.S. Web Design System](https://designsystem.digital.gov/) for the front end interface. The site is built and served through [the Federalist platform](https://federalist.18f.gov/).

## Style and style guide

18f.gsa.gov extends the [U.S. Web Design System](https://designsystem.digital.gov/) and [18F Brand guidelines](https://pages.18f.gov/brand/) to create a style that is professional, unique, and informative. This relies on the [uswds-jekyll](https://github.com/18F/uswds-jekyll) theme to minimize the amount of custom styling and components of the site.

The style guide, located at [18f.gsa.gov/styleguide/](https://18f.gsa.gov/styleguide/) documents the patterns and components used to create this theme.

## Add a blog post

See the [blogpost example file](examples/blog-post.md) for a template and instructions on how to create a new post.

## Local development

__*Note:*__ _The Federalist platform does not support the use of a predefined `SHOME` environment variable which impacts the installation of the site's testing dependency [`pry`](https://github.com/pry/pry) (See the [issue](https://github.com/pry/pry/issues/2139)).  In order to build the Federalist deployment and keep the tests working in CI, a Federalist specific gemfile ([`GemfileFederalist`](./GemfileFederalist)) was created to exclude the testing and development groups during install. The Federalist script in the `package.json` is run during the build time a creates a bundler config to install the `GemfileFederalist` dependencies and not the default `Gemfile`.  Any updates to the production builds `Gemfile` should be included in the `GemfileFederalist` until a better fix is in place for the `pry` dependency or the Federalist platform._

Run each of the following steps to get the site up and running.

1. `git clone git@github.com:18F/18f.gsa.gov`
2. `cd 18f.gsa.gov`
3. `bundle install`
4. `npm install`
5. `./serve`

To dramatically reduce the build time, there are two commands that you can run instead of `./serve`:

* `./serve-fast`: This will eliminate all of the blog posts and the search index, but generates all other pages
* `./serve-blog`: This will eliminate all but the latest three blog posts, but keeps the rest of the site intact.

You should be able to see the site at: [http://127.0.0.1:4000/site/](http://127.0.0.1:4000/site/)

### Local development using docker

Using Docker can make dependencies management easier, but can also slow down your build time. You can find out more in
[this discussion](https://github.com/18F/18f.gsa.gov/pull/1688#issue-152998027).

*To try this out on MacOS:*

1. Install Docker via the GSA Self Service and make sure Docker is running
2. Open a termninal window and navigate into your project folder `cd`.
3. Run `docker-compose build` to build the docker image and its dependencies.
4. Run `docker-compose up`.
   **Note**: if you want to run a single command and bypass your `Dockerfile` for debugging purposes, you can do like so `docker-compose run app <COMMAND>` (for instance, you can run bundle  `docker-compose run app bundle install`). Our site is large, so **this could take awhile**.
5. Visit [http://localhost:4000/site/](http://127.0.0.1:4000/site/) in your browser. Make sure that you include the trailing slash.

If there was an error with the build, rebuild using  the  `--no-cache` option like so `docker-compose build --no-cache`  to avoid using the old version of the docker image.

## Updating content

## Upating styling

The site relies primarily on USWDS2 styles pulled in via the [uswds-jekyll](https://github.com/18F/uswds-jekyll) theme.

Please ensure that style updates are consistent with our brand's [colors](https://brand.18f.gov/color-palette/), [typography](https://brand.18f.gov/typography/), and [iconography](https://brand.18f.gov/icons/).

Per this, there are generally two main scss files:

* **_sass/_uswds-theme-theme-settings.scss** This stylesheet pulls in all of the [USWDS2 theme variables](https://designsystem.digital.gov/documentation/developers/#sass-and-theme-settings) that are set in the `_sass/_theme` directory. If you want to modify a style, try to make the change globally using the provided theme variables before creating a custom style.

* **_sass/_uswds-theme-custom-styles.scss** This stylesheet pulls in custom styling from the `_sass/_components`, `_sass/templates`, and `_sass/styleguide` directories.

* **`_sass/_components`** is a directory of 18f site specific components. Where possible [USWDS2 components](https://designsystem.digital.gov/components/) should be used in lieu of custom components, because they will be better maintained.

* **`_sass/templates`** is a directory of page specific stylesheets. Where possible, pages should use reusable site components over custom page layouts.

* **`_sass/_styleguide`** is a directory of stylesheets specifically for the `/styleguide` portion of the site.

### Adding testimonials

Testimonials can be added as a compontent as long as an agency logo is place in the `assets/img/agencies` directory.

### Images

#### Project page images

It really helps to have good pictures to help us highlight project work — but you might need a little more guidance about how to get pictures that will tell a story best. Here are some helpful tips:

**If possible:**

1. Image should relate to the project title, the department, or the process (in order of preference)
1. Show real users that benefit from this project
1. Show a screenshot from the project
1. Mix it up! Look at the current project list. Do you see too many of the same type of image (for example, mostly screenshots, mostly brainstorming sessions)

**Consider accessibility and try to avoid images that:**

* Are low-contrast
* Have wording on them

**Consider the audience (government employees and potential partners!) and try to avoid images with the following:**

* Sensitive subject material (for example, children when writing about Child Protective Services)
* Uninteresting subjects
* Super meta imagery (too much of a cognitive leap when relating to subject matter)

**Size:**

* Banner: Size 1300x866

## Deployment

The site is a static website with HTML, CSS, and Javascript. Deployments are done through Federalist.

1. Federalist runs in its own organization and space in [cloud.gov](https://cloud.gov/), which piggybacks on [AWS GovCloud](https://aws.amazon.com/govcloud-us/).
1. [Federalist Admin](https://federalist.18f.gov/).
1. Federalist responds to a webhook on GitHub and runs Jekyll to generate static web files and puts them in an S3 bucket.
1. We map 18f.gsa.gov URL to the S3 bucket.

## Plugins

18f.gsa.gov is using several Ruby gems plugins:

Plugin gem | Description
--- | ---
[`jekyll-archives`](https://github.com/jekyll/jekyll-archives) | creates and manages blog-related pages.
[`jekyll-feed`](https://github.com/jekyll/jekyll-feed) | generates an Atom (RSS-like) feed at [`/feed.xml`](https://18f.gsa.gov/feed.xml).
[`jekyll-paginate`](https://jekyllrb.com/docs/pagination/) | allows for pagination of blog pages, or pages with long lists of items.
[`jekyll-redirect-from`](https://github.com/jekyll/jekyll-redirect-from) | enables redirecting from pages that are no longer active.
[`jekyll-seo-tag`](https://github.com/jekyll/jekyll-seo-tag) | adds metadata tags for search engines and social networks.
[`jekyll-sitemap`](https://github.com/jekyll/jekyll-sitemap) | generates a sitemap at [`/sitemap.xml`](https://18f.gsa.gov/sitemap.xml). This makes it easier for search engines to find us.
[`embed`](https://github.com/18F/jekyll-oembed) | creates a Liquid tag that uses OEmbed

## Components

### Featured posts

This component will showcase the first 3 posts of a given component.

## History

A detailed history of the past work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov).

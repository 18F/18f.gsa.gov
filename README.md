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

Make sure you have Ruby 2.7.4 and Python 3.9 installed and active for the project
directory. Python 3.7, 3.8, or 3.9 is required for some of the dependency builds.

Run each of the following steps to get the site up and running.

1. `git clone git@github.com:18F/18f.gsa.gov`
2. `cd 18f.gsa.gov`
3. `bundle install`
4. `npm install`
5. `./serve`

To reduce the build time, instead of `./serve` you can run `./serve-fast`. This will eliminate all of the blog posts and the search index, but generates all other pages

You should be able to see the site at: [http://127.0.0.1:4000/site/](http://127.0.0.1:4000/site/)

> **NOTE:** If you are using an M-series Mac (M1, M2, etc.), you may need to
> configure bundler to use special build flags for eventmachine. To do that, run:
>
> ```
> bundle config --local build.eventmachine "--with-ldflags=\"-Wl,-undefined,dynamic_lookup\""
> ```
>
> You may also have to run the `bundle install` step 2 or 3 times for everything
> to finish building.

### Local development using docker

Using Docker can make dependencies management easier, but can also slow down your build time. You can find out more in
[this discussion](https://github.com/18F/18f.gsa.gov/pull/1688#issue-152998027).

*To try this out on MacOS:*

1. Install Docker Desktop via the GSA Self Service or download from [their website](https://www.docker.com/).
2. Make sure Docker is running (you should see the whale icon in the taskbar or menu bar).
3. Open a termninal window (CMD+Space on Mac, Start > Run > "cmd" on Windows) and navigate into your project folder `cd folder_name_with_code`.
4. Run `docker compose build` to build the docker image and its dependencies.
5. Run `docker compose up`.
   **Note**: if you want to run a single command and bypass your `Dockerfile` for debugging purposes, you can do like so `docker compose run app <COMMAND>` (for instance, you can run bundle  `docker compose run app bundle install`). Our site is large, so **this could take awhile**.
6. Visit [http://localhost:4000/site/](http://127.0.0.1:4000/site/) in your browser. Make sure that you include the trailing slash.

If there was an error with the build, rebuild using  the  `--no-cache` option like so `docker compose build --no-cache`  to avoid using the old version of the docker image.

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

### card-with-image
This component outputs a small card with image and text. The whole card is a clickable link.

**Expected arguments**:

`link_url` - the url the card will link to (href).

`image_path` - the path to the image. Note that the partial will prepend the site baseurl. It should start with a leading forward slash (“/”).

`text_content` - the text to be displayed next to the image.

**Optional arguments**:

`card_color` - if set to `"dark"`, will make the card background the primary-dark color. Otherwise  the background will default to a white color.

`image_alt_text` - will be the alt text for the image. If this argument isn’t provided, alt text will be set to “” and screen readers will ignore the image.

`image_side` - if set to `"right"`, will place the image on the right side of the card. Otherwise the image will default to the left side.

`image_size` - if set to `"md"`, will set the max image size to 8 units. Otherwise the image will default to a max size of 6 units.

**Example**
A light card with the image on the left:

```
{% include card-with-image.html
  img_path=”/asset/img/guides/accessibility-darker.svg”
  img_size="md"
  link_url= “https://accessibility.18f.gov”
  text_content=”Accessibility”
%}
```

### featured-posts
This component outputs a list of blog post previews to be displayed on pages other than the blog. Each preview will take up 12 columns on mobile screens, 6 columns on tablet screens, and 4 columns on screens larger than a tablet.

**Expected arguments**:

`related_posts` - This is the computed list of posts that should be displayed as blog post previews.

**Optional arguments**:

`color_mode` - If set to “dark”, the post previews will use a white text color and the primary-lightest border color.

`max_num_posts` - Sets a limit on how many post previews to output.

`show_excerpts`- If set to true, will show an excerpt from the blog post. The excerpt must be storedset in the front matter of the blog post.

**Example**

```
{% assign matching_posts = page | match_posts | sort:'date' | reverse %}

{% include featured-posts.html
  related_posts=matching_posts
  max_num_posts=3
  show_excerpt=true
%}
```

### graphic-block
This component will output a styled component with an image and text below the image, and light border on the bottom.

**Expected arguments**:

`body-text` - the text that will be displayed below the image.

`image_path` - the path to the image. Note that the partial will prepend the site baseurl. It should start with a leading forward slash (“/”).

**Optional arguments**:
`image_alt_text` - will be the alt text for the image. If this argument isn’t provided alt text will be set to “” and screen readers will ignore the image.

**Example**

```
{% include graphic-block.html
  image_path="/assets/img/home/cando_illo_1.svg"
  body_text="Modernize software development processes"
%}
```

### testimonial
This partial will output a formatted block quote. The testimonial will be on a dark background with white text and a large, stylized open-quote mark.

**Expected arguments**:

`quote` - the quoted text that will make up the testimonial.

`attribution` - the quote’s author.

**Optional arguments**:

`size` - if set to `“md”`, this will output a slightly smaller block quote that will fit within the project template’s main text. Otherwise it will default to the larger size.

`position` - the quote author’s professional position. In general, we will want to include either position or organization (i.e., at least one of the two fields).

`organization` - The author's organization.  In general we will want to include either position or organization (i.e. at least one of the two fields).

**Example**

```
{% include testimonial.html
  size="md"
  quote=" Our experience with 18F has been much different. They have helped us learn agile development as members of our team. The daily standups have really helped us form a close working relationship with them. They have introduced us to a new tools that I expect we will continue to use when our work with them is completed."
  attribution="Monica Windom"
  position="Director Division of Public Assistance"
  organization="Health and Social Services, State of Alaska"
%}
```

### social-media
This component will output a block with links to 18F’s social media pages, as well as  the RSS feed. The data used to generate this component is in `_data/social_media.yml`. This data file lists out the platforms, links, and the image path to the relevant social media icons to be displayed.


## History

A detailed history of the past work that went into developing this redesign can be found at [18F/beta.18f.gov](https://github.com/18F/beta.18f.gov).

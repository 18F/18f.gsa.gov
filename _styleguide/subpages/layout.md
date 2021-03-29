---
title: 18F site style guide
subpage: Layouts
permalink: /styleguide/layouts/
---

### Primary template

Located at [`_layouts/primary.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/primary.html), this is the template that is most frequently used in 18f.gsa.gov. It is responsible for creating content pages like [/code-of-conduct/]({{ site.baseurl }}/code-of-conduct/) to guides-style pages such as [/join/]({{ site.baseurl }}/join/).

#### Primary template front matter

The primary template uses [Jekyll front matter](https://jekyllrb.com/docs/frontmatter/) heavily to account for variations within the site. Below are the the potential front matter attributes that you can use. Some are listed as _(optional)_. These can be used to alter the appearance of a page.

Attribute | Type | What it does
--- | --- | ---
`title` | String | Title for the page visible in blue banner at the top of the page
`permalink` | String |Path that the page renders relative to the site's `baseurl`
`layout` | String | Should be set to `primary`
`lead` | String | _(optional)_ Large white text that renders on the top blue banner
`banner_cta` | Boolean | _(optional)_ Set to `false` by default. Generates a light blue call to action banner when set to `true`.
`subnav_items` | Object | _(optional)_ Navigation items object that contains a list of subnavigation items that contain a `permalink` and `text`. Renders a [sidenav](https://designsystem.digital.gov/components/sidenav/) on the left side of the page.
`subnav_title` | String| _(optional)_ Set if you want the subnav title or breadcumb text to differ from the page `title`.
`hero` | Boolean | _(optional)_ Enables a hero image in the banner. Defaults to `true`, so set to `false` to hide the image
`image` | String | _(optional)_ Path to hero image. This image will also display on blog post preview cards
`image_alt` | String | _(optional)_ Accessibility text for the image
`image_figcaption` | String | _(optional)_ A caption that will be displayed on top of the image
`breadcrumb` | Boolean | _(optional)_ Set to `false` by default. Specify `true` to enable the breadcrumb. If set to `true`, set `subnav_title` if the breadcrumb text differs from the page `title`.

### How we work page

`/how-we-work` page is similar to the primary template but with a few adjustments that help to highlight how we support our customers. We pull these components the cards are placed at the bottom of the page to highlight past work and to bring users to `/what-we-deliver`.

---

### Project page template

Located at [`_layouts/project-page.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/project-page.html), this is the template for creating new project pages as well as project cards that show up at [/what-we-deliver/]({{ site.baseurl }}/what-we-deliver/).

#### Add a project page

1. Determine if the project is a service or a product and find the corresponding directory
2. Create a new file within either the `_products_projects` or `_servicess_projects` directory and name it with the following format: `[agency acronym]-[project-name].md`.
3. Copy the [project page template](https://raw.githubusercontent.com/18F/18f.gsa.gov/master/examples/project-template.md) to that file. Here you can build out the page to include:

    * Main content on the project's background and 18F's approach
    * The sidebar for at-a-glance information like the project's website or GitHub repos. To do this, update the front matter related to the sidebar. If you don't want something to show up in the sidebar, remove it from the front matter
    * Testimonials or fun facts styling within the body of the page
4. If you're adding an image, make sure to the readme for tips. If you're not adding an image, make sure to specify an `image_icon` property in the front matter, and reference an SVG available in the [SVG catalog](https://github.com/18F/18f.gsa.gov/tree/main/_includes/svg/icons) like so:

  ```yml
  image_icon: gavel.svg
  ```

---

### Blog post template

Located at [`_layouts/post.html`](https://github.com/18F/18f.gsa.gov/tree/main/_layouts/post.html), this is the template for creating new blog posts.

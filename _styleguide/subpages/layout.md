---
title: 18F UI style guide
subpage: Layouts
permalink: /styleguide/layouts/
---

### Templates

These are the primary layout templates that exist on [18f.gsa.gov](https://18f.gsa.gov):

Template | Template file | What it is | Example
--- | --- | --- | ---
[Project page](#project-page) | [`_layouts/project-page.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/project-page.html) | Template for a specific project's page | [Project page]({{ site.baseurl }}/what-we-deliver/fec-gov/)
[Blog post](#blog-post) | [`_layouts/post.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/post.html) | Template for an individual blog post | [Blog post]({{ site.baseurl }}/2017/03/21/nasa-journey-with-us-web-design-standards/)
[Guide page](#guide-page) | [`_layouts/default-intro.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/default-intro.html) | Template for a guide page | [Guide page]({{ site.baseurl }}/join/)

---

### Grid

The layout and grid structure inherits from the U.S. Web Design Standards and makes some slight adjustments. Layout changes are not overrides of the standards, but a handful of CSS classes have been added to compliment the Standards.

Class name | What it does
--- | ---
[`usa-width-tablet`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | A class that allows certain content, namely the [project cards]({{ site.baseurl }}/styleguide/project-cards/), and the [blog previews]({{ site.baseurl }}/styleguide/blog-components/#post-previews) to respond at a different breakpoint, [`$tablet-screen`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss) (768px).
[`usa-flex`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss) | Wrapper class that sets `display: flex`, and can be used to create more flexible layouts.
Classes used with `usa-flex` | `usa-flex-baseline`, `usa-flex-end`, `usa-flex-pull-right`, `usa-flex-always`, `usa-flex-wrap`, `usa-flex-vertically-top`, `usa-flex-pull-right`, and `usa-flex-vertically-bottom`.
[`usa-grid-reversed`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | This class can be used to alternate the order that content appears in mobile vs desktop screen widths.
`content-wide` | In the Standards, the primary way to improve readability is via the `usa-content` class, which [limits content to 75 characters](https://standards.usa.gov/components/typography/#typesetting). Instead of relying on this mechanism, the site wraps site content with the `content-focus` class, [limiting the entire grid to roughly 100 characters](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss).
`content-focus` | When the the grid needs to be wider, `content-wide` is used and the content width is controlled by using partial grid layouts.


---

### Project page

Located at [`_layouts/project-page.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/project-page.html), this is the template for creating new project pages as well as [project cards]({{ site.baseurl }}/styleguide/components/#project-cards) that show up at [/what-we-deliver/]({{ site.baseurl }}/what-we-deliver/).

#### Add a project page:
1. Create a new file within the `_projects` directory, named with the following format: `[agency acronym]-[project-name].md`.
2. Copy the [project page template](https://raw.githubusercontent.com/18F/18f.gsa.gov/master/examples/project-template.md) to that file.
3. Replace all relavent front matter fields. To see if a field is required, see the [project page schema](https://github.com/18F/18f.gsa.gov/blob/master/tests/schema/_projects.yml).
4. If you are adding an image, make sure to [check out the wiki](https://github.com/18F/18f.gsa.gov/wiki/Finding-the-right-image-for-a-project-page). If you are not adding an image, make sure to specify an `image_icon` property in the front matter, and reference an SVG available in the [SVG catalog]({{ site.basurl }}/images/svg-include-catalog) like so:
  ```yml
  image_icon: gavel.svg
  ```
5. Populate the sidebar for at a glance information. To do this, update the front matter related to the sidebar. If you don't want something to show up in the sidebar, remove it from the front matter.

---

### Blog post

Located at [`_layouts/post.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/post.html), this is the template for creating new blog posts.

There is extensive documentation for how to [publish a blog post](https://github.com/18F/18f.gsa.gov/wiki/Publishing-a-blog-post) on the wiki and an [example blog post](https://github.com/18F/18f.gsa.gov/blob/master/examples/blog-post.md) to assist with adding metadata and frequently used blog components. A deeper dive into those components is available at [Blog]({{ site.baseurl }}/syleguide/blog/)

---

### Guide page


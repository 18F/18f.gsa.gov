---
title: 18F UI style guide
subpage: Layout
permalink: /styleguide/layout/
---

The layout and grid structure inherits from the U.S. Web Design Standards and makes some slight adjustments. Layout changes are not overrides of the standards, but a handful of CSS classes have been added to compliment the Standards.

Class name | Description
--- | ---
[`usa-width-tablet`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | A class that allows certain content, namely the [project cards]({{ site.baseurl }}/styleguide/project-cards/), and the [blog previews]({{ site.baseurl }}/styleguide/blog-components/#post-previews) to respond at a different breakpoint, [`$tablet-screen`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss) (768px).
[`usa-flex`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss) | Wrapper class that sets `display: flex`, and can be used to create more flexible layouts.
Classes used with `usa-flex` | `usa-flex-baseline`, `usa-flex-end`, `usa-flex-pull-right`, `usa-flex-always`, `usa-flex-wrap`, `usa-flex-vertically-top`, `usa-flex-pull-right`, and `usa-flex-vertically-bottom`.
[`usa-grid-reversed`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | This class can be used to alternate the order that content appears in mobile vs desktop screen widths.
`content-wide` | In the Standards, the primary way to improve readability is via the `usa-content` class, which [limits content to 75 characters](https://standards.usa.gov/components/typography/#typesetting). Instead of relying on this mechanism, the site wraps site content with the `content-focus` class, [limiting the entire grid to roughly 100 characters](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss).
`content-focus` | When the the grid needs to be wider, `content-wide` is used and the content width is controlled by using partial grid layouts.

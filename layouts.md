# Layouts

## default
The default layout serves as the base layout for all of the other layouts. It adds the header and footer elements, along with the styles and scripts tags.

## primary
The primary layout is used on Home, Work with us, and Our work pages. The layout will automatically add an `h1` heading, along with the lead text, and the page image if those two options are set to the front-matter. The layout will add the remaining page content without adding any additional styling or containers to it.

### Front matter options
The primary template uses [Jekyll front matter](https://jekyllrb.com/docs/frontmatter/) heavily to account for variations within the site. Below are the the potential front matter attributes that you can use. Some are listed as _(optional)_. These can be used to alter the appearance of a page.

Attribute | Type | What it does 
--- | --- | --- 
`title` | String | Title for the page visible in blue banner at the top of the page
`permalink` | String | Path that the page renders relative to the site's `baseurl`
`layout` | String | The type of layout to use for this page
`lead` | String | Large text that renders below the `h1` heading
`image` | String | _(optional)_ Path to hero image for the page.
`image_alt_text` | String | _(optional)_ Accessibility text for the image. If not set the alt text will default to "" and the screen readers will ignore the image.

`breadcrumb` | Boolean | _(optional)_ Set to `false` by default. Specify `true` to enable the breadcrumb. If set to `true`, set `subnav_title` if the breadcrumb text differs from the page `title`.

`banner_cta` | Boolean | _(optional)_ Set to `false` by default. Generates a light blue call to action banner when set to `true`.

## styled-container
This layous it based on the primary layout and is meant to be used with pages that are primarily composed of text without additional markup. The layout will place the page content into a 7 column container on tablet-sized screens and up. 

### Front matter options
In addition to the front matter options available in the `primary` layout, the `styled-container` layout has a few additional layout options:

Attribute | Type | What it does 
--- | --- | --- 
`side_cta` | Boolean | _(optional)_ Set to `false` by default. When set to `true`, generates a rectangular banner with a call to action to the right side of the main content. The content for this component is in `side-cta.html`.
`social_media` | Boolean | _(optional)_ Set to `false` by default. When set to `true`, generates a rectangular banner with links to 18F's social media (the `social-media.html` component). The data used to generate this component is in `_data/social_media`.
`subnav_items` | Object | _(optional)_ Navigation items object that contains a list of subnavigation items that contain a `permalink` and `text`. Renders a [sidenav](https://designsystem.digital.gov/components/sidenav/).
`subnav_title` | String | _(optional)_ Set if you want the subnav title or breadcumb text to differ from the page `title`.

## post
The `post` layout is used for blog posts.

### Front matter options
Attribute | Type | What it does 
`authors` | Object | The list of this post's authors
`date` | String | The publication date for the blog post.
`excerpt` | String | A short summary of the post that will appear on in lists of blog post previews.
`title` | String | The title for the blog post.
`tags` | Object | The list of tags that are relevant to this post
`image` | String | _(optional)_ Path to hero image for the page.
`image_alt` | String | _(optional)_ Accessibility text for the image. If not set the alt text will default to "" and the screen readers will ignore the image.

### project-page
The layout for case studies. This layout is automatically applied to any case study in the`_products_projects` or the `_services_projects/` folders. 

### front matter options
Attribute | Type | What it does 
`agency` | String | The agency partner for the project.
`title` | String | The title for the case study. 
`subtitle` | String | The subtitle for the case study. 
`permalink` | String | Path that the page renders relative to the site's `baseurl`.
`redirect_from` | String or Object | Path that should be redirected to this page.
`excerpt` | String | A short summary of the project. This text will be displayed as a preview in the `card-project`.
`mini_excerpt` | String | _(optional)_ An even shorter, tweet length summary of the project. This summary is used in a `card_with_image`.
`image` | String | _(optional)_ Path to hero image for the page.
`image_alt` | String | _(optional)_ Accessibility text for the image. If not set the alt text will default to "" and the screen readers will ignore the image.
`project_url` | String | _(optional)_ A url to the project website.
`github_repo` | String | _(optional)_ A url to the github repo for the project.
`resources` | String | _(optional)_ A url to any relevant resources for the project.

TODO: Does this actually do anything?
`project_weight` | Integer | A number use to determine the case study's position order in list of case studies. Larger numbers are listed first?


## Layouts for dynamically generated pages
A number of of layouts are used for pages that are dynmaically and automatically created when a blog post is added. In general these layouts should not be used for manually created pages. 

### author results
The layout for displaying blog post previews by author.

### tag-index 
A list of all of the tags used by the blog. 
TODO: determine if we still want this.

### tag-results 
The layout for displaying blog post previews by tag.







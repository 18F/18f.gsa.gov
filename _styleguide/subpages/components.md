---
title: 18F UI style guide
subpage: Components
permalink: /styleguide/components/
parent_permalink: /styleguide/
subnav_items:
- text: Heading 1
  permalink: /styleguide/components/#heading-1
- text: Heading Two
  permalink: /styleguide/components/#heading-two
---

### Buttons

#### Anatomy
<section class="usa-grid">
  <img src='{{ site.baseurl }}/assets/img/styleguide/button-anatomy.png'
       class='usa-width-one-third'
       alt='Image of the dimensions and padding of a button on the 18F site' />
</section>

{% capture styleguide_buttons %}
#### Style on white
<section class="usa-grid">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>

#### Style on dark
<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>

#### Using anchor tags instead of buttons
<a class="usa-button usa-button-secondary" href="{{ dead_end_link }}">Normal</a>
{% endcapture %}


{% include details-code.html
   title='buttons'
   description='Our button styles closely resemble those defined by the U.S. Web Design Standards. We have overriden them in places to more closely align the look and feel with the 18F Brand.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/buttons.scss'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/elements/_buttons.scss'
   content=styleguide_buttons
%}

---

### Breadcrumbs

The site breadcrumb can be used to establish a sense of place within the site. It is only included in the `default-intro` layout by default, but can be added to any layout or custom page as needed.

{% capture styleguide_breadcrumb %}{% raw %}
#### Specifying all attributes
{% include breadcrumb.html
  parent_permalink=page.parent_permalink
  parent_title=page.title
  page_title='Buttons'
  background_class='background-gray'
%}
#### Specifying only needed attributes
`parent_permalink` is set as a page attribute in this example, so it doesn't need to be directly included.
{% include breadcrumb.html
  parent_title=page.title
  page_title='Buttons'
  background_class='background-gray'
%}
{% endraw %}{% endcapture %}

{% capture breadcrumb_description %}
The breadcrumb include requires a few attributes to make it appear properly. They can be directly included in the include as variables or text, or left empty if those attributes are defined on the page itself.
* `parent_title`: Title of the parent page as it should appear on the breadcrumb link
* `parent_permalink`: This is the link that the parent page goes to
* `page_title`: Title of the page as it should appear on the breadcrumb
* `background_class`: The CSS class of the breadcrumb background color. It defaults to no background color

If the breadcrumb is being used as part of the `default-intro` layout, make sure to set `breadcrumb: true` in the page front matter.
The breadcrumb is included automatically on `project-tag-results` layout.

For more on includes, check out the [Jekyll documentation](https://jekyllrb.com/docs/includes/).
{% endcapture %}

{% include details-code.html
   title='breadcrumb'
   lang='markdown'
   description=breadcrumb_description
   include_ref='https://github.com/18F/18f.gsa.gov/blob/master/_includes/breadcrumb.html'
   content=styleguide_breadcrumb
%}

---

### Project cards

The card component is used as a preview for project pages, but could be adapted to meet additional needs if necessary. The design is unique to [18f.gsa.gov](https://18f.gsa.gov), but leans heavily on the stylistic foundation of the U.S. Web Design Standards and 18F Brand guidelines.


{% capture styleguide_card %}{% raw %}
<div class="usa-grid-full">
  <section class="usa-flex usa-flex-wrap">
    {% include card-project.html project='fec-gov' %}
    {% include card-project.html project='hhs-states' %}
    {% include card-project.html project='doi-every-kid-in-a-park' %}
  </section>
</div>
{% endraw %}{% endcapture %}


{% capture card_description %}
To use cards, reference the file path slug in the _projects directory. Use another project as a template to fill in all of the necessary fields.

Each project card has a number of properties. The only required properties are:
* `image_src`: the project `image` field, and is the image portion of the card
* `image_alt`: the project `image_accessibility` field. Will be used to set the `alt` attribute on the provided image
* `agency`: the project `agency` field. This will be the uppercase text
* `tagline`: the project `subtitle` field and what appears to be the title of the card
* `description` the project `excerpt` and what appears as the body of the card
* `link`: the project `permalink`. This is where clicking on the card will take you
* `columns`: How many columns the cards should occupy. The only valid options are `2` and `3`. If nothing is specified, the cards will default to `3` columns
{% endcapture %}
{% include details-code.html
   title='cards'
   description=card_description
   content=styleguide_card
%}

---

### Sticky subnavigation


The sticky subnavigation is a pattern that is used frequently throughout the site to make larger bodies of content easier to navigate.

#### What is it?

The sticky subnavigation:
* is a secondary navigation field that exists on the left side of a page, adjacent to a corresponding field of content.
* is "sticky", which means that its [position](https://developer.mozilla.org/en-US/docs/Web/CSS/position) isn't absolute or static, but is both, depending on the user's location on the page.
* provides a sense of location by updating the active section of content that the user is viewing.

---

{% capture sticky_codeblock %}{% raw %}
<div class="usa-grid-full">
  <aside class="usa-width-one-third sticky sticky-subnav sticky-subnav-styleguide">
    {% include navigation.html subnav=true %}
  </aside>
  <section class="usa-width-two-thirds">
    <h3 id="heading-1">Heading 1</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <h3 id="heading-two">Heading Two</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  </section>
</div>
{% endraw %}{% endcapture %}

{% capture sticky_description %}
#### U.S. Web Design Standards

There are a few components that we are using to generate the sticky subnavigation:

* The `usa-sidenav-list` class, in conjunction with the `usa-current` class. This is mostly taken wholesale from the standards, but does contain slight overrides to better fit with the 18F Brand.
* The `usa-accordion` class and accompanying accordion styles. We have added to this set of styles with a `nav-accordion` class that more accurately reflects the look and feel of the site.
* The `usa-width-one-third` grid class to define the width of our navigaton field. This isn't necessary, but is a convention throughout the site.

#### What to add where
To add items to the subnavigation define the subnavigation items directly within page [frontmatter](https://jekyllrb.com/docs/frontmatter/), as a set of `nav_items`:
  ```yml
  subnav_items:
    - text: Heading 1
      permalink: /styleguide/sticky-subnavigation/#heading-1
    - text: Heading Two
      permalink: /styleguide/sticky-subnavigation/#heading-two
  ```
{% endcapture %}

{% include details-code.html
   title='sticky'
   content=sticky_codeblock
   lang="html"
   description=sticky_description
%}

---

### Right-aligned lists

This attribute is found in the [contact]({{ site.baseurl }}/contact) and [project pages]({{ site.baseurl }}/what-we-deliver/federalist/) on the 18F site. This feature provides at-a-glance information.

{% capture right_aligned_list %}{% raw %}
<div class="usa-grid-full usa-grid-reversed">
  <aside class="usa-grid usa-section usa-grid-reversed-right usa-width-one-third section-info section-info-gray">
    <ul>
      <li class="section-info-list-item">
        <div class="section-info-header">Section header</div>
        <p>Supporting subheader</p>
      </li>
      <li class="section-info-list-item">
        <div class="section-info-header">List of helpful reference links</div>
        <ul>
          <li>link to agency 1: <a href="">agency1.gov</a></li>
          <li>link to more info: <a href="">More info</a></li>
          <li>Twitter: <a href="">@agency</a></li>
          <li>GitHub: <a href="">link to repo</a></li>
        </ul>
      </li>
    </ul>
  </aside>
  <div class="usa-grid usa-section usa-width-two-thirds">
    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
{% endraw %}{% endcapture %}

{% capture right_list_description %}
- The right aligned list should be placed first in the HTML before the main content on the left.
- In the `<aside>` tag we use the `usa-grid-reversed-right` class. This class reverses the order in which the HTML is displayed so that the content that would normally appear on the left will appear on the right instead. The order is not reversed in mobile.

{% endcapture %}
{% include details-code.html
   title='right-list'
   description=right_list_description
   content=right_aligned_list
%}


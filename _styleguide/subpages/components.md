---
title: 18F UI style guide
subpage: Components
permalink: /styleguide/components/
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

### Breadcrumb

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

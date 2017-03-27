---
title: 18F UI style guide
subpage: Breadcrumb
permalink: /styleguide/breadcrumb/
parent_permalink: /styleguide/
---

The site breadcrumb can be used to establish a sense of place within the site. It is only included in the `default-intro` layout by default, but can be added to any layout or custom page as needed. 

{% capture styleguide_breadcrumb %}{% raw %}
### Specifying all attributes
{% include breadcrumb.html
  parent_permalink=page.parent_permalink
  parent_title=page.title
  page_title='Buttons'
  background_class='background-gray'
%}
### Specifying only needed attributes
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


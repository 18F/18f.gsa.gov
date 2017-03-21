---
title: 18F site UI style guide
subpage: Sticky subnavigation
permalink: /styleguide/sticky-subnavigation/
subnav_items:
-
  text: Heading 1
  permalink: /styleguide/sticky-subnavigation/#heading-1
  in_subnav: true
-
  text: Heading Two
  permalink: /styleguide/sticky-subnavigation/#heading-two
  in_subnav: true
---

The sticky subnavigation is a pattern that is used frequently throughout the site to make larger bodies of content easier to navigate.

### What is it?

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

* `.usa-sidenav-list`, including the `.usa-current` class. This is mostly taken wholesale from the standards, but does contain slight overrides to better fit with the 18F Brand.
* `.usa-accordion` and accompanying accordion styles. We have added to this set of styles with a `.nav-accordion` class that more accurately reflects the look and feel of the site.
* `.usa-width-one-third` to define the width of our navigaton field. This isn't necessary, but is a convention throughout the site.

#### What to add where
To add items to the subnavigation define the subnavigation items directly within page [frontmatter](https://jekyllrb.com/docs/frontmatter/), as a set of `nav_items`:
  ```yml
  subnav_items:
  -
    text: Heading 1
    permalink: /styleguide/sticky-subnavigation/#heading-1
    in_subnav: true
  -
    text: Heading Two
    permalink: /styleguide/sticky-subnavigation/#heading-two
    in_subnav: true
  ```
{% endcapture %}

{% include details-code.html
   title='sticky'
   content=sticky_codeblock
   lang="html"
   description=sticky_description
%}

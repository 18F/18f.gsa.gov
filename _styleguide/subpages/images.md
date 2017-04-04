---
title: 18F UI style guide
subpage: Images
permalink: /styleguide/images/
image: /assets/img/page-feature/hire-us.jpg
image_alt: Example of hero image
image_figcaption: Example caption. This caption will be the same for all pages that have image_figcaption specified in their front matter.
---

Images are used heavily throughout the site, but using them isn't always straightforward.

Site-specific images are in multiple places. Many SVGs can be referenced with a Liquid include tag from [`_includes/svg`](https://github.com/18F/18f.gsa.gov/tree/master/_includes/svg/icons). The rest of the site images live in [`assets/img/`](https://github.com/18F/18f.gsa.gov/tree/master/assets/img).

Blog-specific images live in [`assets/blog/`](https://github.com/18F/18f.gsa.gov/tree/master/assets/blog).

### Source reference

{% capture source_ref_codeblock %}{% raw %}
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-S.png" alt="18F logo" />

#### Example of failed image
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-Small.jpg" alt="18F logo" />

#### Example of failed image without alt text
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-Small.jpg" />
{% endraw %}{% endcapture %}

{% capture source_ref_description %}
The primary way to use both site and blog-specific images is to directly call the image path in an `img` tag.

* The `{{ site.baseurl }}` insures that the path is relative to the root of the directory.
* Ensure that each image has `alt` text for [improved site accessibility](https://www.w3.org/TR/WCAG20-TECHS/H37.html).
{% endcapture %}
{% include details-code.html
   title='svg-catalog'
   content=source_ref_codeblock
   lang="markdown"
   description=source_ref_description
%}

---

### SVG include catalog

This is a list of all of the SVGs that are available as includes (in the `_includes` directory). All icons are set to their default sizes.

{% capture catalog_codeblock %}{% raw %}

**svg/icons/agile-icon:**
{% include svg/icons/agile-icon.svg %}

**svg/icons/arrow-left:**
{% include svg/icons/arrow-left.svg %}

**svg/icons/arrow-right:**
{% include svg/icons/arrow-right.svg %}

**svg/icons/close:**
{% include svg/icons/close.svg %}

**svg/icons/folderwithclock:**
{% include svg/icons/folderwithclock.svg %}

**svg/icons/gavel:**
{% include svg/icons/gavel.svg %}

**svg/icons/monitor:**
{% include svg/icons/monitor.svg %}

**svg/icons/open-icon:**
{% include svg/icons/open-icon.svg %}

**svg/icons/respect-icon:**
{% include svg/icons/respect-icon.svg %}

**svg/icons/user-centered-icon:**
{% include svg/icons/user-centered-icon.svg %}
{% endraw %}{% endcapture %}


{% include details-code.html
   title='svg-catalog'
   content=catalog_codeblock
   lang="markdown"
   description='As mentioned above, the icons defined above are set to their default size. For some icons this is defined as by the `width` and `height` attributes on the SVG. For the smallest icons, it is set by the `.icon` class on the SVG itself.'
%}

---

### Image list

The image list is a pattern used throughout the site.

{% capture icon_list_codeblock %}{% raw %}
<ul class="icon-list-wrapper">
  <li class="icon-list">
    <figure class="icon-list-image">{% include svg/icons/respect-icon.svg %}</figure>
    <div class="icon-list-text">
      <p class="p-bold">Respect for government workers</p>
      <p>Civil servants have tremendous knowledge about what it takes to achieve their agency’s mission. We help clear technical and governmental hurdles to better serve the public.</p>
    </div>
  </li>
  <li class="icon-list">
    <figure class="icon-list-image">{% include svg/icons/user-centered-icon.svg %}</figure>
    <div class="icon-list-text">
      <p class="p-bold">Human-centered design</p>
      <p>We listen to real users to understand their needs and build things that will be useful to them — without sacrificing technical or regulatory requirements.</p>
    </div>
  </li>
</ul>
{% endraw %}{% endcapture %}

{% include details-code.html
   title='icon-list-catalog'
   content=icon_list_codeblock
   lang="markdown"
   description='This component is not available as a Jekyll include. To use it, copy the code snippet above and update the icon, title, and body text accordingly.'
   scss_ref="https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/icon-list.scss"
%}

---
title: 18F site UI style guide
subpage: Images
permalink: /styleguide/images/
---

### Source reference

The primary way to use images throughout the site, including the blog is to directly call the image path in

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



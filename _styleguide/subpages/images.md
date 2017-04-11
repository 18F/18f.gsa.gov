---
title: 18F UI style guide
subpage: Images
permalink: /styleguide/images/
image: /assets/img/page-feature/hire-us.jpg
image_alt: Example of hero image
image_figcaption: Example caption. This caption will be the same for all pages that have image_figcaption specified in their front matter.
---



Images are used heavily throughout the site, but using them isn't always straightforward. Below is some guidance on how we use images of various formats throughout the site.

---

### Image formats

The primary image formats that work well for the web are SVG, JPG, PNG, and GIF. Choosing the correct format can speed up the site and lead to a better user experience. Here are some guidlines that we use when picking images on [18f.gsa.gov](https://18f.gsa.gov):

* **SVG**: the fastest loading images. They are generally best suited for iconography, or less complex graphics. They can be added as a [Jekyll include](#svg-includes), or as an [`img` tag with a source reference](#adding-images). SVGs added as Jekyll includes are rendered as valid html `svg` elements and can be styled using CSS.
* **JPG**: best for photos and more realistic images.
* **PNG**: best for text-heavy images, line art, or images with fewer colors.
* **GIF**: should only be used for simple animations.

JPG, PNG, and GIF can only be added as an [`img` tag with a source reference](#adding-images).

#### Using and optimizing JPG and PNG

Before adding images to the site, make sure that they are optimized for the web. Images should be as small as possible without reducing image quality.

1. Crop images to correct dimensions and size. Hero images can be large, but shouldn't exceed 1040px, the max-width for the site.
2. Export it in the proper format. A good rule of thumb is that JPG is good for photographs and more realistic images, while PNG is best for text-heavy images, line art, or images with fewer colors.
3. Then it is time to compress your image.
  - **JPG**: you may be able to do some initial compression within your image editor (e.g., Photoshop), establishing a good tradeoff between image quality and image size. For additonal compression, download [ImageOptim](https://imageoptim.com) to optimize the the image further.
  - **PNG**: drop it into [ImageOptim](https://imageoptim.com) or [ImageAlpha](https://pngmini.com/) and reduce the color palette, establishing a good tradeoff between image quality and size. If the PNG has an alpha channel, turn it into a transparent PNG-8 instead.
4. [Follow these steps](#adding-images) to add to the repository.

---

### Using SVGs

SVG is [file type](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) as well as a [valid HTML element](https://www.w3schools.com/html/html5_svg.asp). What this means is that SVGs can be referenced as an `img` element that represents the SVG graphic as a whole or as an `svg` element that can be styled using CSS, like a font.

The prefered method for adding SVGs on [18f.gsa.gov](https://18f.gsa.gov) is as a Jekyll [include](https://jekyllrb.com/docs/includes/), as shown below. [Follow these steps](#adding-images) to use SVGs as regular images.

{% capture svg_include_block %}{% raw %}
  {% include svg/icons/agile-icon.svg %}
{% endraw %}{% endcapture %}

{% capture svg_include_description %}
  To use an SVG as an include:
  1. Add the SVG to the `/_includes/svg/` directory.
  2. In an include tag, reference the file path of the SVG relative to the `_includes` directory.

  **Accessibility**

  To follow [accessibility guidelines](https://guides.18f.gov/accessibility/), make sure that the SVG image file contains all the necessary markup to allow screenreader users to browse your site without difficulty. From the [WCAG guidlines](https://www.w3.org/TR/SVG-access/#Equivalent) on creating accessibile SVGs:

  * `title`: Provides a human-readable title for the element that contains it. The `title` element may be rendered by a graphical user agent as a tooltip. It may be rendered as speech by a speech synthesizer.
  * `desc`: Provides a longer more complete description of an element that contains it. Authors should provide descriptions for complex or other content that has functional meaning.

  If the SVG is a presentation only image, meaning that it is assistive, but not necessary to provide context within the site, add the following attributes to the `svg` tag itself:

  * `role="img"`
  * `aria-hidden="true"`
{% endcapture %}

{% include details-code.html
   title='svg-include'
   content=svg_include_block
   lang="markdown"
   description=svg_include_description
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

### Adding images

To add images to the site:
  1. Add the image to the assets directory.
    - Blog images go in the `/assets/blog/` directory. The subdirectories are organized by topic, so place the image in the directory that pertains to blog post's primary topic. For detailed information on adding images to the blog, see [Blog]({{ site.baseurl }}/styleguide/blog).
    - All other images can go in the `/assets/img/` directory.
  2. Reference the file path in an image tag, making sure to prefix the path with `{% raw %}{{ site.baseurl }}{% endraw %}` and adding `alt` text for accessibility purposes.


{% capture source_ref_codeblock %}{% raw %}
#### Example of successful image reference with alt text
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-S.png" alt="18F logo" />

#### Example of successful image reference with empty alt text
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-S.png" alt="" />

#### Example of failed image with alt text
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-Small.jpg" alt="18F logo" />

#### Example of failed image without alt text
<img src="{{ site.baseurl }}/assets/img/logos/18F-Logo-Small.jpg" />
{% endraw %}{% endcapture %}

{% capture source_ref_description %}
The primary way to use both site and blog-specific images is to directly call the image path in an `img` tag.

* The `{{ site.baseurl }}` insures that the path is relative to the root of the directory.
* Ensure that each image has `alt` text for [improved site accessibility](https://www.w3.org/TR/WCAG20-TECHS/H37.html).
* If the image is presentational only, empty alt text can be added, like so: `alt=""`.
{% endcapture %}
{% include details-code.html
   title='svg-catalog'
   content=source_ref_codeblock
   lang="markdown"
   description=source_ref_description
%}

---

### Image lists

This pattern associates text with an icon to break up text blocks improve user understanding.
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

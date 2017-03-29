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
<img src="{{ site.basurl }}/assets/img/logos/18F-Logo-S.png" alt="18F logo" />

#### Example of failed image without alt text
<img src="{{ site.basurl }}/assets/img/logos/18F-Logo-S.png" />
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

---

### Adding a team photo

Any 18F team member [listed in the `/assets/img/team/` directory](https://github.com/18F/18f.gsa.gov/tree/master/assets/img/team/) can be referenced directly in markdown or HTML.

{% capture icon_list_codeblock %}{% raw %}
#### Referencing a team member who has a photo
{{ 'brian' | team_photo }}

#### Referencing a team member who does not have a photo
{{ 'greg' | team_photo }}
{% endraw %}{% endcapture %}

{% capture icon_list_description %}
The team photo is created by using a custom Jekyll [filter](https://jekyllrb.com/docs/plugins/#liquid-filters) called `team_photo` that allows us to access images programmaticaly without using an `img` tag explicitly. If an image isn't working, make sure that the text use for the filter directly matches the image title for the team member in question.

In the above example `{% raw %}{{ 'brian' | team_photo }}{% endraw %}`, references `/assets/img/team/brian.jpg` and places it in an `img` tag.

[See the code](https://github.com/18F/18f.gsa.gov/blob/master/_plugins/team.rb) to better understand what is going on.
{% endcapture %}

{% include details-code.html
   title='icon-list-catalog'
   content=icon_list_codeblock
   lang="markdown"
   description=icon_list_description
   other_ref='https://github.com/18F/18f.gsa.gov/tree/master/_plugins#team_photo-accepts-the-authors-name-as-the-first-argument-lives-in-teamrb'
%}

---

## Blog images

There are a few ways we render images on the blog: Hero images that span the entire page, in text images without captions, and in text images with captions.

### Hero image

{% capture styleguide_hero_image %}{% raw %}
{% include feature-image.html %}
{% endraw %}{% endcapture %}

{% capture hero_description %}
Feature images are used used in the `default-intro` and `post` layouts. `default-intro` is the primary layout used throughout the site and `post` is the layout used for blog posts.

If using a layout that needs a feature image, specify the path to the image url with the `image` attribute.

When the image is loaded on to the page, it will be given the CSS class `.post-feature_image`. This will ensure that the image spans the entire width of its surrounding element.

To add a caption, specify the `image_figcaption` attribute in the page front matter.
{% endcapture %}

{% include details-code.html
   title='hero-caption'
   description=hero_description
   content=styleguide_hero_image
   lang="html"
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/blog-post.scss'
%}

{% capture image_captions %}{% raw %}
### Images with no captions
<img class="image-shadowed" src="{{ site.baseurl }}/assets/blog/web-design-standards/template-landing.png" alt="home page of the Draft U.S Web Design Standards">

### Images with captions
<figure>
  <img src="{{ site.baseurl }}/assets/blog/content/gds-content-ux.jpg" alt="">
  <figcaption>The UK Government Digital Service's "Content is user experience" poster.</figcaption>
</figure>

<figure>
  <img src="{{ site.baseurl }}/assets/blog/denver/gallery-41.jpg" alt="">
  <figcaption>This long hallway has public art from local artists hanging in it. This is part of the GSA's <a href="http://www.gsa.gov/fa/">Fine Arts Program.</a> Photo courtesy: GSA PBS Region 8</figcaption>
</figure>
{% endraw %}{% endcapture %}

{% capture image_description %}
To add basic images to a blog post:
* We use [`<figure>` and `<figcaption>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure) tags
* We use the `alt` tag to provide screen readable captions for images that do not have a caption.
* If images have a caption, they do not need `alt` text. To make sure that browsers know this, specify `alt=""`
* Make sure to prepend image path with `{{ site.baseurl }}` to ensure that the file path is pointed to the correct spot.
* Add the `.image-shadowed` CSS class to give your image depth
{% endcapture %}
{% include details-code.html
   title='image_captions'
   description=image_description
   content=image_captions
   lang='html'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/blog-post.scss'
%}

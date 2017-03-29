---
title: 18F UI style guide
subpage: Blog images
permalink: /styleguide/blog-images/
image: /assets/img/page-feature/hire-us.jpg
image_alt: Example of hero image
image_figcaption: Hero image with caption
---

There are a few ways we render images on the blog: Hero images that span the entire page, in text images without captions, and in text images with captions.

### Hero image with captions

{% capture hero_caption %}{% raw %}
{% include feature-image.html %}
{% endraw %}{% endcapture %}

{% capture hero_description %}
Feature images are used used in the `default-intro` and `post` layouts. `default-intro` is the primary layout used throughout the site and `post` is the layout used for blog posts.

If using a layout that needs a feature image, specify the path to the image url with the `image` attribute.

When the image is loaded on to the page, it will be given the CSS class `.post-feature_image`. This will ensure that the image spans the entire width of its surrounding element.
{% endcapture %}

{% include details-code.html
   title='hero-caption'
   description=hero_description
   content=hero_caption
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



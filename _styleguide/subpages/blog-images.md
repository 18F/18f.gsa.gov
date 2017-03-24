---
title: 18F UI style guide
subpage: Blog images
permalink: /styleguide/blog-images/
image: /assets/img/page-feature/join.jpg
image_alt: Example of hero image
image_figcaption: Caption
---

### Hero image with captions

{% capture hero_caption %}{% raw %}
{% include feature-image.html %}
{% endraw %}{% endcapture %}

{% capture image_description %}
Feature images are used used in the `default-intro` and `post` layouts. `default-intro` is the primary layout used throughout the site and `post` is the layout used for blog posts.

If using a layout that needs a feature image, specify the path to the image url with the `image` attribute.
{% endcapture %}

{% include details-code.html
   title='hero-caption'
   description=image_description
   content=hero_caption
   lang="html"
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/blog-post.scss'
%}

### Images with no captions
{% capture image_captions %}{% raw %}
<img src="{{site.baseurl}}/assets/blog/web-design-standards/template-landing.png" style="box-shadow:0px 4px 10px rgba(0, 0, 0, 0.3);" alt="home page of the Draft U.S Web Design Standards">

### Images with captions
<figure>
  <img src="{{site.baseurl}}/assets/blog/content/gds-content-ux.jpg" alt="">
  <figcaption>The UK Government Digital Service's "Content is user experience" poster.</figcaption>
</figure>

<figure>
  <img src="{{ site.baseurl }}/assets/blog/denver/gallery-41.jpg" alt="">
  <figcaption>This long hallway has public art from local artists hanging in it. This is part of the GSA's <a href="http://www.gsa.gov/fa/">Fine Arts Program.</a> Photo courtesy: GSA PBS Region 8</figcaption>
</figure>
{% endraw %}{% endcapture %}

{% capture image_description %}
There are a few ways we render images on the blog: Hero images, in text images without captions, and in text images with captions. To add images to a blog post:
* We use `<figure>` and `<figcaption>` tags to set styles
* We use the `alt` tag to provide screen readable captions for images that do not have a caption.
* When specifying the image path use `{{ site.baseurl }}`
{% endcapture %}
{% include details-code.html
   title='image_captions'
   description=image_description
   content=image_captions
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/blog-post.scss'
%}



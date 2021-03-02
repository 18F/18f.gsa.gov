---
title: 18F site style guide
subpage: Blog
permalink: /styleguide/blog-components/
tags:
  - web design standards
  - design
  - open source
image: /assets/blog/join-us/18F-IRL-2016.jpg
image_figcaption: The 18F team gathered in the GSA building in May 2016.
---

### Post previews

Post previews are seen on the home page of [18f.gsa.gov](https://18f.gsa.gov/) and at the bottom of every blog post for example, [this post](https://18f.gsa.gov/2017/03/21/nasa-journey-with-us-web-design-standards/). This feature provides the user a preview of a blog that includes the publish date, title, an excpert, a link to the full post, and tags.

### Blog tags

{% capture styleguide_blog_tags %}{% raw %}
<section class="usa-grid-full">
  <span class="post-tags" itemprop="keywords">
    {% for tag in page.tags %}
      <a class="usa-label" href="{{ site.baseurl }}/{{ site.tag_dir }}/{{ tag | slugify }}/">{{ tag }}
      </a>
    {% endfor %}
  </span>
</section>
{% endraw %}{% endcapture %}

---

### Hero images

Hero images are used in the [primary]({{ site.baseurl }}/styleguide/layouts/#primary-template) and [blog post]({{ site.baseurl }}/styleguide/layouts/#blog-post-template) layouts.Here is a view of a [live example]({{ site.baseurl }}/2016/12/14/how-to-run-an-efficient-meeting/).

{% capture styleguide_hero_image %}{% raw %}
{% include feature-image.html %}
{% endraw %}{% endcapture %}

{% capture hero_description %}

If using a layout that needs a feature image, specify the path to the image url with the `image` attribute.

When the image is loaded on to the page, it will be given the CSS class `.post-feature_image`. This will ensure that the image spans the entire width of its surrounding element.

To add a caption, specify the `image_figcaption` attribute in the page front matter.
{% endcapture %}

{% include details-code.html
   title='hero-caption'
   description=hero_description
   content=styleguide_hero_image
   lang="html"
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_components/blog-post.scss'
%}
Images within blog posts

Images can be any visual that supports the content of the post. We often use screen shots of platforms, people active in an design thinking excercise or images of people and our team.  Below is an example of an image with a caption.

{% capture image_captions %}{% raw %}
<figure>
  <img src="{{ site.baseurl }}/assets/blog/denver/gallery-41.jpg" alt="">
  <figcaption>This long hallway has public art from local artists hanging in it. This is part of the GSA's <a href="http://www.gsa.gov/fa/">Fine Arts Program.</a> Photo courtesy: GSA PBS Region 8</figcaption>
</figure>
{% endraw %}{% endcapture %}

{% capture image_description %}
To add basic images to a blog post:

* Use `<figure>` tag for all blog images. To learn more about this tag go to [the developer page on mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure)
* Use `<figcaption></figcaption>` tags for image captions. This is a preferred practice but is optional.
* Use the `alt` tag to provide screen readable captions for images that do not have a caption.
* If images have a caption, they do not need `alt` text. To make sure that browsers know this, specify `alt=""`
* Make sure to prepend image path with `{{ site.baseurl }}` to ensure that the file path is pointed to the correct spot.
* Add the `class=image-shadowed` CSS class to give images with white backgrounds addition depth. [This blog post]({{ site.baseurl }}/2016/12/22/charting-the-future-of-the-draft-us-web-design-standards/) is a live example.
* If images are are small, use the `class="align-left"` example: `<figure class="align-left>`. [This blog post]({{ site.baseurl }}/2017/01/11/the-best-way-to-build-big-is-to-start-small/) is a live example.
{% endcapture %}
{% include details-code.html
   title='image_captions'
   description=image_description
   content=image_captions
   lang='html'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_components/blog-post.scss'
%}

---
title: 18F UI style guide
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

{% capture styleguide_post %}{% raw %}
<section class="usa-grid-full usa-section posts_feature">
  {% include post.html
    date='January 6, 2017'
    title='Dummy title'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
  {% include post.html
    date='January 7, 2017'
    title='Dummy title 2'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
  {% include post.html
    date='January 8, 2017'
    title='Dummy title 3'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
</section>
{% endraw %}{% endcapture %}
{% capture post_description %}
Post previews are generated dynamically throughout the site. Each preview requires a few attributes:
* `date`
* `title`
* `excerpt`
* `url`
{% endcapture %}
{% include details-code.html
   title='posts'
   description=post_description
   content=styleguide_post
%}

---

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

{% include details-code.html
   title='blog-tags'
   description="Blog tags are generated and draw from a post's `tags` property. Before you use a tag, make sure that it is in the [list of acceptable tags](https://github.com/18F/18f.gsa.gov/blob/main/tests/schema/tags.yml)."
   content=styleguide_blog_tags
%}

---

### Blockquotes

{% capture styleguide_blockquotes %}{% raw %}
#### Blockquote as markdown:
> I'm thankful for a safe workplace that encourages me to raise a hand for help...or a high five. — **Micah Taylor**

#### Our markdown blockquotes support line breaks:
> We recently welcomed the newest group of Presidential Innovation
> Fellows into the federal government. This diverse group represents
> some of the nation’s most talented and creative civic-minded
> innovators.
>
> More than a thousand candidates applied to serve the country in this
> unique capacity. From this pool of amazing and incredibly motivated
> applicants, we selected almost 30 designers, developers, entrepreneurs
> and executives to bring their unique skills into government.

#### Blockquote as HTML:
<blockquote>
  I’m thankful for how much I learn every week at 18F — from colleagues, agency partners, and the work itself. — <strong>Corey Mahoney</strong>
</blockquote>

#### Pull quotes with and without a team image:
<section class="usa-grid-full">
  <div class="pquote">
    {{ "shawn" | team_photo }}
    <blockquote>
  “I wanted a new challenge, and I wanted to learn from some of the best
  minds in design and technology.” - {{ "shawn" | team_link }}
    </blockquote>
  </div>
  <div class="pquote">
  {{ "laura-gerhardt" | team_photo }}
    <blockquote>
      “To work on how technology could improve government service delivery in a deeper way than just as a communications platform.” - {{ "laura-gerhardt" | team_link }}
    </blockquote>
  </div>
</section>
{% endraw %}{% endcapture %}

{% include details-code.html
   title='blockquotes'
   description="Our blockquotes use the `kramdown` renderer, so please defer to [the documentation](https://kramdown.gettalong.org/quickref.html#blockquotes) for details on markdown rendering issues. 18f.gsa.gov does, however, set styles that are unique to 18F Brand for both blockquotes and pull quotes."
   content=styleguide_blockquotes
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_components/blockquotes.scss'
%}

---

### Images

There are a few ways we render images on the blog: Hero images that span the entire page, within blog post, and team photos. For information on adding images to the site see:

- [Hero images]({{ site.baseurl }}/styleguide/blog-components/#hero-images)
- [Images in blog posts]({{ site.baseurl }}/styleguide/blog-components/#images-within-blog-posts)
- [individual team photos]({{ site.baseurl }}/styleguide/blog-components/#adding-a-team-photo)

---

### Hero images
Hero images are used in the [primary]({{ site.baseurl }}/styleguide/layouts/#primary-template) and [blog post]({{ site.baseurl }}/styleguide/layouts/##blog-post-template) layouts.Here is a view of a [live example]({{ site.baseurl }}/2016/12/14/how-to-run-an-efficient-meeting/).


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

---
### Images within blog posts

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

[See the code](https://github.com/18F/18f.gsa.gov/blob/main/_plugins/team.rb) to better understand what is going on.
{% endcapture %}

{% include details-code.html
   title='icon-list-catalog'
   content=icon_list_codeblock
   lang="markdown"
   description=icon_list_description
   other_ref='https://github.com/18F/18f.gsa.gov/tree/master/_plugins#team_photo-accepts-the-authors-name-as-the-first-argument-lives-in-teamrb'
%}

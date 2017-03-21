---
title: 18F UI style guide
subpage: Blog components
permalink: /styleguide/blog-components/
tags:
  - web design standards
  - design
  - open source
---

### Post previews

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
   description="Blog tags are generated and draw from a post's `tags` property. Before you use a tag, make sure that it is in the [list of acceptable tags](https://github.com/18F/18f.gsa.gov/blob/master/tests/schema/tags.yml)."
   content=styleguide_blog_tags
%}
---
## Blockquotes


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
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/blockquotes.scss'
%}


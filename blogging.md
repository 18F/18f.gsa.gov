## 18F Blogging Guide

This document describes 18F's blogging process (both policy and technical). 18F's blog is at `https://18f.gsa.gov/news/`, and is part of the overall 18F website.

Our blog uses Jekyll as a blogging framework, with substantial customizations and integrations added by the 18F team. (In other words, it won't run on GitHub Pages.)

### Overview of our blogging process

The process for writing and publishing an 18F blog post goes generally like this:

1. (Optional) Propose a blog post internally (not in this repo), and discuss what it might look like.
2. Draft a blog post (not in this repo) and present it internally.
3. When the blog post is ready to review for publication, create a new branch in this repository and add your post as a Markdown document **(more details below)**.
4. Submit an in-repo pull request that proposes merging your post from your new branch into the `staging` branch.
5. Nudge the powers that be to merge your pull request. This automatically deploys your post on the staging site.
6. Nudge the powers that be to merge your post from `staging` to `production`. This deploys the post automatically to the live site.

### Creating a new blog post file

Put draft posts that are ready for publication review in [`_posts/`](_posts). Use a filename that matches the example below. There should be a publication date and a unique slug.

For example, this filename:

```
_posts/2014-09-08-the-encasement-strategy-on-legacy-systems-and-the.md
```

Will yield a publication URL of:

```
https://18f.gsa.gov/2014/09/08/the-encasement-strategy-on-legacy-systems-and-the/
```

#### Start with metadata

Begin the new file by adding "YAML front-matter." This is where the post's title, authors, tags, banner image, and excerpt/description live.

Robert Read's [blog post on legacy systems](_posts/2014-09-08-the-encasement-strategy-on-legacy-systems-and-the.html) begins with metadata like this:

```yaml
---
layout: post

title: "The Encasement Strategy: On Legacy Systems and the Importance of APIs"

image: /assets/images/blog/encasement/encasement1.png

description: "In 1986 a nuclear reactor known as Chernobyl released harmful radioactivity which spread over much of the western USSR and Europe. The core of this reactor remains a glowing, ineradicable mass of deadly radioactive lava in the middle of a large Exclusion Zone unfit for human habitation."

authors:
- robert
- mhz

tags:
- API
- how we work
---
```

[Note that a post's excerpt and byline do not appear here &mdash; they are handled separately.]

Here's what each field means:

* `title` - The plain-text title of your post. Surround with quotation marks. This will be displayed prominently above the post, will show up in browser tabs, and will be included in "share text" when the link appears on Twitter, Facebook, and other social media platforms.
* `image` - The main image of your post. A relative link, with a leading `/`. This will appear in social media platforms when the post is shared. It can be a different image than those which appear embedded in your post.
* `description` - A short plain-text description of your post. Surround with quotation marks. No Markdown or HTML allowed. This does not need to be an excerpt, but instead can be a sentence or two that you feel represents your post well. It may appear next to your post on social media and other places which fetch article metadata.
* `authors` - A list of handles of teammates involved in authoring the post. They must all be lowercase, and must match a name that appears in [`_data/team.yml`](_data/team.yml) They do not necessarily have to be the same teammates that appear in the post's byline.
* `tags` - A list of tags to associate with the post. These will appear, linked, next to the post and will take readers to other posts that have this tag. Sentences (e.g. "how we work") are fine &mdash; there is no need to jam phrases into one word

#### Add blog post body

The **excerpt** and **byline** are handled in the body of your post.

**Byline.** The first paragraph in your post should be the byline. Place it in a `<p>` tag with a class of `"authors"`. Use the `{% author %}` tag with a teammate's handle (as it appears in [`_data/team.yml`](_data/team.yml)). **Author tags must use a valid handle**, or the site will fail to build.

[Robert's encasement post](_posts/2014-09-08-the-encasement-strategy-on-legacy-systems-and-the.html) uses this byline:

```html
<p class="authors">
  by {% author robert %} with illustrations by {% author mhz %}
</p>
```

After this, you can add the body of your post, ideally in Markdown.

**Excerpt.** Add an excerpt marker to your post by using a magic HTML comment, `<!-- more -->`. This magic marker tells Jekyll how long to make blog snippets (for example, the snippets under 'news' on our homepage) and if you leave it out your entire blog will load there instead ;) Excerpts always begin at the start of a post, and stop at `<!-- more -->`. Typically, the first few sentences or the first paragraph of your posts are good lengths to use as your excerpt. Excerpts can include Markdown and HTML.

The [EITI team's design studio post](_posts/2014-09-25-design-studio-onrr.md) uses this excerpt:

```markdown
On July 28, 18F kicked off a new project with the [Department of the Interior’s Office of Natural Resources Revenue](http://www.onrr.gov/) (ONRR).

Later this year, ONRR will be launching a new website — originally prototyped by Round 2 [Presidential Innovation Fellow](http://www.whitehouse.gov/innovationfellows/meet-the-fellows) Michelle Hertzfeld — to facilitate national and international conversation around U.S. extractive industries revenue. It will serve as a valuable resource for data and information about U.S. extractive industries on Federal land, and will also provide interactive visualizations that can be readily understood and accessed by the public for reuse through other media and applications.<!-- more -->
```

#### Link blog post assets

Unless there's an extremely compelling reason, **blog post resources should be committed to this repository**. This includes images, JavaScript, additional CSS, whatever.

This guarantees that our posts aren't disturbed by external changes, ensures we never suffer mixed content warnings or active content blocking, and increases our site's loading performance by keeping resources to a single domain.

This does not apply to embedded widgets, like tweets or YouTube videos.

If your blog post uses assets, then:

* **Make a new asset directory** in the [`assets/blog/`](assets/blog) directory, like this:

```
assets/blog/eiti/
```

* **Put images and assets into this directory**, like so:

```
assets/blog/eiti/eiti1.jpg
```

* **Use relative links in posts**, with a leading slash and a title attribute, like this:

```markdown
![photo: team creating personas](/assets/blog/eiti/eiti1.jpg)
```

or in HTML:

```html
<img src="/assets/blog/eiti/eiti1.jpg" title="photo: team creating personas" />
```

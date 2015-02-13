## 18F Blogging Guide

This document describes 18F's blogging process (both policy and technical). 18F's blog is at `https://18f.gsa.gov/news/`, and is part of the overall 18F website.

Our blog uses Jekyll as a blogging framework, with substantial customizations and integrations added by the 18F team. (In other words, it won't run on GitHub Pages.) More on that [in this blog post.][1]

## How to write a blog post

We've tried to streamline the blogging process into just a few easy steps: [plan](#1.-plan), [write](#2.-write), [review](#3.-review).

> Before you get started, or at any time dring this process we encourage you to attend one our our weekly **blogging huddles** on Tuesdays at 2:30 (or 1:30 Chicago, 12:30 Denver, 11:30 San Francisco). If you want some help with a post or just want to chat about an idea, [grab one of the appointment slots][2]. If you can't make it, reach out to us on Slack. We're here to help.

### 1. Plan

If you have an idea you're ready to write about, great. The first step is making an appointment on the [Editorial Calendar][3] on the day you want to publish the post. (let the blog team know on Slack if you have problems with that). We can always move it if we need to, but think of this as setting your own deadline.

If you have an idea but aren't ready to write it or don't have time to write it, let us know by making an issue in the [blog-drafts repo on GitHub][4].

## 2. Write

After you make an appointment the team will take care of all the process _stuff_ for you and let you focus on writing. We don't really care what format you write in during the drafting stage but eventually we need a Google Document to send to GSA Comms for review (so it might make the most sense to start there).

## 3. Review

Once you start writing the Blog Team will send you a link to an issue in GitHub for your post. When you have a draft you're ready for feedback on, whether it is final approval or you want our take on your progress, drop a link in there and we'll be glad to help. When your final draft is ready to publish we'll send it to GSA Comms for review.

Once your post is ready to publish, we'll convert the Google Doc into Markdown for you (or you can do it yourself if you'd like), and open a pull request to [18f.gsa.gov][5] to stage the post for publication. 

That's it! We may ask you a few questions or have some minor edits, but your job is done! You can stop reading here if you want!.

The rest of this document has instructions for creating the markdown file and pointers on how to format the HTML.

**Most important bullet points:**

* Blog posts are published in Markdown.
* Don't [hot link](https://en.wikipedia.org/wiki/Inline_linking) to 3rd-party assets.
    * All images embedded in posts or referenced in metadata need to be **added to this repository**.
* Each post needs some 18F-specific metadata in the front-matter: author names, tags, a short description, etc.
* We deploy automatically through pull requests. That means **every pull request to production gets two sets of eyes**, where one of them is someone on the 18f.gsa.gov team other than the author. No exceptions: if it's time sensitive, start IMing or texting people.
* We're an AP writing style shop. The grammar-inclined among us will try to review your work before live, but definitely ask the internet about proper AP solutions if you run up against a "one space after a period or two" sort of question.

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

**Excerpt.** Add an excerpt marker to your post by using a magic HTML comment, `<!-- more -->`. This marker _must be on its own line_. This magic marker tells Jekyll how long to make blog snippets (for example, the snippets under 'news' on our homepage) and if you leave it out your entire blog will load there instead ;) Excerpts always begin at the start of a post, and stop at `<!-- more -->`. Typically, the first few sentences or the first paragraph of your posts are good lengths to use as your excerpt. Excerpts can include Markdown and HTML.

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

[1]:
[2]: https://www.google.com/calendar/selfsched?sstoken=UUN0WjhISnV1SjV5fGRlZmF1bHR8MzlmYzRjOTg5YWZmZGI3MDEwMzY1M2NiZjU4MjU2Yzk
[3]: 
[4]: 
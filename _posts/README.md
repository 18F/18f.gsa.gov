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

After you make an appointment the team will take care of all the process _stuff_ for you and let you focus on writing. We might contact you and ask some questions about your post and we're always available to help you write.

We don't really care what format you write in during the drafting stage but _eventually we need a Google Document to send to GSA Comms for review_ (so it might make the most sense to start there).

## 3. Review

Once you start writing the Blog Team will send you a link to an issue in GitHub for your post. When you have a draft you're ready for feedback on, whether it is final approval or you want our take on your progress, drop a link in there and we'll be glad to help. When your final draft is ready to publish we'll send it to GSA Comms for review.

Once your post is ready to publish, we'll convert the Google Doc into Markdown for you (or you can do it yourself if you'd like), and open a pull request to [18f.gsa.gov][5] to stage the post for publication.

That's it! We may ask you a few questions or have some minor edits, but your job is done! You can stop reading here if you want.

The rest of this document has instructions for creating the markdown file and pointers on how to format the HTML.

**Most important bullet points:**

* Blog posts need to be written in Markdown before publishing.
  * Tools like [Pandoc][6] and [Gdocs2md][7] might help convert between file types
* Pull requests should be issued to the `staging` branch from another branch
  * All images embedded in posts or referenced in metadata need to be **added to the repository**, i.e., don't [hot link][8] to 3rd-party assets.
* Each post needs some 18F-specific metadata in the front-matter: author names, tags, a short description, etc. (see below)
* We deploy automatically through pull requests. That means **every pull request to production gets two sets of eyes**, where one of them is someone on the 18f.gsa.gov team other than the author. No exceptions: if it's time sensitive, start IMing or texting people.
* We're an AP writing style shop. The grammar-inclined among us will try to review your work before live, but definitely ask the internet about proper AP solutions if you run up against a "one space after a period or two" sort of question. (The answer is one space, not two. :wink:)

### Creating a new blog post file

To create a new blog post,  save your post in the [`_posts` directory](https://github.com/18F/18f.gsa.gov/tree/staging/_posts) with the name `2015-02-23-new-post.md` where '2015-02-23' is today's date and `new-post` is the title of your post. Detailed instructions, along with screenshots, are located in [our blogging and Github tutorial](https://18f.gsa.gov/2015/03/03/how-to-use-github-and-the-terminal-a-guide/#edit-and-commit-a-blog-post).

#### Metadata, explained

Begin the new file by adding "YAML front-matter." This is where the post's title, authors, tags, banner image, and excerpt/description live.

Here each required field:

* `title` - The plain-text title of your post. Surround with quotation marks. This will be displayed prominently above the post, will show up in browser tabs, and will be included in "share text" when the link appears on Twitter, Facebook, and other social media platforms.
* `image` - The main image of your post. A relative link, with a leading `/`. This will appear in social media platforms when the post is shared. It can be a different image than those which appear embedded in your post.
* `description` - A short plain-text description of your post. Surround with quotation marks. No Markdown or HTML allowed. This does not need to be an excerpt, but instead can be a sentence or two that you feel represents your post well. It may appear next to your post on social media and other places which fetch article metadata.
* `excerpt` - A short plain-text snippet of the post to use as the "nut graf" that appears on the home page.
* `authors` - A list of handles of teammates involved in authoring the post. They must all be lowercase, and must match a name that appears in [`_data/team.yml`](_data/team.yml) They do not necessarily have to be the same teammates that appear in the post's byline.
* `tags` - A list of tags to associate with the post. These will appear, linked, next to the post and will take readers to other posts that have this tag. Sentences (e.g. "how we work") are fine &mdash; there is no need to jam phrases into one word


Robert Read's [blog post on legacy systems](_posts/2014-09-08-the-encasement-strategy-on-legacy-systems-and-the.html) begins with metadata like this:

```yaml
---
layout: post

title: "The Encasement Strategy: On Legacy Systems and the Importance of APIs"

image: /assets/images/blog/encasement/encasement1.png

description: "In 1986 a nuclear reactor known as Chernobyl released harmful radioactivity which spread over much of the western USSR and Europe. The core of this reactor remains a glowing, ineradicable mass of deadly radioactive lava in the middle of a large Exclusion Zone unfit for human habitation."

excerpt: "In 1986 a nuclear reactor known as Chernobyl released harmful radioactivity which spread over much of the western USSR and Europe. The core of this reactor remains a glowing, ineradicable mass of deadly radioactive lava in the middle of a large Exclusion Zone unfit for human habitation."

authors:
- robert
- mhz

tags:
- API
- how we work
---
```

[Note that a post's byline do not appear here &mdash; they are handled separately.]

#### Add blog post body

The **byline** is handled automatically.

After this, you can add the body to the post.

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

[1]: https://18f.gsa.gov/2014/11/17/taking-control-of-our-website-with-jekyll-and-webhooks/
[2]: https://www.google.com/calendar/selfsched?sstoken=UUN0WjhISnV1SjV5fGRlZmF1bHR8MzlmYzRjOTg5YWZmZGI3MDEwMzY1M2NiZjU4MjU2Yzk
[3]: https://www.google.com/calendar/embed?src=Z3NhLmdvdl9wa2tiZjUzdTFtNmlzOWdpNzZ2MWw4aTVqOEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t
[4]: https://github.com/18F/blog-drafts/issues/new
[5]: https://github.com/18F/18f.gsa.gov
[6]: http://johnmacfarlane.net/pandoc/
[7]: https://github.com/mangini/gdocs2md
[8]: https://en.wikipedia.org/wiki/Inline_linking
[9]: https://github.com/18F/18f.gsa.gov/blob/staging/script/post

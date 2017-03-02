<!-- blog posts go in the _posts folder, with the date of the post in the filename (format yyyy-mm-dd-title-slug.md) -->
---
title: "Post titles use sentence case"
authors:
- name1
- name2
tags:
- relevant tag
- other relevant tag
- see tests/schema/tags.yml if you need a list
excerpt: "Excerpt, possibly lightly edited, about 300-400 characters. This should help potential readers understand what the article is about and make them want to keep reading. This will be shown on the 18F homepage, tag and author rollup pages, and sometimes project pages. You can't use any Markdown here."
image: /assets/blog/[post-folder]/[filename]
hero: false (if the image above should not be used full-width on the post page)
published: false
---
18F ipsum dolor amet user-centered [this is a link](https://code.gov) design agency partners test driven development. Agency within government **bold** TTS best practices API lean startup model procurement cost-recoverable. Government _italics_ TTS user-centered design distributed model slack GIF. Cupim GIF government user-centered open transparency 18F.

![This is an image with no caption. Put the alt text here in the square brackets.]({{site.baseurl}}/assets/blog/[post-folder]/[filename])

<!-- For all figures, replace the alt, src, width, and figcaption -->

<!-- Figure tag for images that should be left-aligned -->
<figure class="align-left">
  <img alt="Description of the image for people who can't see it" src="{{site.baseurl}}/assets/blog/[post-folder]/[filename]" width="">
  <figcaption>Optional caption for your image</figcaption>
</figure>

<!-- Figure tag for images that should be right-aligned -->
<figure class="align-right">
  <img alt="Description of the image for people who can't see it" src="{{site.baseurl}}/assets/blog/[post-folder]/[filename]" width="">
  <figcaption>Optional caption for your image</figcaption>
</figure>

<!-- Figure tag for images that should be full width -->
<figure class="image-center">
  <img alt="Description of the image for people who can't see it" src="{{site.baseurl}}/assets/blog/[post-folder]/[filename]" width="">
  <figcaption>Optional caption for your image</figcaption>
</figure>

## Header level two

Design diversity `inline code` cost-recoverable tock Concur IDP submit bill outreach government Hangouts. Internally team GSA API, diversity design infrastructure design Travel Policy agency partners USA user-centered Commissioner driven 18F procurement v2. Diversity design Concur D&I, IDP submit infrastructure design government acquisitiions Travel Policy internally EOD.

Code block:

```
Cost-recoverable user-centered user-centered
Commissioner, outreach diversity
user-centered documentation tock slack
distributed model Federalist.
Travel Policy agency API service
engagement cost-recoverable GSA API.
```

- An unordered list
- With several useful items
- Makes them easy to skim

### Header level three

Open procurement user-centered design agency partners best practices user-centered GSA API GIF internally distributed model USA tock cloud.gov government TTS. Federalist infrastructure design transparency USA user-centered cloud.gov analytics agency All Hands PIF outreach. Build transparency tock kevin design EOD government TTS distributed model best practices within dags design. Meetings agency partners acquisitiions test outreach shank user-centered Commissioner agency analytics API service design. Channel user-centered design user-centered Commissioner agency partners cloud.gov lean startup model GSA API. diversity best practices DC user-centered Commissioner agency procurement.

1. Ordered lists can help
2. If you've got sequential steps
3. Or other ordered items

## Please use sensible header order

Team agile slack diversity Travel Policy. Doner agency partners acquisitiions design API service. Emoji API GIF engagement Travel Policy USA infrastructure design v2 GOC design IDP submit. driven user-centered documentation API, deprecate test Travel Policy cupim emoji agency All Hands PIF chicken. Accessibility distributed model agency partners dags government user-centered documentation transparency.

Block quotes look like this:

> Team agile slack diversity Travel Policy. Doner agency partners acquisitiions design API service. Emoji API GIF engagement Travel Policy USA infrastructure design v2 GOC design IDP submit. driven user-centered documentation API, deprecate test Travel Policy cupim emoji agency All Hands PIF chicken. Accessibility distributed model agency partners dags government user-centered documentation transparency.

Embeds look like this:

{% oembed https://twitter.com/corizarek/status/593525117210103809 %}

If the URL to be embedded is a protected URL, you may need to add raw HTML. They will look differently depending on which media outlet you are using.

Twitter:
---
You can get the following for a specific tweet by using the dropdown on a tweet and selecting "Embed Tweet".

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/18F">@18F</a>  Cool - I hand-wrote something like this at my previous job, but generalized OSS is much better! <a href="https://twitter.com/acdha">@acdha</a> <a href="https://twitter.com/catherinedevlin">@catherinedevlin</a></p>&mdash; Jamie McCarthy (@jamiemccarthy) <a href="https://twitter.com/jamiemccarthy/status/555498540466593793">January 14, 2015</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Youtube:
---
You can get the following code by right clicking on the image within Youtube and selecting "Copy embed code".

<iframe width="620" height="349"
src="https://www.youtube.com/embed/mO8PiHST5CI?start=159"
frameborder="0" allowfullscreen></iframe>

Speakerdeck:
---

The embed link is located under Share as an `</> Embed` link.

<script async class="speakerdeck-embed" data-id="5604c360b9ea01313bb0227341532047" data-ratio="1.33333333333333" src="https://speakerdeck.com/assets/embed.js"></script>

### It's a best practice for accessibility

Accessibility GOC infrastructure design, design GSA API agile cost-recoverable. Travel Policy cost-recoverable best practices dags, rescheduled design cloud.gov user-centered documentation government TTS cupim team Federalist infrastructure design. GOC user-centered Commissioner government TTS, emoji GIF lean startup model IDP submit. Chicken tock diversity acquisitiions rescheduled, https Federalist. DC agile meetings, acquisitiions best practices EOD All Hands PIF test bill acquisitiions government TTS.

-----

Sometimes we use rules like that one to set off a postscript.

---
title: Why we’re moving 18f.gsa.gov to Federalist
authors:
- boone
tags:
- 18f.gsa.gov
- federalist
- how we work
description: "We want 18f.gsa.gov to be an exemplar of what 18F can do for partner agencies. One way to do that is to host it the way we’d host a similar site for a partner agency, and that means moving to Federalist."
excerpt: "We want 18f.gsa.gov to be an exemplar of what 18F can do for partner agencies. One way to do that is to host it the way we’d host a similar site for a partner agency, and that means moving to Federalist."
---

One of the first things I did at 18F was work with a few others to
migrate our blog from Tumblr and [build the whole site, with Jekyll, on
our
servers]({{ "/2014/11/17/taking-control-of-our-website-with-jekyll-and-webhooks/" | url }}).
We wanted to ensure our readers were getting high quality content and
that it’s served to them in a consistent, stable, and trustable
environment. About a year and a half later, we’re taking a second look
at 18f.gsa.gov. We want this site to be an exemplar of what 18F can do
for partner agencies. One way to do that is to host it the way we’d host
a similar site for a partner agency, and that means moving to
Federalist.

The Federalist platform
-----------------------

[As we wrote in
September]({{ "/2015/09/15/federalist-platform-launch/" | url }}),
Federalist is “glue that ties a lot of already-existing platforms
together.” [We built Federalist in
house]({{ "/2015/10/06/how-we-start-a-new-project/" | url }}) to
provide federal clients with a robust experience for hosting very simple
websites like the [Social and Behavioral Sciences
Team](https://sbst.gov), [Not Alone](https://notalone.gov), the
[2015 USEITI report](https://useiti.doi.gov), and [College
Scorecard](https://collegescorecard.ed.gov/). All of those sites are
18F projects, all of them are hosted on Federalist, and all of them are
very similar to this website: content-heavy sites with a relatively
straightforward underlying web framework.

Federalist more or less abstracts a lot of tech away from us, allowing
us to focus on the writing, editing, and designing of the site. It also
comes with some excellent features we’ve wanted for a long time, and a
team dedicated to maintaining and improving the platform going forward.

Tradeoffs of moving to Federalist
---------------------------------

We don’t currently have a reliable way of previewing the post before
publication. Now, we can get a rough idea by [looking at the markdown
on
GitHub](https://github.com/18F/18f.gsa.gov/blob/staging/_posts/2016-01-11-introducing-the-css-coding-style-guide.md),
but we don’t know how it will look on our site until we merge a pull
request to the staging branch. With Federalist, we get a preview URL for
every post, which should simplify our publishing process.

One major tradeoff of moving to Federalist is losing the ability to
implement new standards. On Blue Beanie Day 2015, we announced
18f.gsa.gov was running HTTP/2, the [latest and greatest (and fastest)
HTTP there is](https://http2.github.io/). We won’t be able to do that
until [CloudFront supports HTTP/2](https://forums.aws.amazon.com/thread.jspa?threadID=173140).

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">We&#39;ve rolled out HTTP/2 support for <a href="https://t.co/4qwKpDGWye">https://t.co/4qwKpDGWye</a>, and we are loving it!<br><br>Ever forward. <a href="https://twitter.com/hashtag/bbd15?src=hash">#bbd15</a> <a href="https://t.co/ZSehetnGBD">pic.twitter.com/ZSehetnGBD</a></p>&mdash; 18F (@18F) <a href="https://twitter.com/18F/status/671435022667227138">November 30, 2015</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Despite our site not being able to implement this standard, the upshot
is that once we can, every site on Federalist can (and maybe even every
site on cloud.gov). This is an example of the network effect we can be
part of by using Federalist. Every time we add new sites to the
platform, find a bug or help implement a feature like HTTP/2, the
other sites benefit from that work. In the meantime, our users can still
browse our site securely by default.

We’ll explain more about how Federalist works, and how we’re building
18f.gsa.gov, in greater technical detail in future posts. For now, know
that 18f.gsa.gov is served the same as many of our partner agency sites.

---
title: "Micro-purchase auctions round 2: What we learned"
date: 2016-01-15
authors:
- vdavez
tags:
- micro-purchase platforms
- procurement
- acquisition services
- open source
excerpt: "The auctions have closed, the bids are in, the winners are off coding, and some already have been paid. Let’s look at some early lessons from our latest round of micro-purchase auctions."
description: "The auctions have closed, the bids are in, the winners are off coding, and some already have been paid. Let’s look at some early lessons from our latest round of micro-purchase auctions."
image: /assets/blog/micro-purchase/closed-auctions.jpg
hero: false
---

{% image "assets/blog/micro-purchase/closed-auctions.jpg" "A screenshot of two closed auctions" %}

The auctions have closed, the [bids are
in](https://micropurchase.18f.gov/), the [winners are off
coding](https://github.com/18F/micropurchase/issues/217#issuecomment-171616476),
and some already [have been
paid](https://twitter.com/18F/status/687389170717863937). Let’s look at
some early lessons from our [latest round of micro-purchase
auctions](https://micropurchase.18f.gov/).

First, some numbers.

-   We conducted **five simultaneous auctions.**
-   The auctions addressed issues in **two [internal 18F projects](https://github.com/18F/tock), including the [micro-purchase platform](https://github.com/18F/micropurchase/) itself**.
-   We received **59 bids.**
-   The lowest winning bid was **$249** and the highest winning bid was **$399**.
-   **Each auction had three or more unique bidders**, with one auction having six unique bidders.
-   **All winners were small businesses**, and one winning bidder is a service-disabled veteran-owned small business.

When we launched [our initial micro-purchase
experiment]({{ "/2015/10/26/micro-purchase-criteria-announcement/" | url }}),
we envisioned it as a low-risk, lightweight way to get new vendors
working with the government on open source solutions to small problems
that would be too cumbersome to address with traditional contracting
methods. This round of auctions continues to support our hypothesis that
providing a lower barrier to working with the government will attract
new vendors and provide tangible benefits to government agencies.

One of the big lessons from our first experiment was that to grow this
project, we needed a better way for vendors to bid on auctions. In the
first round, vendors had to use a Google Form to bid and a GitHub issue
to track the auction. That system was a workable minimum viable product,
but for this round of auctions, our team built a brand-new
[micro-purchase
platform]({{ "/2016/01/07/announcing-the-18f-micro-purchase-platform/" | url }})
that we hoped would be more intuitive for vendors and easier for the
public to navigate.

We’re pleased with the performance of the new platform, though we did
have [one bug](https://twitter.com/18F/status/686662551661359104) that
was accidentally recording $1,000 bids as $1 bids. (It truncated
everything after a comma.) We’ve fixed that issue and are now making
additional improvements to the platform. In fact, two of the auctions in
this round were for issues with the micro-purchase platform itself, and
[a solution to one of those
auctions](https://github.com/18F/micropurchase/pull/237) was submitted
and accepted less than 24 hours after the auction closed.

We were also pleased to see a wider range of winning bids in this round.
Our first micro-purchase auction ended in a [$1 winning
bid]({{ "/2015/11/06/micro-purchase-lessons/" | url }}), but this
round’s winners bid between $200 and $400. This provides more evidence
that there’s a market for small open source tasks and an interested and
talented pool of vendors ready to get involved.

What’s next
-----------

As we continue to experiment with ways to get the vendor community
involved, we’ll also explore new models beyond a reverse auction. We
liked the data points we saw this time around, and think that we can
make the system more attractive to use. But we still have a lot to learn
about how to really make this sustainable.

Please sign up for our [18F Acquisition email
list](http://eepurl.com/bJQHFr) to stay up to date and follow updates
through our [@18F Twitter account](https://twitter.com/18F/).

And as always, we’ll share as we continue to experiment, learn, and
iterate.

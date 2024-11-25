---
title: "When a micro-purchase doesn’t work out, we try to learn from it"
authors:
- michael-torres
- vdavez
tags:
- micro-purchase platforms
- acquisition services
- agile
- how we work
- lessons learned
excerpt: "Two months ago, the 18F acquisitions team ran a public micro-purchase
auction to find a vendor to develop a small new feature for 18F's cloud.gov, and for the first time after several successful micro-purchases for other products, the contracted vendor didn’t deliver the code on time. This was very interesting to us we’re early in the life of the micro-purchase platform, and we believe that failure is a great way to learn. In the spirit of experimentation and sharing our lessons, here’s how we went about analyzing this, and here’s what we learned."
description: "Two months ago, the 18F acquisitions team ran a public micro-purchase
auction to find a vendor to develop a small new feature for 18F's cloud.gov, and for the first time after several successful micro-purchases for other products, the contracted vendor didn’t deliver the code on time. This was very interesting to us we’re early in the life of the micro-purchase platform, and we believe that failure is a great way to learn. In the spirit of experimentation and sharing our lessons, here’s how we went about analyzing this, and here’s what we learned."
---

Two months ago, the 18F acquisitions team ran a public [micro-purchase
auction](https://micropurchase.18f.gov/) to find a vendor to develop
[a small new feature](https://micropurchase.18f.gov/auctions/24) for
18F's [cloud.gov](https://cloud.gov/), and for the first time after
several successful micro-purchases for other products, the contracted
vendor didn’t deliver the code on time. This was very interesting to us
— we’re [early in the life of the micro-purchase
platform]({{ "/tags/micro-purchase-platforms/" | url }}), and we
believe that failure is a great way to learn. In the spirit of
experimentation and sharing our lessons, here’s how we went about
analyzing this, and here’s what we learned.

Learning through doing
----------------------

In brief, the way a micro-purchase auction works is that 18F identifies
a task (a public GitHub issue in an open source project) for auction and
sets a starting price as high as $3500. We advertise this opportunity
to vendors who have registered on our platform, and the vendors bid
against each other during a short bid period. The lowest bid wins the
auction.

[This task](https://github.com/18F/cg-atlas/issues/19) had very clear
acceptance criteria, and we gave the winning bidder a week to deliver
the code. Things looked positive, given that the vendor seemed motivated
to deliver and appeared to have the technical wherewithal to get it
done. But it didn’t work out as we’d hoped, and the vendor didn’t
deliver the code on time. This means that we didn’t pay the vendor, and
we didn’t get the new feature that we wanted. Our goal is to set up the
customer and the vendor for success, so we wanted to get to the bottom
of this.

Failing is important
--------------------

We welcome the opportunity to gain insight from any situation that
didn’t work out as we’d expected. Especially early on in the life of our
platform ([launched in October
2015]({{ "/tags/micro-purchase-platforms/" | url }})), we need to
welcome these kinds of experiences because we’re still trying to
understand all of the conditions and variables we contend with whenever
we run an auction.

Talking it through
------------------

To this end, we scheduled an [Agile
retrospective](https://www.scrumalliance.org/community/articles/2014/april/key-elements-of-sprint-retrospective)
(a friendly discussion of what went well, what went wrong, and what
could be improved) with all parties: the cloud.gov team, the
micro-purchase team, and the vendor who worked on the task. Because
micro-purchases involve targeted tasks and timeframes that are basically
short sprints, an Agile retrospective is the perfect way to get the data
we need. We plan to make this a normal part of our process going forward
so that we can learn from our mistakes and improve the platform together
with vendors and customers.

We started the half hour Google Hangout call by acknowledging the
[“retrospective prime
directive”](http://retrospectivewiki.org/index.php?title=The_Prime_Directive),
a reminder that that this kind of meeting isn’t about assigning blame,
but instead about considering what happened and how to improve. We
aligned on the following problem statement:

> The cloud.gov AWS SQS broker auction was not delivered in the
> allotted delivery timeframe as we expected it would be based on the
> requirements.

And, we employed the “[5
Whys](https://www.isixsigma.com/tools-templates/cause-effect/determine-root-cause-5-whys/)”
technique to get to the root cause. Here’s what what we learned:

1.  Why 1: There was a lot more friction/tech debt uncovered when the
vendor started work, which made it difficult to make the
deliverable behave the way we wanted it to without a lot of
refactoring.

2.  Why 2: This led to much more back and forth than anticipated as we
worked with the vendor to figure out the problem.

3.  Why 3: No one anticipated this result because the context of the
ask (the reasons behind the recommended implementation) was not
clear until the winning vendor started work.

4.  Why 4: The vendor waited until after the auction ended to ask
about context and this added to the delay.

5.  Why 5: The vendor did this because he didn’t want to give any
other bidders a heads up.

6.  Why 6 (bonus!): The vendor didn’t want to give other vendors a
heads up, as he believed this would potentially cause them to
change their floor bid and outbid him at the last minute.

Our takeaways
-------------

1.  **Context is important:** Detailed acceptance criteria and a clear
definition of done will usually be enough detail, but in some
cases, context is also important. In this case, we were not clear
about why we wanted the suggested implementation, and this caused
delays in delivery.

2.  **Vendors take risks too:** Before even placing a bid, vendors have
already done work to estimate the size of the ask. And, when when
we make updates, they have to update their estimates. They
hesitate to ask us for additional details as they’re concerned
about tipping off their competition.

Next steps
----------

The cloud.gov team decided not to rerun this particular auction for
unrelated reasons, but we’ll be more explicit about context in future
auctions. We’ll also continue to have retrospectives for failed auctions
so we can learn from our customers and vendors and grow the platform
together. We want to find that sweet spot for both the customers and
vendors to ensure that we have a formula for successful auctions.

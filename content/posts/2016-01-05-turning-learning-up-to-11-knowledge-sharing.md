---
title: "Turning learning up to 11: Knowledge sharing"
date: 2016-01-05
authors:
- mbland
tags:
- how we work
- best practices
- communication tools and practices
- guides

excerpt: "The internal knowledge-sharing initiatives we’re working on are also
of immediate benefit to other organizations, and will maximize our
impact on government IT beyond product delivery."
description: "In the third post in our series on how transparency,
autonomy, and collaboration produce
organizational culture change, we describe other
knowledge-sharing initiatives we’re working on that we believe are also
of immediate benefit to other organizations, and will maximize our
impact on government IT beyond product delivery."
image: /assets/blog/turn-up-to-11/turn-up-to-11.jpg
---

In the [first post of this
trilogy]({{ "/2015/12/30/turning-learning-up-to-11/" | url }}), I
summarized my DevOps Enterprise 2015 talk that focused on transparency,
autonomy, and collaboration as primary factors in producing
organizational culture change. In the [second post]({{ "/2016/01/04/turning-learning-up-to-11-transparency/" | url }}), I described a few of
the initiatives we’ve undertaken to increase transparency into 18F’s
internal operations, which we hope will inspire other organizations to
follow suit. In this final post of the trilogy, I’ll describe other
knowledge-sharing initiatives we’re working on that we believe are also
of immediate benefit to other organizations, and will maximize our
impact on government IT beyond product delivery.

Working Groups and Guilds
-------------------------

We have a thriving ecosystem of internal volunteer groups, known as
[working groups and guilds](https://pages.18f.gov/grouplet-playbook/)
(aka “grouplets”), dedicated to a diverse array of organizational
concerns. The Documentation Working Group in particular has helped many
of these groups become more productive and visible thanks to the [18F
Guides](https://guides.18f.gov/) vehicle. In terms of software
products, the [Agile Guild](https://pages.18f.gov/agile/) is currently
leading the effort to enhance our externally facing 18F
Dashboard (link removed), and the [Testing
Grouplet](https://pages.18f.gov/wg-testing/) has prototyped an
internally facing dashboard for the code health of our projects. As
mentioned in the previous post, our Hub, Handbook, .about.yml standard,
and Team API projects were all spawned from working group activity, and
are now all staffed with an official product team.

One of the tricky aspects of grouplet activity is measuring whether your
work is having any impact on the organization. Many groups have begun to
establish quarterly [Objectives and Key Results (OKRs)](https://pages.18f.gov/grouplet-playbook/processes-and-artifacts/#okrs),
and the [User Research
Guild](https://pages.18f.gov/lean-product-design/) has contributed a [draft
guide to creating OKRs](https://pages.18f.gov/objectives-and-key-results/) to help us focus on
measurable outcomes. We’re also in the process of building an alliance
between product managers and each of the grouplets. We hope to cultivate
a dynamic whereby product managers can become better informed on each
grouplet’s chosen topic, and in return, product managers can gather
feedback from their teams that they can relay to the grouplets. This
information will help the grouplets gauge their impact on an ongoing
basis. It will also help the grouplets identify specific needs of 18F
projects, so that they can work to better serve those needs.

All of these efforts are still in their early stages, but the amount of
activity is promising. By getting the people who are passionate about
particular issues to seek creative solutions to challenging problems,
we’re creating the environment that will eventually produce insights and
breakthroughs that benefit not just 18F, but hopefully like-minded
instigators at other federal agencies who are facing similar challenges.
(Likewise, we hope to steal and adapt as many ideas from other agencies
as we can!)

18F Pages and 18F Guides
------------------------

Since [launching our 18F Pages service in
May]({{ "/2015/05/14/18Fpages/" | url }}), many groups within 18F
have taken advantage of the platform to produce [18F
Guides](https://guides.18f.gov/) on a broad array of topics. Several of
our guides, including the [Content
Guide](https://pages.18f.gov/content-guide/) and the [Open Source
Guide](https://pages.18f.gov/open-source-guide/), have been announced
on our blog and have attracted public reviews and contributions from
folks outside our team. We now have the (wonderful) problem of
generating so much content that we need to do a better job of organizing
it and making it more discoverable. There’s a content tiger team
assembled to address this very issue.

The [18F Pages](https://pages.18f.gov/) publishing platform has also
served us very well. We’ve stamped out (and tested!) a handful of bugs,
and added (and tested!) a number of new features, including:

-   The ability to listen to multiple branches and publish each to a different location
-   GitHub webhook (automated notification) authentication
-   Publishing repository contents as-is (as opposed to using Jekyll)
-   Publishing “internal” and “external” versions of a site from the same branch

What’s more, the [github-webhook-authenticator npm
package](https://www.npmjs.com/package/github-webhook-validator) is
reusable across webhook servers, and the [18f-pages-server
npm](https://www.npmjs.com/package/18f-pages-server) is completely
configurable and available to everyone. If you’ve a mind to run your own
Pages instance, we’d love to hear how it works for you!

18F Edu
-------

To build on the momentum of 18F Guides, we’ve begun piecing together an
in-house training effort we call [18F
Edu](https://pages.18f.gov/edu/). Through Edu, working groups, guilds,
and other subject matter experts will produce hands-on training content
that’s available to everyone in the organization. This content will
build on 18F Guides to give people a more tangible feel for a particular
topic by providing exercises that walk through the nuances of a
real-world problem. It will also provide the basis for lightweight
training sessions that we hope will catch on even outside of 18F. The
Edu group plans to polish off training modules on website accessibility
compliance, selected aspects of content production, and unit testing in
Node.js. We’re also exploring possibilities with the [DigitalGov
University](https://www.digitalgov.gov/digitalgov-university/) team,
such as developing training materials that will expand upon some of
their most popular content.

Bringing it all back home
-------------------------

Fellow Devops Enterprise 2015 speaker Steve Spear had a quote in his
presentation, [“Creating High Velocity
Organizations”](https://www.youtube.com/watch?v=onwhZwroQHs), that
said: “If you’re not building a learning organization, you’re losing to
someone who is.” This concept of a “learning organization” resonated
deeply with me as it encapsulates what I consider the real opportunity
18F has to change the way that the government builds and buys software.
What we do isn’t just about consulting and writing software, and billing
for time and materials. It’s also about introducing a culture where the
government, the vendor community, and all of their employees feel that
they are empowered to seek out fresh challenges, to grow, and do their
best work for the people.

In that light, though the artifacts and processes discussed in this
trilogy may be outside of our agency partner projects, investment in
organizational learning capability is what supports the long-term
development and delivery of high-quality products and services. Rather
than taking resources away from customer requirements, it’s what enables
those requirements to be (truly) fulfilled, and to not merely meet
customer expectations, but actually exceed them.

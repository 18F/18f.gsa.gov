---
title: "An open source government is a faster, more efficient
government"
date: 2015-12-09
authors:
- cm
tags:
- open source
- our projects
excerpt: "Regulation 479 is the first Bureau of Alcohol, Tobacco, Firearms and Explosives (ATF) regulation on the eRegulations platform. This collaboration is an excellent example of how open source development helps 18F deliver valuable services to our clients and the American public."
description: "Regulation 479 is the first Bureau of Alcohol, Tobacco, Firearms and Explosives (ATF) regulation on the eRegulations platform. This collaboration is an excellent example of how open source development helps 18F deliver valuable services to our clients and the American public."
image: /assets/blog/atf/eregs-comparison.jpg
---

[Regulation 479](https://atf-eregs.18f.gov/479) is the first [Bureau of Alcohol, Tobacco, Firearms and Explosives](https://www.atf.gov) (ATF)
regulation on the eRegulations platform. eRegs provides intuitive
navigation, quick access to defined terms, search, and also displays how
regulations have changed over time. This collaboration is an excellent
example of how open source development helps 18F deliver valuable
services to our clients and the American public.

We started working with the ATF on eRegulations two months before
shipping, but the real foundation for this project was laid over two
years ago, in a completely different agency: the [Consumer Financial
Protection Bureau](http://www.consumerfinance.gov/) (CFPB). Their goal
was to present their regulations as clearly as possible and to provide
access to as much of the related information (official interpretations,
analyses for changes to sections, etc.) as feasible. The framework they
produced is flexible enough to work relatively well with other agencies’
regulations, including ATF.

Savings through reuse
---------------------

18F uses open source projects in almost everything we do, from
[operating systems](https://github.com/18F/ubuntu-lts) to programming
languages, from [static site generators](https://18f.gsa.gov/2015/09/15/federalist-platform-launch/)
to dynamic web frameworks. We have a soft spot for tools created by
intrepid civic hackers both within and outside of the government. To
name just a few, our [Open Source Policy](https://github.com/18F/open-source-policy) has roots in the
[Department of Defense](http://dodcio.defense.gov/OpenSourceSoftwareFAQ.aspx#OSS_and_DoD_Policy),
we have a close collaboration with the National Renewable Energy
Laboratory (NREL) working on [api-umbrella](http://apiumbrella.io/),
and at one time used [Honolulu Answers](https://www.codeforamerica.org/apps/honolulu-answers/) for our
work with the United States Citizenship and Immigration Services.

Using open source projects allows us to develop quickly. Instead of
writing ATF’s eRegs from scratch, we could piggyback on the two-plus
years of work [CFPB did on the
project](http://www.consumerfinance.gov/eregulations/). Even if we
assume only half of that work was directly applicable, we saved a full
year of development costs. Effectively, 14 months of work took two
months of time, allowing our small team to focus on issues with
ATF-specific regulations, branding, and deployment. This is the great,
fulfilled promise of open source; we reap the benefits every day.

![A comparison of CFPB's eRegs and ATF's eRegs](/assets/blog/atf/eregs-comparison.jpg)

Collaborating with our peers
----------------------------

We’re sometimes fortunate enough to have a deep collaboration with the
authors of this civic software. In the case of NREL, we employ one of
their [finest](https://github.com/GUI) developers part time. Several
of 18F’s staff (myself included) came from CFPB, so our
[ties](https://twitter.com/18F/status/616233060250443776)
[remain](https://twitter.com/gulielmus/status/593524625310547968)
[quite](https://pages.18f.gov/open-source-program/pages/case_study/CFPB_open_source_documentation/)
[strong](https://18f.gsa.gov/2015/09/21/cfpb-design-speaker-series/).
On eRegs, we have an even tighter bond; our developers and CFPB’s
developers frequently share our plans and solutions. Not only do we
share code, but we try to share our visions for the software.

Of course, these visions aren’t identical. 18F is focused on making
eRegs work for a variety of agencies while [CFPB is (rightly) concerned with their own regulations](https://github.com/cfpb/regulations-site).
Adding this contention to tight timelines on both sides, [our code
bases have diverged](https://github.com/cfpb/regulations-parser). Both
teams are working for the benefit of the larger project, however. These
differences will eventually be reconciled; in the meantime, we are
trying to fix the problem one
[patch](https://github.com/cfpb/regulations-parser/pull/277)
[at](https://github.com/18F/regulations-parser/pull/61)
[a](https://github.com/cfpb/regulations-parser/pull/274)
[time](https://github.com/18F/regulations-site/pull/19).

At 18F, we worked with our [cloud.gov](https://cloud.gov) colleagues to make ATF eRegs
one of the pilot projects for  [cloud.gov's launch](https://18f.gsa.gov/2015/10/09/cloud-gov-launch/). 
Cloud.gov hosts and manages shared server infrastructure for the platform, saving money for taxpayers.

Next steps for eRegs
--------------------

In addition to merging the CFPB and 18F code bases, we’re hoping to work
more closely with ATF to develop eRegs into a platform that fits their
specific needs. Our short timeline restricted our work to tweaking data
structures and massaging the data to account for ATF regulations rather
than focusing on new features. These features, such as including
additional external resources (for example court case documents),
importing documents further in the past, and the coveted
notice-and-comment period will not only make the product better for
ATF’s users, they should also improve the experience for other agencies.

In the meantime, explore the [existing](https://atf-eregs.18f.gov/479)
imported regulation, now more accessible than ever. The regulation is
neatly broken into sections so that you can flip through or jump to a
specific topic. Rather than flipping back and forth between the
definitions section and the rest of the regulation, you can find defined
terms inline. Use search to quickly find exactly what you’re looking
for, or follow the history of the regulation over time. All of this is
now possible, in large part thanks to open source.

As we continue to add features to this open source platform, other
agencies can use the new additions for their regulations. We have notice
and comment functionality in our future development roadmap plans for
proposed regulations, which will be especially valuable for collecting
public comments digitally.

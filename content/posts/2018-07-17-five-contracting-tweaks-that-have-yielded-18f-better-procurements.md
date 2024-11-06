---
title: "Five contracting tweaks that have yielded 18F better
procurements (thus far)"
date: 2018-07-17
authors:
- alla
- rebecca-refoy
- mheadd
- randy-hart
- steven-reilly
tags:
- acquisition services
- rfp ghostwriting
- procurement
- lessons learned
excerpt: "Here are five procurement hacks — both in the context of our Agile Blanket Purchase Agreement (BPA) and in general — that we’ve made in the past few years to make the procurement process a bit more joyful and effective."
---

The U.S. government has been buying goods and services from the private
sector since its founding, and it's a necessary part of delivering on
its mission of protecting and serving the public. However, there is
always room for improvement — and we’ve been fortunate to work with a
cross-functional team at the Technology Transformation Services (TTS)
that is dedicated to experimenting on incrementally improving the
procurement process with our federal agency partners and vendors.

Here are five procurement hacks — both in the context of our [Agile
Blanket Purchase Agreement](https://agile-bpa.18f.gov/) (BPA) and in
general — that we’ve made in the past few years to make the procurement
process a bit more joyful and effective:

## 1. Creative use of existing GSA Schedules

Not long after 18F’s inception, the demand from partner agencies for
help in supporting their efforts to build new digital services
skyrocketed. We realized that we needed some new tools to help meet this
growing demand.

After some initial discussion, we settled on creating a vehicle that
would allow us to select a new pool of vendors that work the way we do —
using agile methodologies and user-centered design principles. In early
2015, we announced a new kind of process for vendors to compete for
software acquisition contracts. An Agile Blanket Purchase Agreement
(BPA) process was open to existing vendors on [GSA Schedule
70](http://www.gsa.gov/portal/content/104506), and required vendors to
submit a working prototype based on a public dataset — and then show
their work in a publicly available git repository.

A BPA under Schedule 70 gave us significant flexibility to create the
type of contract vehicle we thought we’d want to work with: one that
could be awarded relatively quickly, that would provide for a more
efficient and streamlined ordering process, and that could provide
continued flexibility down the road as we test out what does and doesn’t
work.

That said, the [process we
used]({{ "/2015/08/28/announcing-the-agile-BPA-awards/" | url }})
to create our Agile BPA was unique. We wanted prospective vendors to
demonstrate their ability to use agile practices, so we asked them to
publicly demonstrate their commitment to user-centered design and
iterative development by building prototype software in the open.
Requiring prospective vendors to adhere to this requirement helped us
ensure alignment with 18F’s principle of working in the open, helped
reduce risk by replacing a boilerplate RFQ response with working code,
and provided transparency into a process that was new for both us and
for vendors.

## 2. Interview-style oral presentations

Our team is primarily interested in helping our partner agencies learn
about the skills and approach of the technical talent that will do the
job after a procurement. This can be a challenge with traditional
written proposals that often contain more fluff than meaningful content.
(See procurement hack 5 below.)

As we thought about how to run a streamlined process that would help us
quickly assess the technical approaches to our task order solicitations,
we got in touch with GSA’s [Federal Acquisition Service (FAS) Region
3](https://www.gsa.gov/about-us/regions/welcome-to-the-midatlantic-region-3). They shared their
approach of using an “Interview-Style Oral Presentation” — in essence,
asking their vendors’ technical team to meet with the government
evaluation team to answer questions about how they would approach a
contract.

Subsequently, we’ve worked with FAS to use this approach successfully
for our first [Agile BPA](https://agile-bpa.18f.gov/) buys. You can
find an example of solicitation documentation describing the process in
[the GitHub repository for our e-QIP
procurement](https://github.com/18F/bpa-opm-eqip/blob/master/RFQ.md).
Feedback on this approach has been generally positive from our Agile BPA
vendors, and we’ve found it really helps the evaluation team
differentiate between the strengths and weaknesses of vendors.

## 3. Cloud deployment

In our procurements, we’ve pushed to use shorter periods of performance
and [established best
practices]({{ "/partnership-principles/" | url }}) to quickly
deliver phases of a larger project. In order to support that quick
turnaround time, we’ve taken advantage of automated tools and public
infrastructure to reduce the burden on vendors while providing greater
transparency into the work.

We believe that it’s important — for both us and our clients — to be
able to see and test the code in production as soon as possible.
Thankfully, [cloud.gov](https://cloud.gov/) makes continuous delivery
a hands-off process for our vendor, allowing us to configure automatic
deployment to a staging and/or production environment directly from a
continuous integration service. With this in place, our vendor never
needs to worry about having the right permissions to access the
deployment environment — or even where they are physically located — in
order to push to production. As an added bonus, cloud.gov provides a
number of built-in compliance features, freeing up our vendors to spend
more time satisfying user needs.

## 4. Cross-functional teams

One of the most important ways we support success in our procurements is
by assembling cross-functional teams. We don’t look for or hire
“unicorn” employees, but rather convene groups of folks who are experts
in niche areas who are comfortable with collaboration and thinking
outside the box.

In the acquisitions realm, this means groups of technologists, contract
leads, product leads, and designers all work together on procurement
packages. By breaking down silos, cross-functional teams can help make
decisions quicker, deliver work sooner with fewer defects, improve
communication flow on projects, and promote knowledge sharing. This
model helps us get closer to the needs of our clients, and helps us
align with what the FAR envisions in [FAR
1.102-3](http://farsite.hill.af.mil/reghtml/regs/far2afmcfars/fardfars/far/01.htm#P41_7685)
and [FAR
1.102-4](http://farsite.hill.af.mil/reghtml/regs/far2afmcfars/fardfars/far/01.htm#P43_8245)
for the Role of the Acquisition Team.

## 5. Shorter proposals

From the cumulative decades that our team members have spent working as
contracting officers, it’s clear that a great deal of effort goes into
proposals. However, rather than spend an inordinate amount of time
trying to provide convincing assertions instead of demonstrating
outcomes, we think it’s more beneficial for both the government (as a
buyer), as well as potential contractors (as the sellers) to lower the
barrier to entry and make it easier to show rather than tell.

To further that goal, we try to be very discerning about what we ask
from potential vendors with each of our projects. When using the Agile
BPA, for example, we don’t need the vendors to tell us that they can
work in an agile manner; we’ve already determined that. Instead, we can
focus on the specifics of the task at hand: how would you propose to
fill our client’s needs, who will perform that work, and how much will
it cost? If we’ve done our job properly, the offerors should be able to
answer those questions with a relatively short response and some
examples of that expertise in action. Our goal is to make sure that such
exchanges are as simple as possible, and avoid duplicative work with the
interview-style oral presentations discussed above.

## Continuing the journey to joyful procurement

Our work in tweaking the procurement process to bring more joy has just
begun. The above five methods have worked for us in the past few years,
and we have no doubt that we’ll be iterating and improving them as we go
on. At the TTS Office of Acquisition, we believe that the FAR and
TechFAR allow for a great deal of flexibility for government buyers, and
we look forward to what the future holds.

*Post was written with contributions from Edwin Wong and Mark Hopson.*

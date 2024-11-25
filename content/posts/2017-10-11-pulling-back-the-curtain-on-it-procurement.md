---
title: "Pulling back the curtain on IT procurement"
date: 2017-10-11
authors:
- mheadd
- robin-carnahan
tags:
- modular contracting
- procurement
- agile
- acquisition services
excerpt: "Monolithic procurement — large, complex, multi-year contracts, which are common in government IT procurement — can appear compelling to agencies that use them. The Technology Transformation Services (TTS) is a strong advocate for an alternative approach known as modular contracting (aka modular procurement)."
image:
---

There's a scene in the classic movie "The Wizard of Oz" that has become synonymous with the difference between perception and reality.

While Dorothy and her companions stand before the Wizard in the Emerald
City, and tremble at his sound and fury, her little dog Toto pulls back
the curtain to reveal the old man operating the controls behind it.
Dorothy and her friends realize rather abruptly that there is no
all-powerful Wizard who can magically fulfill their dreams of returning
home or having courage, a heart, or a brain.

As strange as it sounds, there are some parallels between this scene and
the world of government IT contracting. *Monolithic procurement* —
large, complex, multi-year contracts, which are common in government IT
procurement — can appear compelling to agencies
that use them:

-   The perception that complex, interdependent project requirements can be completely addressed by devoting enough time up front to capture them all in one Request for Proposal (RFP)
-   The perception that government can eliminate risk by including just the right contract terms to hold vendors responsible if they fail to meet project goals
-   The perception that agencies are better off relying on vendors for technical expertise rather than trying to hire in-house staff

The Technology Transformation Services (TTS) is a strong advocate for an
alternative approach known as *modular contracting (*aka *modular
procurement)*. Modular contracting is a strategy that breaks up large,
complex procurements into multiple, tightly-scoped projects to implement
technology systems in successive, interoperable increments. We’ve
written
[extensively]({{ "/2016/11/15/modular-procurement-state-local-government/" | url }})
about how it can [reduce
costs]({{ "/2016/09/20/mississippi-agile-modular-techniques-child-welfare-system/" | url }}),
[decrease
risk]({{ "/2016/03/22/helping-california-buy-a-new-child-welfare-system/" | url }}),
and speed up how fast real users can start using government software.
We’ve also [written
about]({{ "/2016/09/20/mississippi-agile-modular-techniques-child-welfare-system/" | url }})
how we’ve used it and how our partners are using it. We’ve even
published actual [solicitation
documents](https://github.com/search?q=topic%3Aagile-bpa+org%3A18F&type=Repositories)
publicly that others can use as inspiration or templates.

Modular procurement is [not a new
idea](https://www.govinfo.gov/content/pkg/CFR-2010-title48-vol1/pdf/CFR-2010-title48-vol1-sec39-103.pdf), but there are some
misconceptions about how it works because, until recently, few agencies
have attempted to use it for government technology buys.

This is the first in a series of posts discussing some of the challenges
of IT procurement in the public sector. Hopefully, an open discussion
about the tradeoffs and benefits associated with different procurement
approaches can help government agencies more successfully deliver
high-quality digital services to the people they serve.

Project success is never a guarantee
------------------------------------

Let’s say you work for a government agency that wants to modernize an
important IT system. Traditionally, your procurement office would
develop and issue a single large procurement action for tens or hundreds
of millions of dollars. Because there's so much money on the line,
everyone wants to be absolutely sure to get it right. That means many
months of requirements gathering and contract writing to ensure every
feature is spelled out and every possible scenario is covered in
advance.

We all know from experience that this approach doesn’t work. Even for
the most skilled teams, it’s not possible to capture every possible
unexpected situation over the life of a project. That’s why we encourage
our agency partners to acknowledge that reality upfront, and instead
focus on mitigating those risks by breaking up the work into smaller,
shorter projects, called modules, with well described problems to solve,
not requirements to check off. That way, any team issues or problems
with a particular module can be exposed and corrected more quickly and
at exponentially lower cost.

Likewise, modularity provides for the flexibility needed to apply [lean
product
design]({{ "/2015/11/20/how-we-use-a-lean-approach-to-product-design/" | url }})
principles like “[Build, Measure,
Learn](https://steveblank.com/2015/05/06/build-measure-learn-throw-things-against-the-wall-and-see-if-they-work/)”
by allowing early lessons to inform shifts in direction along the way.
Finding a problem or changing direction after investing six months and
$500,000 beats discovering it five years and $100 million later every
time.

But the truth is, breaking a large RFP into a number of smaller
solicitations has its own challenges. First, it requires taking a hard
look at your agency’s procurement requirements with an eye toward
streamlining and creating a lighter-weight buying process. This is
important both for creating a sustainable workload for your contracting
staff and attracting enough qualified vendors interested in bidding on
your work.

Drafting, reviewing, and managing RFPs takes a lot of staff time and
effort, so creating a streamlined process is critical to avoid
overburdening your procurement team. Likewise for vendors, responding to
RFPs costs considerable time and money. To ensure you can attract enough
high quality vendors on smaller projects, it’s critical to lighten the
load by lowering the time and cost of preparing bids.

There is another risk worth noting; even though your vendors will be
working on smaller chunks of functionality and delivering work faster,
it’s still up to the agency to understand and clearly communicate what
it wants to buy and hold vendors accountable for delivering working
code. Modern software methodologies make code interoperability and
connectivity easier than ever, but the government is ultimately
responsible for it all fitting together. This requires a new way of
working, and it doesn’t happen automatically.

Owning up to ownership
----------------------

There’s often a strong desire in government to outsource risk to a
single vendor so there is only one place for blame if something goes
wrong. While it may be comforting to think risk can be outsourced, in
reality this approach rarely works. If a vendor fails to deliver, the
government has two problems: a system still needs to be developed that
meets people’s needs (only now with less time, less money, and more
scrutiny) *and* there may be a lengthy and expensive legal action.

For large technology projects, it’s common for government to contract
for a "systems integrator" to coordinate all the work between various
subcontractors. Too often, this approach creates the wrong incentives
for both the systems integrator and the government and leads to bad
results. The systems integrator has an incentive to keep the contract
going for as long as possible by producing either custom-built
proprietary software or highly-customized commercial off the shelf
software and charging for all the many changes required over the 5-8
year build-out period. The agency is incentivized to let the vendor
handle it.

By outsourcing key technical decision-making to the systems integrator,
the agency becomes dependent on the vendor and loses the opportunity to
course correct when technical or cost problems arise. The end result, as
we’ve seen too often, is software that is difficult to use, expensive to
modify, and that doesn't actually meet the needs of the people who will
use it. According to the [Standish Report from
2003-2012](https://www.brookings.edu/blog/techtank/2015/08/25/doomed-challenges-and-solutions-to-government-it-projects/),
94 percent of government software projects over \$10 million are either
over budget, over time, or just don’t work.

For modular contracting to work, government must stop trying to handoff
all responsibility and instead take on the role of [product
owner](https://playbook.cio.gov/#play6). This means the government
defines the vision, roadmap, and product backlog, coordinates the work
of different vendors, and defines how different modules will talk to one
another. The government provides technical oversight, ensuring that code
follows best practices (for example, test-driven development), reviews
and accepts code, and plays mediator when two vendors working on two
different modules have a disagreement about how something should work.
That’s the way for government to get what it’s paying for and for users
to get the software they need.

Owning more responsibility for technology projects often requires
agencies to train or hire more in-house product, technical, and design
expertise. This can be a challenge, but it's worth the effort. Besides,
having these skill sets in-house will help ensure the agency delivers
better digital services to the public whether using a monolithic or
modular contracting approach.

Buy-in and culture change
-------------------------

Modular contracting — especially when paired with [open source
software]({{ "/2016/08/08/facts-about-publishing-open-source-code-in-government/" | url }})
and [agile
development](https://modularcontracting.18f.gov/agile-development/) —
can be very different than what many government technology teams are
used to. Successfully using these approaches requires clearly aligned
cross-functional teams that include procurement, tech, policy, legal,
and oversight as well as leadership buy-in to provide the team “air
cover” to try something new.

This can be scary and often requires new roles and responsibilities for
agency staff. In times of uncertainty, it’s natural for teams to revert
back to familiar practices and habits such as requiring comprehensive
requirements and planning documents rather than prioritizing the
delivery of small, incremental chunks of working code. Avoiding this
requires sustained executive-level interest and support to give teams
the confidence they need to try something new.

The familiarity of practices around monolithic contracting can be
comforting and lull agencies into thinking that success will come if
only they collect enough requirements up front, or include the right
terms and conditions in an RFP. And it’s certainly tempting to believe that risk and responsibility can be outsourced to a single
all-powerful wizard (aka vendor) in hopes they’ll make all the problems
disappear. Unfortunately, a peek behind the curtain shows us otherwise.

Modular contracting isn’t new, though it is a new approach for
government. It can be a sensible way to lower the risk of technology
modernization projects by allowing agencies to get software to users
faster, with less money and risk, and with more flexibility to course
correct when things go wrong or circumstances change. But to make this
work, agencies must commit to training or hiring in-house technology
talent; getting broad-based buy-in throughout the organization;
accepting the role of product owner and technology leader; and embracing
the culture change required to try something new. It’s not magic, but it
can help get to the truth faster — and that means better digital
services for the public.

If you work for a government agency that wants to learn more about
modular procurement or how to work with TTS, feel free to drop us a line
at [inquiries18F@gsa.gov](mailto:inquiries18F@gsa.gov).

*Note: Some of the ideas and content in this post were developed by
former 18F staff members Zachary Cohn and Kane Baccigalupi.*

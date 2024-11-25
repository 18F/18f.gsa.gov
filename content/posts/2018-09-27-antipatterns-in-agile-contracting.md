---
title: "Am I doing this right?: Antipatterns in agile contracting"
date: 2018-09-27
authors:
- alan-atlas
- mchopson
tags:
- agile
- procurement
- acquisition services
excerpt: "As agencies try to adopt agile development practices and
modular contracting methods, there are several anti-patterns that we
have noticed through the course of our work. We address how these can
hinder success and alternatives to consider."
---

Over the past few years, 18F and other government organizations have
adopted the idea of “agile contracting” as a way to streamline and
improve IT service and product acquisition. This way of contracting is meant to be built on agile software development methodologies, in which the needs of users, rather than technical considerations, are used to drive development.

Contracting based on agile development methods requires a departure from traditional techniques of prescribing the “how” in a government
acquisition. In traditional contracting, based on the [plan-driven, waterfall method of development]({{ "/2015/12/29/is-your-project-using-agilefall/" | url }}), the contractor is given a detailed list of all of the items to be produced, i.e., features, with specifications that cover cost, time, and scope. This is sometimes referred to as “buying the destination” because the contractor is charged with delivering all of the specified items by the end of the contract.

Contracting Officers who are aware of agile development methods address those concerns as well, but concentrate more on the problems to be solved without pre-determining the details of the solution. The
contractor delivers multiple, successive deliveries with ever-increasing levels of functionality and accepts feedback on the desirability of the product as it evolves. This problem solving involves cooperation between the acquiring agency, the contracting vendor, and users of the system during development. This collaborative approach is sometimes referred to as “...buying the journey.” In government, this idea is at the heart of
[performance-based contracting.](https://pba.app.cloud.gov/app/#/pba)

Agile contracting is an attractive option to government because it can reduce risk, improve quality, and speed up deployment of new
capabilities. But as many agencies across government try to implement
this new way, we’ve observed a number of antipatterns that hinder the
success of agile contracts (an antipattern is “... a common response to a recurring problem that is usually ineffective and risks being highly counterproductive”).

Let’s look at how agencies can problematically describe their
requirements trying to be agile.

## Antipattern: Laundry lists of user stories

Agile development proceeds from a carefully curated list of the value to be delivered to the user. This list is called a Product Backlog. We frequently come across projects that have product backlogs that contain hundreds, or even thousands, of user stories. It can be difficult for vendors considering a bid on such a contract to understand the scope and focus of the software tool. Therefore, in an agile request for proposal (RFP), the focus should be on comprehension of scope as opposed to cataloging.

Cataloging is a symptom that the organization has failed to
**actually** adopt agile principles. It’s effectively nullifying any
change from using the same requirements traceability matrix as before. Providing user stories in this way fails to convey the priorities of the organization, doesn’t clarify the scope of work, forestalls change in response to user feedback, and replicates the same kind of problems found in traditional waterfall development.

There are two ways to avoid this problem and increase the clarity of the solicitation. First, Product Owners can make use of the common hierarchy of [Epic - Feature - Story](https://www.scrumalliance.org/community/articles/2014/march/stories-versus-themes-versus-epics)
to shrink the size of the list. Concentrating on using lower granularity Epic or Feature statements can bring out the important goals of the project in favor of including too much detail. The second approach is to group the long list of stories into conceptual, focused release groups to make them easier to understand. Consistency about *how* releases, epics, features, or journeys are used is more important than the terms themselves.

Long, undifferentiated lists of stories can be difficult for a vendor to grasp for purposes of bidding on a contract. Using stories with less granularity, providing a product vision and statement, and grouping stories into potential releases can help bidders to understand the product space.

## Antipattern: Separate contracts for every release

FAR Part 39.103 - Modular Contracting, as well as supplemental guidance, does not prescribe _a singular way_ to actually implement modular contracting. Instead, organizations need to fully consider their situational context. Frequently, whenever the idea of more than one contract is brought up, the immediate response is that there will be “too many” contracts. Many people rightly panic at the thought, that this works like a [“cut-over” migration
approach](https://www.google.com/url?q=https://www.martinfowler.com/bliki/StranglerApplication.html&sa=D&ust=1534425797866000&usg=AFQjCNEDyIa7E-fCdUi8XQmVZjvxS1-nYQ)
to a legacy technology stack. One day there’s a single contract, and
then suddenly there are dozens or more.

Some questions to consider in this situation:
-   What feels like “too many” contracts now? (Also, what feels like too many releases?)
-   Why?
-   What could be done to alleviate that? If nothing, why?
-   What combination of size and frequency of contracts results in the delivery of the most completed value over time? (In other words, optimize for delivery, not for easiest contracting regimen.)
-   Is it a people issue? A workflow issue? A contract writing system issue?
-   How many different companies are performing today through subprime or other arrangements you may not have full visibility into but still are subject to the effects of? If you don’t know, why not?
-   (And perhaps most importantly) How is that working for you today?

The key is striking the right balance on the spectrum, and that comes
from experience over time. The further towards the edges you go, in
either direction, the less likely you’ll find success.

As we mentioned in the first antipattern above, for some agencies it
very well may be that structuring multiple releases on a single modular contract works great. For other agencies, they may achieve a better cadence after learning and tuning their approach over time by starting small and gradually increasing any given number of modular contracts that work for them.

We have some guiding principles when designing and implementing this
shift in acquisition strategies that focus on time and money. The reason is that both of those are good predictors for risk, and ways to decrease the exposure to risk based on empirical evidence. This is usually a big focus area with partner agencies when they undertake this journey with 18F.

## Antipattern: Creating vendor pools as a first step

18F’s own agile blanket purchase agreement (BPA), a type of Indefinite
Delivery/Indefinite Quantity (IDIQ) contract, was an intentional
experiment in modular contracting to try to discover a solution. It’s
one that many have replicated or attempted to replicate. The goal of
using IDIQ is to try to deal with the overhead of managing multiple
vendor bids at once, which helps reduce the administrative burden on the government acquisition workforce.

However, from a competitive standpoint, antipatterns happen when you try pre-establishing vendor pools with long durations. They can overly favor large businesses as primes by increasing the anticipated number of personnel and scope; and, because of this aggregation, small businesses are less likely to receive awards as primes. In many cases, this can mean limited opportunities to directly support an agency’s mission for
many years. For agencies, this can also raise the likelihood of a
protest because it can turn an acquisition into an all-or-nothing
proposition for both large and small businesses.

Further exacerbating this is the idea of a singular test or coding
challenge that largely becomes a gimmick because it’s not reflective of true performance in the real world, no matter how exhaustive it tries to replicate that real world. This kind of disparity was wonderfully made
in the movie Sully — comparing the pilots in a virtual simulation faced with the failure of a passenger jet’s engines that led to the landing in the Hudson River versus the actual experience for pilots in a real cockpit when it happened. There simply is no way to replicate anything
in those kinds of challenges that acts as a good indicator of
organizational fit with a vendor or demonstrated performance over time.

Agencies running off to build their own field of dreams for agile
contracting vehicles also runs contrary to the purpose of the
government’s efforts to enhance buying power, going all the way back to [this memo](https://www.google.com/url?q=https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/procurement/memo/development-review-and-approval-of-business-cases-for-certain-interagency-and-agency-specific-acquisitions-memo.pdf&sa=D&ust=1534346709784000&usg=AFQjCNHMNAgoIxZ7wMQCOLMRtDHBX1Z9VA).
Leveraging lessons learned and lowering the costs of entry for quality vendors to make it easier to get requirements satisfied is the express purpose of existing options like GSA’s Federal Supply Schedule, NASA and NIH’s GWACs, and many other shared services in government. (Read the latest [lessons we’ve learned from experimenting with this method]({{ "/2018/07/26/what-we-learned-from-building-a-pool-of-agile-vendors/" | url }}).)

These are just a few of the many antipatterns we’ve observed over the
years in our work with partners. The danger inherent in these
antipatterns is that an organization’s business processes can snuff out any hope of adopting agile development before it has even really gotten started. As we discover more of these antipatterns we’ll share them as early and often as possible. In the meantime, continue making procurement joyful. 

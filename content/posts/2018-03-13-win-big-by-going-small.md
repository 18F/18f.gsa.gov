---
title: "Win big by going small"
date: 2018-03-13
authors:
- mheadd
tags:
- agile
- modular contracting
- devops
- acquisition services
- alaska
excerpt: "Adopting this “smaller is better” mindset as a way to overhaul a large, complex legacy system can feel counterintuitive. But the notion of smallness — of distilling complex, interdependent tasks into achievable units of work — is fundamental to building modern software in both the private and public sector."
---

> When eating an elephant, take one bite at a time -- **Creighton Abrams**

At 18F, we work with federal agencies and state governments to help them overhaul and modernize large technology systems. Our partners typically face challenges with their existing systems because they’ve become outdated and difficult to maintain, are inflexible and can’t easily support program or policy changes, or aren’t delivering value to those they serve.

We use a variety of [strategies and techniques](https://modularcontracting.18f.gov/strategies/) to help our partners adopt new practices that will better support successful modernization efforts. To those unfamiliar with some of these strategies, it can feel like a mishmash of foreign concepts and ideas. But the single most important theme running through all of these different strategies is that in order to rebuild a large legacy technology system, governments need to [think small]({{ "/2017/01/11/the-best-way-to-build-big-is-to-start-small/" | url }}).

Adopting this “smaller is better” mindset as a way to overhaul a large, complex legacy system can feel counterintuitive. But the notion of smallness — of distilling complex, interdependent tasks into achievable units of work — is fundamental to building modern software in both the private and public sector.

## Modular contracting

The core principles of modular contracting are not new; they’re enshrined in [FAR Part 39](http://farsite.hill.af.mil/reghtml/regs/far2afmcfars/fardfars/far/39.htm#P33_5051) and have been around since the late 1990s. Lifting directly from the FAR, we can summarize the basic idea behind modular contracting as:

>[the] delivery, implementation, and testing of workable systems or solutions in discrete increments, each of which comprises a system or solution that is not dependent on any subsequent increment in order to perform its principal functions.

There are a [number of reasons]({{ "/2017/10/11/pulling-back-the-curtain-on-it-procurement/" | url }}) why the idea of structuring a project as multiple small solicitations as opposed to one giant “big bang” procurement seems counterintuitive in government. Monolithic procurements are the norm in the public sector, and many times budget timelines, funding pressures, and oversight requirements may encourage agencies to use these oversized (and overly complex) procurement vehicles.

Adopting a [modular procurement strategy](https://modularcontracting.18f.gov/modular-procurement/) — where work to overhaul a legacy system is broken down into discreet, independent components — can reduce risk and improve the chances of successful project execution.

In our work with the State of Alaska on the [overhaul of their legacy public benefit eligibility system](https://github.com/AlaskaDHSS/EIS-Modernization/blob/master/README.md), we helped the state adopt a modular procurement strategy. They’ve structured their RFPs for this work into [smaller, less risky components](https://github.com/AlaskaDHSS/RFP-Search-Unification) instead of using a more typical monolithic procurement approach. This modular approach will allow the state to deliver working software to end users more quickly, and will position the state for long term success in their legacy modernization efforts.

## Agile development

More and more agencies report familiarity with or adoption of [agile practices](https://guides.18f.gov/agile/), but this exposure to agile practices can sometimes be one dimensional. There may be a lack of clarity on the interconnection between some of the core ideas of agile and other strategies that agencies need to overhaul large legacy systems.

One of the key tenets of agile is to build in small, minimally viable increments to get working features to users more quickly, so that assumptions can be tested and feedback can be incorporated into future iterations. Breaking work down into smaller chunks helps focus a team’s efforts on delivery of specific items that have been deemed a high priority by a product owner.

The idea that large pieces of work should be broken up into smaller pieces that are achievable, testable, and deliverable makes up part of the foundation for agile practices.

Agile methodologies are a key component of how 18F works with partners, and they’re also a key strategy that governments need to successfully work with technology vendors. 18F has developed its own pool of agile vendors, and also worked [directly with states]({{ "/2016/09/20/mississippi-agile-modular-techniques-child-welfare-system/" | url }}) to help them craft their own agile vendor pools.

Learning how to adopt agile practices is a key part of being able to work with vendors to overhaul complex legacy systems.

## Embracing DevOps

The core concepts of [DevOps]({{ "/2018/01/25/getting-devops-buy-in/" | url }}) (Development and Operations) are often less familiar in the public sector than agile or modular contracting, but DevOps shares a similar focus on thinking small.

In the context of legacy system modernization, DevOps works well because of the emphasis on continuous deployment of tightly-scoped modifications to enhance the overall quality of software. Just as modular contracting is about breaking monolithic procurements into more manageable chunks, and agile is about organizing work into short sprints that deliver working software, DevOps can be thought of as delivering small chunks of work.

Because DevOps focuses on [automated testing and scanning]({{ "/2017/09/26/automated-scanning-for-sensitive-information/" | url }}), and continuous deployment of changes, there’s no need to accumulate a critical mass of modifications before pushing new features to a production environment all at once. DevOps allows for the gradual and consistent improvement of digital services, making updates and changes smaller, less risky, and easier to revert if there are problems.

As part of our work with the State of Alaska, we [helped the state adopt DevOps practices]({{ "/2018/01/25/getting-devops-buy-in/" | url }}) and build out their first continuous integration/continuous delivery (CI/CD) pipeline. CI/CD is an essential part of how the state is working with outside vendors and is a foundational component of their legacy modernization efforts.

Governments face significant challenges in modernizing legacy systems. Often the size and complexity of these systems can seem to present insurmountable challenges to government officials faced with limited resources and high expectations.

But breaking the work down into small chunks can make the process more manageable, and employing DevOps for continuous testing and deployment can provide confidence that everything is heading in the right direction, each step of the way.  

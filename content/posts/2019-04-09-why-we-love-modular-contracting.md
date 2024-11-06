---
title: "Why we love modular contracting"
date: 2019-04-09
authors:
- laura-gerhardt
- mheadd
tags:
- acquisition services
- how we work
- modular contracting
excerpt: "Modular contracting is an acquisition strategy that 18F uses
with many of our partners and our internal programs. So, why do we love
modular contracting and how does it make procurement better?"
---

Modular contracting is an acquisition strategy that we use with many of
our partners and our internal programs. With modular contracting we
break up large, complex projects into multiple, tightly-scoped
procurements to implement technology systems in successive, interoperable
increments. We’ve used this strategy in our work with the [Forest Service]({{ "/our-work/forest-service/" | url }}) and the [State of California]({{ "/2016/03/22/helping-california-buy-a-new-child-welfare-system/" | url }}) to mitigate
risk, reduce vendor lock in, and encourage the delivery of working
software to users more rapidly. When this practice is combined with
human-centered, agile practices, and modern infrastructure, it can
enable those who use your services to use portions of new software
faster.

Every procurement, especially for a large system, has a fair amount of uncertainty. When you procure that system in one or two procurements, you are placing all your eggs in one basket. If the post-award delivery fails, the entire system and likely your mission area fails with it. From an accountability perspective, this may seem attractive because it places all the risk into your primary vendor, but the reality is that fully outsourcing that control can leave your agency with little immediate recourse if the procurement does not go well. So, how does modular contracting make procurement better?

## Shorter contracts will reduce the risk of factors beyond your control

By breaking up a larger procurement, your team can isolate failure into a small piece of the system, rather than letting it impact the entire project. This takes the task of identifying easy break points that are either functional (for example, a module for your public users and another for your agency administrators), or vertical based on the technical stack (for example, an api connecting to a legacy system vs a user facing component).

The process of identifying breakpoints can help you articulate what the objective of each component will be, making the assessment of whether the component was successfully delivered easier to conduct. Planning work for a successful six-month to twelve-month contract is easier than planning a successful six-year contract. Modular contracting allows you to craft procurements that set out expectations for segments of work rather than scope out every contingency that could happen over the life of the product, which is neither feasible nor practical.

Likewise, when a particular contract does not deliver, that will likely slow progress, but it allows the program area to bounce back and, if well-scoped, it won’t take down the larger endeavor.

Those managing longer contracts struggle to account for inevitable
changes in leadership, legislative and other policy constraints or
emerging technologies. In contrast, the vast majority of larger projects are over budget or failing. The Standish Group found that:

<blockquote class="testimonial-blockquote">
Of 3,555 projects from 2003 to 2012 that had labor costs of at least $10 million, only 6.4% were successful. The Standish data showed that 52% of the large projects were “challenged,” meaning they were over budget, behind schedule or didn’t meet user expectations. The remaining 41.4% were failures — they were either abandoned or started anew from scratch.
</blockquote>

Managing many smaller contracts increases administrative burden. It
requires a dedicated program management team to “connect the dots” and coordinate various teams under their direction. While this may seem like more work up-front, it allows the program office to intervene earlier, and be more flexible. Many offices across government could benefit from shifting their mindset and requiring training to handle this type of managerial complexity.

Successful modular procurement should model agile and iterative software development practices, by continuously improving both the product, the acquisition process, and the software development process to get value to your users as soon as possible. Building a Minimal Viable Product (MVP) to validate or invalidate initial assumptions will lead to a better product than an untested product developed without interacting with users. An MVP is a “version of a new product which allows a team to collect the maximum amount of validated learning about customers with the least effort.”

## Reducing vendor lock-in.

Modular contracting reduces vendor lock-in by providing more
opportunities for vendor engagement and ensuring more than one vendor will know
how the system works.

In order to leverage modular contracting to reduce vendor lock-in. the government will also need to think about interoperability of system modules up front. By mandating system interoperability, modular
contracting enforces good coding practices and increases the consistency of the software. This enables new vendors to come on if the government decides to recompete.

There are well-documented, standardized software development practices that can be made uniform across vendors, and tools to enforce the use of consistent and secure coding practices. We often incorporate these process requirements into the contract via the Quality Assurance Surveillance Plan. This helps vendors, regardless of incumbency, know from the outset what will be expected in terms of software development practices. The following practices facilitate faster on-boarding of new development teams.

Specifically, by adopting a “programming style guide” and an automated style checking tool (known as a “linter”), your vendors can ensure the code style is consistent. By adopting other automated [static quality-checking tools]({{ "/2016/10/04/what-is-static-source-analysis/" | url }}), your vendors can avoid other poor code quality practices. Another method that reduces vendor lock-in is using open source or government owned, because it allows vendors to see the code they will be building upon. By having automated integration and unit tests, your vendors can identify and fix code that breaks or doesn’t integrate as soon as it’s written.

By conducting multiple procurements, the emergent system architecture
and system needs will be more transparent to the government and other
vendors. Although large procurements may provide system diagrams to
elaborate the components of a system, these may not be fully available to new vendors as government-furnished information, giving them a disadvantage in recompetes of custom software. Since some aspect of the contract will be apparent in each RFQ, it permits further competition.

We have found however contracts that are too small may discourage
vendors from bidding. We mitigate this by conducting market research to a large number of user-centered software firms and by choosing periods of performance appropriate for the scope of work. We also recommend publishing the solicitation to multiple channels, and potentially on listservs.

## Faster delivery of working software

Since modular contracting requires the government to conceptually
prioritize what is the most important piece of the project, it
encourages faster delivery of software that is most important or
fundamental to the success of the broader effort. Instead of waiting for an entire large piece of software, the government can pursue deploying the first software module. This has added benefits of helping your team pave the way for the security and compliance processes of future modules. Once those checks are passed, your users get to use your software, meaning you are delivering on your mission and building buy-in with your stakeholders that you are effective in delivering software.

## Getting started with modular contracting

We typically run a workshop to help identify and prioritize what a first procurement might look like. We take into account the most important user-needs and some technical prerequisites to giving them working software. For instance, in our work with FedRAMP, our first procurement was a micropurchase to help make the data publicly accessible. In some cases, you may need to first procure some existing software development tools or infrastructure to enable delivery.

If your team isn’t comfortable with the methods and responsibilities
outlined above, it might be time to rethink whether or not you’re ready for modular contracting. Want help breaking down your needs into manageable components? Come [talk to us](mailto:inquiries18f@gsa.gov) about how to start doing modular
contracting in your agency.

*This post was originally from the modularcontracting.18f.gov site, which we are now sunsetting in favor of a [series of blogposts]({{ "/tags/modular-contracting/" | url }}). The original text of the site will be available in our [github repository](https://github.com/18F/Modular-Contracting-And-Agile-Development).*

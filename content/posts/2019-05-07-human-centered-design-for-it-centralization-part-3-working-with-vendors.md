---
title: "Human-centered design for IT centralization, part 3 - Working
with vendors to build a centralized solution"
date: 2019-05-07
authors:
- erin-strenio
- amy-ashida
tags:
- 10x
- it centralization
- best practices
excerpt: "This is part 3 in a series on the importance of human-centered
design when evaluating IT centralization.In this post, we’ll share some
helpful tips on how to effectively work with vendors."
---

*This is Part 3 in a [series of posts]({{ "/tags/it-centralization/" | url }}) on the importance of human-centered design when evaluating IT centralization. As part of a [10x](https://10x.gsa.gov/) project, we've synthesized 18F's learnings from agency partners who’ve been through centralization efforts before and have wisdom to share. The series explores how and why taking the time to prioritize users will mitigate risks and yield services that work better for the people they serve. In this post, we’ll share some helpful tips on how to effectively work with vendors.*

Whether you’re centralizing software or centralizing offices, every effort is different. That’s why it’s so important to dive into the needs, concerns, and pain points of the people who will be affected by the centralized tool or service. This due diligence won’t just help reduce risk when deciding if and what services to centralize, it will also help reduce risk when working with vendors.

After interviewing several folks who’ve experienced some sort of
centralization effort, we’ve collected five best practices to keep in
mind when working with vendors:

1.  Think small
2.  Consider all your options: build, buy, or borrow?
3.  Avoid vendor-lock in
4.  A few pointers on writing RFPs
5.  DevSecOps is the secret ingredient

## 1. Think small


Centralization efforts can feel like giant endeavors — and they often
are. Many agencies have tried to deal with this uncertainty by using
waterfall methods. High-level stakeholders gathered pages and pages of detailed requirements up front. Then they hired a single vendor. Many years and millions of dollars later, the vendor would deliver a new system that might no longer meet user needs.

Systems built this way are often inflexible, delivered late, and can’t easily support program or policy changes. More importantly, they may not deliver value to the people they intend to serve.

Agile and Lean methodologies break large pieces of work into smaller
chunks that are achievable, testable, and deliverable based on user
needs — that means they’re built and shipped in small, quick iterations so you can iron out issues before they turn into much bigger problems. These methodologies represent a new, more transparent way of working with vendors.

18F often refers to this approach as [modular contracting]({{ "/2019/02/28/prerequisites-for-modular-contracting/" | url }}).
Modular contracting breaks up large, custom software procurements into a small constellation of smaller contracts. This can reduce risk and improve the chances of successful project execution.

## 2. Consider all your options: build, buy, or borrow?

Before jumping into a vendor relationship, remember you have a few
options: you can custom-build the tool yourself (in-house) or outsource this job; you [can buy a Commercial Off the Shelf (COTS) product]({{ "/2019/03/26/when-to-use-COTS/" | url }}) or Software as a Service (SaaS); or you can “borrow” certain software components from free, open source code sources from another government or organization.

A single product may have some components that are built and some that are bought. Read more on these options in this great deck: “[Whether to Borrow, Build or Buy?](https://github.com/18F/HCD_for_IT_Centralization/blob/master/Whether%20to%20Build%2C%20Buy%20or%20Borrow_.pdf)”

## 3. Avoid vendor-lock in

Vendor lock-in occurs when an agency is dependent on one vendor to
build, operate, and/or update a mission-critical service. Even if the
vendor begins to miss deadlines or underperform, agencies can’t hire a new one because the costs are too high to switch. In cases where vendors use proprietary code, agencies can get charged for any future fixes or updates. This hurts agencies in the long run as it limits their ability to develop in-house skills, control their own destiny, and give users more opportunity to shape the process through two-way feedback loops.

Avoid lock-in by drafting RFPs for small, independent services rather than for large, labyrinthine IT systems. Each service can be built by separate vendors yet come together to form a complete system. This way if one vendor or module isn’t working, you can easily change course.

When applied to legacy systems, this is sometimes called an [encasement strategy]({{ "/2014/09/08/the-encasement-strategy-on-legacy-systems-and-the/" | url }}). Having this flexibility is important. It will also build trust with your users.

This approach has been used by several 18F partners like the
[California Department of Health and Human Services]({{ "/2016/03/22/helping-california-buy-a-new-child-welfare-system/" | url }}) and [Alaska’s Department of Health & Social Services]({{ "/2017/09/12/how-alaska-is-using-transparency/" | url }}).

## 4. A few pointers on writing RFPs

A well-written RFP, with clearly defined business objectives and
technical direction, will increase the chances of a successful project. A poorly written RFP, on the other hand, can expose you to such risks as vendor lock-in, overbidding to compensate for uncertainty, and failure due to miscommunication and misunderstanding. These problems often send you down a long and painful road of reworks, contract modifications, and running over-budget and past-deadlines. And nobody wants that.

Here are some helpful tips:

-   Draft your RFPs for [outcomes rather than specifications]({{ "/2017/11/30/improving-government-outcomes-through-an-agile-contract-format/" | url }}). What matters most in the end is the tools will serve the needs of your end users.
-   Be clear in your writing — keep it short and in [plain language](https://www.plainlanguage.gov/).
-   Include considerations for user-centered design and development
-   If you need additional help writing RFPs or overall IT acquisition strategy and support, [18F can help](mailto:inquiries18f@gsa.gov).

## 5. DevSecOps is the secret ingredient

Traditionally development, security, and operations teams have worked in silos. While developers could edit and release code on a regular schedule, operations folks were bound by hardware limitations. With the implementation of agile development, this gap became even wider. On top of that, security offices, who would be on the hook if any breaches happened, were often brought in at the very end of the process and asked to rush through approvals. We’ve seen this lead to *really* frustrating situations for agencies.

In the context of IT centralization, an agency can buy or build a new IT system and not have the infrastructure in place to get it into
production. In another common scenario is agencies may introduce a new IT system with no way of updating it later when users start complaining about issues that need attention.

Creating a cross-functional DevSecOps team helps avoid these pitfalls by bringing developers, security, and operations teams together. We’ve found that communication early and often among these teams helps reduce the amount of time it takes to get things into production. It also helps everyone feel more comfortable and confident in the process. (You can read more on this practice
[here]({{ "/2018/01/25/getting-devops-buy-in/" | url }}) — and
we’ll talk more about the role of DevSecOps after the rollout in the
next post in our series.)

Working with an outside vendor often means trusting people who are
removed from your agency, your mission, and your end users. It’s risky to depend on a vendor to build, maintain, and update an IT service that is fundamentally critical to your mission. When shopping for a vendor, make sure you find one that’s aligned with your mission and integrate your DevSecOps team into this vendor partnership to keep your users at the center of the centralization.

*Next in our series, we address what happens after you centralize and
how to keep a user-centered approach even after the rollout.*

---
title: "Long-term teams, not sudden handoffs"
date: 2019-12-03
authors:
- alex-soble
- elizabeth-ayer
tags:
- agency work
- culture change
- best practices
- transformation services
excerpt: "Don’t let your agency waste knowledge and opportunity. Instead of planning for a handoff to operations and maintenance, plan for a long-term team. Instead of launching your project and then keeping it running, plan for ongoing development."
image: /assets/blog/long-term-teams/header.png
image_alt: "A series of loops that feed into each other"
---

Wonderful news: your request was approved, meaning that your agency now has funding to work on the project! You know, the sorely-needed IT project to build a new web application.

This particular grant is for a three-year period. How should you plan to allocate the funds?

In government, it wouldn't be uncommon to spend most of the grant upfront, paying a vendor to write the software, and then hand it off to an IT team for Operations and Maintenance, or O&M, post-launch:

{% image "assets/blog/long-term-teams/o-and-m.png" "Chart showing the trajectory of a software project that launches, goes through a flat "Operations and Maintenance" plateau, and then sunsets" %}

Although this is a common approach, it is a very risky one, because:

1. Handing off software to a completely new team squanders hard-won knowledge.
2. Handoff to operations & maintenance brings a "keep the lights on" mindset, rather than planning for active continuous delivery.

Former Presidential Innovation Fellow {{ "sarah" | team_link }} wrote about this topic in 2016 in her fantastic post, "[Software maintenance is an anti-pattern]({{ "/2016/02/23/software-maintenance-is-an-anti-pattern/" | url }})." (We hope you will give Sarah's post a read if you haven't come across it before!) In this post, we want to build on Sarah's arguments about software maintenance anti-patterns.

If you find your agency planning an abrupt handover to O&M after a software launch, we hope this post will provide you with reasoning and examples to support a different approach: building a technical team for the long term.

## Handoffs waste hard-won knowledge

A product team learns. It learns about the needs of its users (through user research) and about the tech choices and tradeoffs involved in meeting those needs (through software engineering). The team uncovers and prioritizes stakeholder needs (product leadership). And as it goes, each teammate learns the norms, attitudes, and decision-making practices that keep the team high-functioning.

All of this learning should be documented along the way, in the form of user research summaries, design artifacts, and technical documentation. No one person should have everything in their head — if a teammate wins the lottery and retires to a vacation paradise, the work should go on.

That said, if the ***entire*** team is disbanded in an abrupt handoff, a tremendous amount of knowledge is lost. All the context about decisions, user needs, stakeholders, and technical choices must be rebuilt from scratch. Anyone who has ever tried to pick up a job just from reading the notes of a predecessor knows how difficult this is and how much time it can waste!

{% image "assets/blog/long-term-teams/abrupt-handoff.png" "Chart showing learning increasing over time, but then dropping sharply when an abrupt handoff happens" %}

In knowledge work, this is a major loss. While team composition will naturally change over time, steady change is better than abrupt handoff to preserve team learning and context.

## We don't want a "keep it running" mindset!

"Keeping it running" post-launch should not be the goal. Your software launch is an opportunity to start getting feedback from users and making improvements based on what you learn. In other words, it is a starting point.

Instead of dividing your grant funding into "build" and "operation & maintenance" buckets, think about the creation of software as a journey or a hike with three legs:

1. ***Initial Prototyping ➡️ Launch***: This is the initial "build" phase; the one where you might spend most of your grant funding under a traditional model. For a government agency, the ATO process happens here.

2. ***Launch ➡️ Ongoing Development***: In this phase, your team will build new features and change existing ones based on user feedback; actively monitor and improve your security posture; and deal with the bugs and issues that invariably crop up only when real users begin using a product.

3. ***Ongoing Development ➡️ Sunset***: Nothing lasts forever, especially on the web. The last phase of a project is concerned with how to responsibly and thoughtfully shut it down and help users move to a better solution.

{% image "assets/blog/long-term-teams/happy-path.png" "Chart of the three legs of the software creation process: launch, ongoing development, and sunset" %}

Consider security. Security is a vital area of work at every stage. It can't ever be finished, since the external landscape changes all the time. A long-running engineering team has the benefit of understanding the product itself and a responsibility to keep it secure. In this scenario, teams can discover opportunities to improve the security, rather than spending all their time reactively. (See "[DevOps and Security on a Small Team](https://medium.com/nyc-planning-digital/devops-and-security-on-a-small-team-8709cfc5b0aa)" by TTS's own Aidan Feldman for a wonderful municipal example.)

Factor in the continuous delivery of value to your users — and continuous improvements to your application's security — and it's clear that your application will deliver more value over time if you plan for a longer-term team instead of an abrupt handoff.

## Case study: the U.S. Forest Service

The U.S. Forest Service partnered with 18F to [build and launch]({{ "/2019/02/12/open-forest-launch-post/" | url }}) [Open Forest](https://openforest.fs.usda.gov/christmas-trees/forests), an online system for Christmas tree permitting. After a successful Christmas tree-focused launch, the Forest Service plans to tackle permits for large-scale gatherings like outdoor races or weddings in national forests next.

How are they building out a team to carry the work forward, one slice of product  after the other?

"We've transitioned software development to the Forest Service Assistant CIO [ACIO] Office," explained [Aaron Burk]({{ "/2017/09/18/a-day-in-the-life-of-an-18f-product-owner/" | url }}), senior project manager with the Forest Service. "The ACIO Office is already working towards agile, acquiring skill sets around cloud management and DevSecOps. The timing is good, since the Open Forest project itself was designed around the same principles."

The Open Forest effort explored potential partnerships with other internal government IT services before settling on their partnership with the Forest Service ACIO, making sure the two agencies shared the same product goals and technical directions.

"There is amazing talent within the Forest Service. Our Forest Service partners identified people with subject matter expertise to work alongside us and deepen their knowledge and experience with iterative software development. Those folks are now continuing to develop the product on their own, further embedding this way of working within the organization," said {{ "melissa-braxton" | team_link }}, former 18F design and product lead on Open Forest.

What advice does Aaron have for other agencies embarking on a similar agile journey? "Choose a low-risk option to build your pilot. We didn't choose a complex permitting process to start. Starting small mitigates risk as you develop new services, and allows you to identify capability and skill gaps."

{% image "assets/blog/long-term-teams/github-graph.png" "GitHub commit graph showing ongoing techical development work" %}

This screenshot of development work from the Open Forest GitHub repository shows sustained development over time. The Open Forest site launched in February — so the graph hints at ongoing improvement, iteration, and feature-building post launch!

## To conclude

Don't let your agency waste knowledge and opportunity. Instead of planning for a handoff to O&M, plan for a long-term team. Instead of launching and then keeping it running, plan for ongoing development.

Your funder or boss may be skeptical. Print this post, leave it on their desk, and encourage them to plan toward a team that can deliver over the longer term.

<br/>

_Header image and graph images by Nick Ng, 18F._

<br/>
<br/>

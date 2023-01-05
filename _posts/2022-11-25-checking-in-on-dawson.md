---
date: 2022-11-25
title: >
  18F Checks In With the DAWSON Project at the US Tax Court
authors:
  - chris-holly
  - mike-marcotte
  - alex-soble
  - julia-allen
  - mark-meyer
tags:
  - 18f
  - agency work
  - case management system
  - interview
  - open source
  - tax court
excerpt: >
  The United States Tax Court is an independent federal court that settles disputes between taxpayers and the Internal Revenue Service. Since the 1980s, the Court has used a modified commercial software product to manage its operations. Last year the Court introduced DAWSON, a modern open-source case management system developed with assistance from an industry partner and 18F. DAWSON streamlined Court operations and changed the way the public interacts with the Court.
---

![The USTC DAWSON electronic case file system's homepage]({{ site.baseurl }}/assets/blog/ustc-dawson-checkin/dawson-home.png)

The United States Tax Court is an independent federal court that settles disputes between taxpayers and the Internal Revenue Service. Since the 1980s, the Court has used a modified commercial software product to manage its operations. In December 2020 the Court introduced [DAWSON](https://www.dawson.ustaxcourt.gov), a modern open-source case management system developed with assistance from an industry partner and 18F. DAWSON streamlined Court operations and changed the way the public interacts with the Court.

We checked in with Mike Marcotte, Director of Enterprise Applications and Tech Lead on the DAWSON project, and Chris Holly, DAWSON’s Product Owner, to see how the project has been going.

-----

### _What has been going on since 18F rolled off?_
**Chris Holly (Product Owner):** Lots! For the last year we’ve been working towards implementing critical features for users and the Court. This year, we’ve introduced: a feature that gives users the ability to search for orders and opinions, a mechanism for the Court to seal case documents selectively (as opposed to sealing the entire case), a streamlined “stamping” process for motion disposition, and we’re working on ways to better manage groups of cases. Along the way, we’ve talked and listened to folks to learn about defects that they have found and then fix them, and implemented quality-of-life improvements in every area of DAWSON, such as integration with the Court’s help desk system.

**Mike Marcotte (Director of Enterprise Applications, Tech Lead):** We took a good look at deployment procedures, every item in our refactoring backlog, and had healthy discussions about software development metrics, psychological safety, and how to best incorporate the user experience (UX) into our workflows. The team emerged much healthier and more productive as a result. We’ve consolidated our cloud hosting environments, which resulted in significant savings and simplified the process of receiving completed work. As Tech Lead, I was able to take twelve weeks of parental leave after successfully onboarding our DevOps Engineer. Our DevOps Engineer continues to gain steam by adding capacity, refining processes, and ensuring stability of the project.

### _What makes you most proud about this project?_

**Chris Holly:** I love the fact that it’s an application that serves not just the Court employees but the customers of the Court: the petitioners and practitioners who are trying to engage with the government to resolve their issue.
For example, early in the summer, we set up a process to send low income taxpayer clinic letters to the appropriate petitioners with their DAWSON notices. The letters inform petitioners about taxpayer clinics in their area. We are now including the letters attached to official documentation both at the beginning of the lifecycle of a case, and again when the case is calendared for trial.
I’m also proud to work on something that’s so integral to the operation of the Court, and proud of how the Court is listening to diverse groups of users.
Ultimately, to me this project is about how to make engaging with the Court  - whether as an employee or ‘customer’ - as easy and straightforward as possible, while providing a system that everyone can trust to be a good steward of their data.

**Mike Marcotte:** I’m proud of DAWSON’s stability. There have been a few bugs here and there, but compared to the early months after launch, the bugs that we have had to tackle at one time have been few and quickly solved. Deployments are very predictable, and we are marching forward at what seems like a healthy rate. Knock on wood, the application has had only one outage in the last two years due to our service provider’s unexpected outage in one region. DAWSON came out of it more resilient than before. If a similar outage occurred  today, we would stay up and running. We owe much of this to the automated tests that improve with each deployment.

<div class="testimonial-blockquote" markdown=1>
Every week we think of new opportunities to bring to the system - it’s been great to be able to think outside the box.
<span>– Stephanie Servoss, Clerk of the Court</span>
</div>

### _What are some recent challenges or interesting problems that you have been working on?_

**Chris Holly:** Creating the stamp disposition was such an exciting challenge. The Court wanted the digital analogue of those old rubber stamps that you could just “ker-chunk” onto a motion rather than writing an entire order to grant or deny a motion. So we brainstormed with the Court and our industry partner. As we iterated on the design, we shifted from a very context-specific solution to a one-size-fits-all solution that gave the Court enough common options across motions. We realized that we could simplify the mechanism and the change management needed to implement it.  We saw  a willingness among Court stakeholders to collaborate and make process decisions in the interest of delivering the best possible user experience. We ended up with something that covered about 90 percent of the solution, and ultimately has room to grow.

**Mike Marcotte:** Managing a project that relies on open source dependencies has been challenging as some of them stop being maintained. This has forced us to consider alternatives or take on the task of maintaining the dependency ourselves. Specifically, our text editor for drafting documents is no longer supported, and we now are considering using the Court’s Microsoft Azure license to integrate Microsoft Word within the application. Thanks to feature flags, the application can easily be configured to use an alternative solution. Another dependency that is no longer supported is our React state management solution, which is a critical low-level component of the application. We decided to maintain it for now while conducting experiments with other solutions that might better fit the project in the long term.

-----

Shout-out and kudos to the many, many team members at the Tax Court, 18F, and industry partners who worked on this project over the years and brought DAWSON to where it is today! :heart:

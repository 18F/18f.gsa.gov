---
date: 2022-11-29
title: >
  18F Checks In With Jerome Lee and the eAPD Project
authors:
  - alex-soble
  - michael-walker
  - jerome-lee
tags:
  - 18f checks in
excerpt: >
  At 18F, we like to keep in touch with our project partners. 18F partnered with
  the Centers for Medicare and Medicaid Services (CMS) from December 2017 to
  June 2020 on the development of a product called eAPD. We caught up with
  Jerome Lee of CMS, the product owner of eAPD.
---

Calling up an old friend is always a good idea.

At 18F, we like to keep in touch with our project partners. Our consulting model
means that when we partner with other government agencies, we know that the
partnership will eventually have to come to an end. We try to design engagements
so that the work can continue without us. If all goes according to plan, by the
time 18F rolls off a project, our government partners can smoothly carry on the
product, design, development, and vendor oversight work independently.

18F partnered with the Centers for Medicare and Medicaid Services (CMS) from
December 2017 to June 2020 on the development of a product called eAPD — a
user-friendly, modern product to streamline the creation, submission, review,
and approval of the [Advance Planning Documents](https://www.federalregister.gov/documents/2010/10/28/2010-26727/state-systems-advance-planning-document-apd-process)
that states use to request IT grant funding from CMS. We caught up with Jerome
Lee of CMS, the product owner of eAPD.

These are Jerome’s opinions and are not official views of the Centers for
Medicare & Medicaid Services or the US Public Health Service.

### _Hello Jerome! So, catch us up: What has been going on with the project since 18F rolled off over two years ago?_

A whole lot! 18F helped us transition to a new vendor in 2020. We took the
codebase, pipeline, and design work and got it ready for ATO. In the summer of
2021, we took eAPD live to all states for
[HITECH (Health Information Technology for Economic and Clinical Health)](https://www.medicaid.gov/medicaid/data-systems/health-information-exchange/federal-financial-participation-for-hit-and-hie/index.html) APDs. HITECH
is a funding source focused on promoting interoperability between electronic
health records and with external sources.

Over the last year or so, we’ve kept improving our DevOps pipeline — for
example, we added end-to-end testing with [cypress](https://www.cypress.io/). We
brought in a Quality Team. We are trying to shift testing earlier in the
process, getting our Quality Team involved in conversations at the design stage
about questions like “what are acceptance criteria?” and “what does it look like
when a user is interacting with these designs?”

To prepare for the next major phase of the project, we’ve also spent time
preparing other parts of our infrastructure to receive other types of APDs. Next
up, MMIS (Medicaid Management Information System) Implementation Advance
Planning Documents (IAPDs)! This is a really important step in the project
because MMIS IAPDs make up the largest volume of APDs that I receive as a state
officer and probably holds the most interest for our state partners. We’ve
already started working on it and are looking to pilot it in the next couple
months.

We started this project as an experiment to demonstrate what it means to have a
business owner who is deeply tied to development of the product, and I think
we’ve demonstrated that it is a value-add. As a Medicaid Enterprise Systems
State Officer who has reviewed APDs for almost eight years, I have insight into
the pain points that states and federal reviewers experience in the process. I
review APDs, and at the same time serve as Product Owner for a product to make
the APD process simpler — to “build products that you’d want to use.”

### _Can you talk about the process of preparing the app for public release?_

CMS is piloting a continuous authority-to-operate (ATO) process. One of my
colleagues helped manage that process by getting the security documents in
place, going through penetration testing, and coordinating the final signoff.

For accessibility testing, we worked with CMS’s 508 compliance team which
includes non-sighted testers who were able to load up the eAPD product, navigate
it with screen readers, and report back to us on any issues. We remediated the
issues that the user group reported, and we keep an ongoing focus on
accessibility.

When we got the green light to go live it was a very exciting moment. Because of
our DevOps approach, we had been deploying code through our pipeline the whole
time, so we knew the deploy pipeline was stable. It was as simple as sending an
email as saying “the system is live” once we finished the ATO process.

### _How has the experience of reviewing APDs changed for states and state officers using eAPD?_

We have been finding that eAPD reduces the overall size of the Advance Planning
Document (APD). For one state, we saw the size of the APD shrink by about 40% or
50%. eAPD focuses only on what CMS needs from a regulatory standpoint, and it
now includes more help text about what information states need to provide. More
focused documents are great for the reviewers as well as the state staff. It
reduces the amount of documentation that the reviewer needs to review and the
state needs to generate.

The system is able to calculate budgets and totals on the fly, which minimizes
the amount of re-verification I need to do. That saves me a tremendous amount of
time as a state officer, and it helps me focus on the purpose of the grant
request. Our user testing showed that state officers spent less time
double-checking the math, and more time focusing on the purpose of the APD.

### _What are some recent challenges or interesting problems that you have been working on?_

The biggest challenges often involve questions like “How do we make better use
of our time to improve the speed of delivery?”, “Do we have too many meetings?”,
“How do we make sure the people who need to be included are included, but also
allow people to focus on their work when they need to?”

Balancing stakeholder expectations is also an ongoing and important challenge.
We want to roll out new features, make sure our code is well-tested and
high-quality, and ensure the user experience is excellent.

### _What makes you most proud about this project?_

That’s a tough one, because I am proud of a lot of things!

At the end of the day I’m most proud of the character and caliber of people I
work alongside. Teams and people solve problems, technology is just a tool to
get there. I’ve seen the leadership of our tech lead, design lead, and DevOps
lead mature and blossom. They’re not just solving the hard technical problems,
they are mentoring too, and encouraging people on the team to solve problems and
take ownership over them.

---

Shout-out and thank you to all the
[contributors who have worked on eAPD over the years](https://github.com/CMSgov/eAPD/blob/main/package.json#L36:L69).

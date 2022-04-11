---
date: 2022-05-01
title: Finding post-award balance with quality assurance
authors:
  - ryan-ahearn
  - jessica-dussault
  - steven-reilly
tags:
  - QASP
  - post-award management
image:
excerpt: |
  If you’re one of the many federal employees carrying out your mission through contracting, you might have an important question: how do I know if my contractor is doing a good job?
  Even if you don't have a strong technical background, there are steps you can take to build your confidence in the project’s maintainability and sustainability.
---

If you’re one of the many federal employees carrying out your mission through contracting, you might have an important question: how do I know if my contractor is doing a good job?

Working with a development team can take a variety of forms. You may be in an oversight role, or a mixed oversight/contributor role, or be a contributor alongside the contractor team. In any of these situations, there are two things that can help ensure the team is on track:

1. A well-written Quality Assurance Surveillance Plan (QASP)
1. Taking the time to establish a collaborative working relationship

In this post, we’ll talk about what this might look like for a project’s technical lead, that is, the federal employee responsible for the agency’s software engineering approach. Even if you don't have a strong technical background, there are steps you can take to build your confidence in the project’s maintainability and sustainability.

But first, let’s talk about QASPs.

## What is a Quality Assurance Surveillance Plan?

<img src="{{site.baseurl}}/assets/blog/finding-post-award-balance/loc-fdr-study.jpg" alt="Franklin Roosevelt inspects stamps with a magnifying glass">
<figcaption><em>Franklin Roosevelt may not have inspected vendor code, but if he did we imagine it would have looked something like this. Image source: <a href="https://www.loc.gov/resource/hec.40758/" rel="noreferrer" target="_blank">Library of Congress</a></em></figcaption>

A Quality Assurance Surveillance Plan, or QASP, is a document used to evaluate the work a contractor does on behalf of a federal agency. A QASP contains a list of desired outcomes and a method to measure the outcome's success which both parties have agreed to: the federal agency by writing it and the contractor by accepting the contract.

When a federal agency relies on a contractor to build or maintain a product, the agency and contractor naturally measure success in different ways. The presence of a QASP does not mean that an agency mistrusts the contractors they work with, nor that the contractor does not wish to do a good job. Rather, the QASP aligns the expectations of the agency and contractor, so everyone understands how they are working together.

## What makes a good QASP?

The deliverables in the QASP should reinforce the existing behaviors and activities of a well-functioning development team. Importantly, none of these deliverables are themselves reports, but rather are byproducts of the actual development work. This allows the development team to focus on delivering, not report-writing.

### Deliverables are objectively measurable

As much as possible, QASP deliverables should be objectively measurable by automated tools. There is less room for interpretation in "code has zero linting errors" than there is in "code is well-written". Some examples of objective measures include:

- Percentage of code covered by tests
- Count of linting errors
- Count of accessibility scanning errors and warnings
- Count of security scan findings
- Whether the application can be automatically deployed or not

Of course, nothing can be fully automated, so there will be some subjective measures. This is true both in support of objective measures and as separate deliverables. Generally, objective and subjective measures work together to provide both qualitatitave and quantitative data, giving you a fuller picture. Some examples of important measures that are still subjective are:

- The team is meaningfully testing their code. Tests are meaningful when they accurately exercise the behavior of the code that is being tested. Tests would fail this measure if they are written in a way that they are guaranteed to pass no matter what the code does.
- The team is conducting usability testing and user research and results are incorporated into the product.

With both objective and subjective measures, an agency technical lead should work to focus the oversight, helping to sort the signal from the noise. By automating the objective measures, a technical lead can greatly reduce their repetitive tasks, freeing up time and brainpower for the project's strategic work.

### Deliverables are connected to successful outcomes

Metrics aren’t neutral, and some deliverables are unrelated to success. For example, it’s enticing to track the number of story points delivered in a sprint. However, tracking a metric encourages team members to maximize it. Because story points are an arbitrary value, this incentivizes performative work over productive work.

In addition, the deliverables must connect to outcomes that the team actually controls. Setting a deliverable of zero security vulnerabilities found would be impossible; new vulnerabilities are disclosed every day. Instead, standards for zero vulnerabilities _introduced_ by the team's changes as well as rapid mitigation and remediation are both within the team’s control. If you are unsure about the best standard for your team's needs, talk it over with your vendor. By being open about your incentives and constraints, you can arrive at an approach that is mutually beneficial.

Because the project’s priorities will shift over time, an agency technical lead should keep an eye on the team’s progress towards its ultimate goal, focusing on outcomes over outputs.

### Deliverables encourage rapid feedback

Faster feedback means higher confidence and faster improvements. Automated scans and tests provide feedback to the development team every time code is pushed to the repository. This rapid feedback makes it easier to meet the QASP, reduces the time a manual review takes to complete, and reduces the back-and-forth during the manual review.

Manual reviews should be completed at the fastest pace possible. This may be per-feature or per-sprint; each has its benefits:

- Reviewing feature branches as they are merged into main means more reviews, but each one is more focused and has a smaller scope, which makes it easier to identify issues as well as celebrate improvements.
- Reviewing all of the code a team completes every two weeks is much more difficult to do, but has the advantage of happening on a regular schedule.

In either case, any cadence longer than two weeks means there will not only be too much work to reasonably review, but also it will be more difficult to adjust course if needed.

To do this, an agency technical lead must stay involved in the ongoing work. It's easier to provide rapid feedback if you are already familiar with the project.

## How can you use a QASP to support an iterative development team?

A QASP by itself is just a piece of paper. To be a tool for quality assurance, a QASP requires people to work together. It requires a collaborative relationship between the federal technical lead and the contractor team when working in an iterative environment.

Building trust between the technical lead and contracting team means finding a balance between conducting effective oversight and providing the team the time and space they need to perform.

### Committing to more time and effort

Being engaged with quality assurance surveillance takes time and effort. The federal technical lead will need to be more involved in each development cycle to prioritize features, guide decisions, and approve changes. This can be particularly difficult to achieve for agencies who lack technical staff or are stretching existing staff across many projects. Although the process is more work, it's worth it! For this effort agencies get:

- A closer working relationship with the contractor
- A product that better suits their needs
- Earlier detection of issues or miscommunications around a product
- Ownership over documentation, code, and knowledge, which carries over between contractors

### Focusing on the work that’s most valuable

When balancing time versus quality, focusing on the work that's most valuable to the end-user is a great guiding principle.

- Match up with product roadmap and prioritization
- Use plain language to ensure understanding of specialized concepts across the whole team
- Don’t overfocus on rigid adherence when that’s not helpful

For instance, at the beginning of a process, the team will need to build out the continuous integration / continuous deployment (CI/CD) pipeline that is responsible for automated tests and scans. You'll need to select and align on standards, such as the linting rules to be used. As a result, it’s not possible to be fully in compliance with the QASP until that work is complete. For this kickoff stage, feel comfortable postponing aspects of the QASP as long as there are known paths to getting to compliance.

## The real quality assurance is the friends we made along the way

Remember, a QASP is not a substitute for a working relationship. Even the best designed Quality Assurance Surveillance Plan will not improve the product without  cooperation, trust, and shared understanding between the federal and contractor staff. The QASP inserts formal steps into the middle of this human relationship and is an extra process on top of each team's normal workflow. It requires both the agency and contractor to step out of their comfort zone initially.

Who enforces the QASP? You do, and you’ll be good at it. Ideally, you have familiarity with the technical tools being used by the development team, but even if you don’t, you can still ensure the team is on track through the automated tests and regular demonstrations of features and their implementation. If you find yourself getting lost in the details, remember that a QASP is a tool to help you build a healthy partnership and a quality product.

Please see the [The 18F De-risking Guide](https://derisking-guide.18f.gov/federal-field-guide/doing-the-work/#monitor-conformance-with-the-qasp-at-the-end-of-every-sprint) for more information about the quality assurance process, as well as a [sample QASP](https://derisking-guide.18f.gov/qasp/).

_Thank you to Alex Bielen, Andrew Dunkman, Laura Gerhardt, Mark Hopson, and Matt Jadud for their insight and guidance in writing this blogpost._

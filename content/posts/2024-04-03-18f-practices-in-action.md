---
date: 2024-04-03
title: >
 18F practices in action (spoiler: this stuff works)
authors: 
  - jon-roberts
  - michelle-rago
  - neil-martinsen-burrell
tags: 
- 18f
- how we work
excerpt: >
 Do 18F software development principles really work? We reflected on a recent project to see how well 18F recommendations aligned with what we actually did. 
---

18F just completed a successful two-year partnership with the Cybersecurity and Infrastructure Security Agency (CISA) [.gov registry](https://get.gov/about/). Together with an excellent vendor team, we built a [new way to request and manage .gov domains](https://get.gov/posts/2024-01-31-new-way-to-get-a-.gov/). The project included three phases: discovery, build, and launch. Because 18F so rarely works on a project all the way from discovery through to a public launch, this is a great opportunity to examine how well the CISA project aligned with [software development practices recommended by 18F](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/). 

Spoiler alert: These practices really work! 

## User-centered design

> 18F recommendation: “All software development should be [centered on the needs of the software's actual end users](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/#user-centered-design), the specific people who are expected to use it."

We conducted user research during each phase of this project. We interviewed users, conducted usability testing sessions, and reviewed metrics reports and help desk reports. Team members from all disciplines participated in our research with new users (those who were eligible for a .gov domain, but didn’t yet have one) and existing users (those who already managed one or more .gov domains). We created a [customer panel]({{ "/2024/02/01/gathering-feedback-with-customer-panels/" | url }}) to get feedback from existing users.

We’re grateful to the users, from [all levels of government](https://get.gov/domains/eligibility/#government-organizations-at-all-levels-are-eligible-for-.gov-domains), who helped build these products! The .gov team will continue to iterate based on user needs and feedback. 

## Agile software development

> 18F recommendation: “Instead of relying on years of costly planning and ‘requirements gathering’ before beginning to write actual software, [agile development projects](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/#agile-software-development) are planned only in broad strokes, with a well defined description of the overall project goal and a strong preference for just getting started…By coupling agile with user-centered design, a development team can constantly iterate toward solving the needs of end users in ways that would have been impossible to learn about up front.”

We practiced agile development to continually improve our product. We operated on two-week sprint cycles, releasing improvements to production a few times per week. We conducted sprint planning, retros, and backlog refinement sessions. 

The registrar and website we developed are open source. You can follow the work on GitHub.

- [GitHub code repository for the .gov registrar](https://github.com/cisagov/manage.get.gov)
- [GitHub code repository for the get.gov website](https://github.com/cisagov/get.gov)

## Product ownership

> 18F recommendation: “The [product owner is the key person](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/#product-ownership) for any software project, and must be a government employee…A strong product owner ensures that the vision is clear, the strategy is clear, there is space for teams building the software to learn, and that they are building or buying the right thing to incrementally show value to users.”

Our CISA product owner had the authority to speak for the .gov program, communicate directly with users and stakeholders, make decisions, prioritize, assign work, and hire staff. He had a clear vision and established a professional and respectful team culture. He made it possible for the team to focus on user needs, work in the open, and communicate using the same tools (even though team members were from different agencies and companies).

## DevOps

> 18F recommendation: “Under [DevOps](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/#devops), testing software quality is automatic, testing software security is automatic, merging multiple developers' work is automatic, and moving completed software to servers is automatic.”

Our infrastructure included staging and production environments, developer sandboxes used for testing and previewing code changes, and automated testing. Automated testing included field input tests and website accessibility tests. Every source code change had to pass automated tests and had to be reviewed by another team member.

Because we’re committed to working in the open, our [source code commits are public](https://github.com/cisagov/manage.get.gov/commits/main/). Technical decisions were documented in publicly available [architectural decision records](https://github.com/cisagov/manage.get.gov/tree/main/docs/architecture/decisions).

# Building with loosely coupled parts

> 18F recommendation: “In this model, each component communicates with other components through [simple, modular standards](https://guides.18f.gov/derisking/federal-field-guide/basic-principles/#building-with-loosely-coupled-parts), so that any one piece can be swapped out at any time.”

The .gov registrar and the get.gov public website use several components and shared services. Here are a few examples.

- API to [check the availability of .gov domains](https://get.gov/#domain-input)
- API to [connect the registrar with the registry](https://github.com/cisagov/manage.get.gov/blob/main/docs/architecture/decisions/0018-registry-integration.md)
- [.Gov data repository](https://github.com/cisagov/dotgov-data)
- [Login.gov](http://Login.gov) for authentication and identity verification
- [Cloud.gov](http://Cloud.gov) for site hosting
- [Search.gov](http://Search.gov) for searching the public website
- Google Analytics (GA) through the [Digital Analytics Program](https://digital.gov/guides/dap/), and a separate instance of GA, for measuring web traffic

## Modular contracting

> 18F recommendation: “With the [agile contract template](https://guides.18f.gov/derisking/federal-field-guide/deciding-what-to-buy/#use-the-agile-contract-format-to-procure-agile-software-development-services)…agencies should procure developers' time, as prioritized by the government product owner through an agile cadence. Any contract must secure sufficient data rights for the agency in the work product or result of the development effort based on their mission needs.”

Our vision statement described the work we planned to do at a high level. This vision supported our [agile contracting](https://guides.18f.gov/derisking/federal-field-guide/deciding-what-to-buy/#use-the-agile-contract-format-to-procure-agile-software-development-services) goal by focusing on the purpose of the work. This contracting method allowed us to acquire agile software development services.

We brought on an excellent, agile software development vendor to work with the federal team. The vendor team worked in an incremental manner and delivered solid code that served user needs.

## The word is spreading

Practices like ours are getting recognized across government for the way they allow us to meet user needs, develop more sustainable products, save money, and provide value as soon as possible. Here are a few examples of how other organizations describe similar approaches.

- [A revised and expanded guide for de-risking government technology projects (GSA.gov blog)](https://www.gsa.gov/blog/2024/09/11/a-revised-and-expanded-guide-for-derisking-government-technology-projects)
- [Digital Services Playbook (U.S. Digital Service)](https://playbook.cio.gov/)
- [The NGA Software Way (National Geospatial-Intelligence Agency)](https://www.nga.mil/assets/files/The_NGA_Software_Way.pdf)
- [Government Design Principles (Gov.UK)](https://www.gov.uk/guidance/government-design-principles)



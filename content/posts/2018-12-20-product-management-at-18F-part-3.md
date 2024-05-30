---
title: "Product management at 18F, part 3 - Products and Platforms"
date: 2018-12-20
authors:
- bret
- will
tags:
- how we work
- product
- platforms
excerpt: " While our consulting work serves the needs of a particular customer, managing one of our products means we are responsible for a shared service used by many of our partners. Managing one of the products and platforms means thinking beyond any individual customer. This work requires that we constantly evaluate market needs, ensure the product matches those needs, and support the business side of product management."
---

*This is the third of a series of blog posts that will provide a glimpse
into what it’s like to be a product manager at 18F.*

18F is in the transformation business, and our products are integral to
the services we provide. While our consulting work serves the needs of a
particular customer, managing one of our products means we are
responsible for a shared service used by many of our partners. Managing
one of the products and platforms at 18F means thinking beyond any
individual customer. This work requires that we constantly evaluate
market needs, ensure the product matches those needs, and support the
business side of product management.

[Cloud.gov](https://cloud.gov/) and [Federalist](https://federalist.18f.gov/) are two of these products. Together they power
hundreds of .gov sites, including the websites for the Federal Election
Commission (FEC) and the Federal Deposit Insurance Corporation (FDIC),
as well as high profile informational sites like vote.gov, cio.gov, and
opioids.gov.

With a shared service, we have to think about marketing materials and
business development, as well as customer onboarding, customer support,
invoicing, and a host of other issues we would not typically address in
a consulting engagement. These touchpoints require as much attention and
care from the team as the development of user interface and technical
capabilities.

Managing a shared service at 18F is like taking ownership of a small
piece of a very large web. No individual person maintains the full web,
but our network of products are interconnected and support each other.
Instability in one product reverberates across our suite and can have a
painful impact on our partners, so we have to be cognizant of how
changes impact the entire network.

Making changes to the product may involve documenting and applying
[special processes](https://cloud.gov/docs/ops/continuous-monitoring/)
to ensure we are abiding by compliance requirements. This might require
coordinating communication between organizations such as the [FedRAMP Joint Authorization Board (JAB)](https://www.fedramp.gov/jab-authorization/), and [FedRAMP authorized Third-Party Auditing Organizations (3PAO)](https://www.fedramp.gov/assessors/).

Our products also depend on a set of available back-end tooling from
industry. For example, to monitor the service and respond to alerts, a
shared service needs an alert management system. Developing, operating,
and maintaining our own tools for meeting those needs is not practical,
nor is it central to our mission, so we delegate that responsibility to
good existing products. In choosing those products, we have to strike a
careful balance between picking the best available generally, and the
best available *to government*.

We also have to absorb the risk of suddenly losing access to a system
that we depend on. For example, if a provider loses their contract or
compliance status, we may be sent scrambling to reimplement changes with
another provider. Agile methods help us deal with these curve-balls. We
often find that using open source is preferable to accepting the risk of
compliance and procurement changes in a system we depend on, so we have
to make these decisions carefully.

Our teams are able to run these products because of the support we
receive from other TTS products. For example, the [Digital Analytics Program (DAP)](https://digital.gov/dap/) makes it easy for partners to find out who is searching
for and landing on their pages. Search.gov provides code for a powerful
custom search service for static sites. And the [US Web Design System](https://designsystem.digital.gov/)
provides base interface components and page templates that help us
quickly build effective federal websites. Most importantly, Federalist
is only possible because of cloud.gov’s underlying Platform-as-a-Service
technology.

In managing these products, we develop long-lasting relationships with
our partners and teams so that together we can build a strategic
understanding of the ecosystem. We’ve built team rituals to sustain our
teams through many iterations and transitions in government. And we run
regular retrospectives to surface issues and facilitate adjustments to
our working style. We know that maintaining relationships is the most
important part of the work we do because we recognize that our partners
are the ones serving the public through the content they create and the
services we manage.

---
title: "Prerequisites for modular contracting"
date: 2019-02-28
authors:
- waldo-jaquith
tags:
- acquisition services
- procurement
excerpt: "At 18F, we often advocate for modular contracting
— the practice of breaking up large, custom software procurements into a
small constellation of smaller contracts. In doing so, we’ve learned
that we’re more effective when promoting that message to people who are
familiar with the fundamentals of modern software development practices."
image: /assets/blog/Acquisitions/acquisition-post-header.png
---

At 18F, we often advocate for [modular contracting]({{ "/2017/10/11/pulling-back-the-curtain-on-it-procurement/" | url }})
— the practice of breaking up large, custom software procurements into a
small constellation of smaller contracts. In doing so, we’ve learned
that we’re more effective when promoting that message to people who are
familiar with the fundamentals of modern software development practices.

We’ve run dozens of workshops to teach our state and federal clients
about modular contracting. Like any good agile organization, we
constantly re-examine what we’re teaching and why. In doing so, we’ve
learned that modular procurement requires agile, product thinking,
user-centered design, DevSecOps, and loosely-coupled architecture.

## Agile software development

It's not difficult to manage the
contract for a software development team that is small, self-contained,
self-motivated, self-improving, self-organizing, customer-focused, and
building toward a shared set of objectives. [That’s agile](https://agile.18f.gov/). For Contracting Officer Representatives or Contracting Officers who may be accustomed to
adversarial relationships with software vendors under a traditional
procurement, working with an agile software team is a very different
reality. 

By having a development team ship a functioning, documented,
tested product every couple of weeks, it’s obvious whether they’re
working effectively, and it’s easy for a new development team to pick up
where a prior one left off. By dividing a big project into smaller,
stand-alone projects, each of those can be completed by a single agile
team, and those teams can even be at different vendors under different
contracts. By having somebody within the agency serve as the [product owner](https://guides.18f.gov/agile/agile-lexicon/#roles), and thus as the fulcrum for all work, key knowledge and decisions remain within the
government, making it easier to end contracts that aren’t performing,
knowing that a replacement team can pick up where the prior one left
off. It is crucial that agencies always be able to cancel a contract if
the agile team isn’t performing, or if the agency discovers what they
envisioned at the time of the RFP doesn’t serve user needs. Agile helps to ensure that the agency is always in a position to do that.

## Product thinking

Users of software are trying to solve a problem,
and [product thinking]({{ "/2018/12/11/product-management-at-18F-part-2-acquisitions/" | url }})
is about identifying that problem, connecting it to a vision for the
overall work, and the strategy for accomplishing that. That work,
[product management](https://product-guide.18f.gov/product-management-at-18f/),
must be overseen by a single person. As with the product owner, this
person needs to be an agency employee, rather than a contractor, so that
this key knowledge stays with the agency, while vendors come and go.
This is a different person than the product owner — the work being done
here is higher-level.

## User-centered design

Nobody knows the end-users of the software
better than the agency, and [user-centered design](https://product-guide.18f.gov/working-in-a-way-that-reflects-our-values/user-centered-design/)
centers the experiences and needs of those people throughout the design
process. The agency can remain in control by having the vendor build
software that is centered on the user needs by employing a user research
process that’s coordinated with product management, so that the product
owner can ensure that the vendor is producing high-value work.

## DevSecOps

One vendor can use the infrastructure established by
another vendor with absolutely minimal setup time, if they use
standardized continuous integration and [continuous deployment practices]({{ "/tags/devops/" | url }}), ideally with
infrastructure-as-a-service (often referred to “IaaS”) providers. After
the initial vendor sets up a government-owned source code repository,
continuous integration service, static and dynamic analysis service, and
gated deployment to a cloud host, subsequent vendors can easily use that
same pipeline with a few minutes of configuration work.

## Components loosely coupled via APIs

The old model was to design
monolithic systems (often referred to as legacy systems) containing
complex interactions, and attempt to coordinate work between vendors
collaborating on it. Now we have vendors build a series of smaller,
standalone systems, with only one vendor working on any one of those
systems. Each of those components communicates with the others via
standardized, documented API methods, for example,
[REST](https://en.wikipedia.org/wiki/Representational_state_transfer).
(This approach is also known as building
“[microservices](https://en.wikipedia.org/wiki/Microservices).”)
This simplicity facilitates “emergent architecture,” in which the
structure of an overall application can be designed gradually, as it is
needed, instead of being designed up front, which facilitates agile.

## Each prerequisite matters

Collectively, these practices make modular procurement viable. If agile
was omitted, it would be difficult for a new vendor to pick up the work
of an old vendor. If DevSecOps were omitted, it wouldn’t be plausible to
deliver working product increments at the end of each sprint. If
user-centered design were omitted, there’d be a real risk of delivering
a system that wouldn’t address user needs. And so on.

Modular procurement of custom products is often wise, and we’ll continue
to advocate for it and support our partner agencies in that goal, but
it is part of a larger process that includes all of these
prerequisites that are necessary for modular procurement to be viable.

*Thanks to Alan Atlas, Mark Hopson, and Vicki McFadden for their work in identifying these prerequisites for modular procurement*

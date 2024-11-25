---
title: "When to use Commercial Off-the-Shelf (COTS) technology"
date: 2019-03-26
authors:
- laura-gerhardt
- norah-maki
- mark-headd
tags:
- acquisition services
- best practices
- modular contracting
excerpt: "Often, when government looks to recompete or start a new IT project, they’re presented with a Commercial Off-the-Shelf (COTS) solution that promises to do exactly what is needed out-of-the-box. The decision whether to use a COTS product or build a custom software product should always be based on the needs and assets of your users and current infrastructure. No situation is exactly the same, but here are some general considerations to help you in choosing whether COTS is right for your project."
image: /assets/blog/COTS/commercial-off-the-shelf.jpg
---

Often, when government looks to recompete or start a new IT project,
they’re presented with a Commercial Off-the-Shelf (COTS) solution that
promises to do exactly what is needed out-of-the-box. There are a number
of reasons why agencies might find the acquisition of a COTS project
tempting, even desirable — potentially short timeline from acquisition
to usage, no long term maintenance requirements that often accompany
custom solutions, and sometimes minimal or no hosting concerns (if the
COTS is cloud-based).

The decision whether to use a COTS product or build a custom software
product should always be based on the needs and assets of your users and
current infrastructure. No situation is exactly the same, but **here are
some general considerations to help you in choosing whether COTS is
right for your project.**

## Start by articulating what you want the system to do and for who(m)

Before making any decision, you should be able to articulate the value
of the system you think you need and a general idea of some of the main
features to drive that value for the people who will use it. We often
call this a [product vision]({{ "/2018/12/04/product-management-at-18f-part-1-new-engagements/" | url }}),
which is a succinct and shared understanding of what we need.

The best way to surface how end-user considerations might map to a COTS
product is through a [value mapping exercise](https://www.epa.gov/sites/production/files/2015-06/documents/module_3_vsm.pdf).
These exercises help you identify which of your users' needs are unique
and which are a commodity. Use user research to start to evaluate user
needs, identify existing tools, and map out the components of the system
(for example, infrastructure, an email service, or an authentication
service). You can take advantage of the [18F
Methods](https://methods.18f.gov/) to help conduct this research and
assessment. When looking at the components, rather than the sum of its
parts, you may be more likely to reuse existing software, whether it’s
free and open source or COTS.

When evaluating a COTS solution to deliver your government service to
the public, be upfront about asking a COTS vendor to allow your users to
test out the product. In the demo, are users able to accomplish the
workflow with minimal pain and confusion? If not, assess the feasibility
of changes to the system to meet your end user needs.

**Additional technical considerations:**

- The feasibility and total cost (time and financial) to transition from legacy systems
- Ongoing operations and maintenance costs
- Costs related to being locked-in to a single vendor such as data migration, understanding of your business process, and uncovering technical debt.
- Costs associated with maintaining custom features, and who owns those modifications and the data associated with them

## When might you want to consider COTS?

**If it’s a product under active development, which often indicates that
they’re continuing to deliver value and responding to market needs.**
Product development and collaboration tools are a great example of this.
Here at 18F, we use many COTS tools to help us manage our continuous
integrations, product backlogs, design exercises, internal
communications, and vulnerability disclosure program. We want our
product development to align with private sector practices, and COTS —
typically Software-as-a-Service (SaaS) — helps us execute those
processes in a way that meets industry best practices. We benefit from
the ability to combine these tools with additional lightweight custom
scripts to best meet our unique work environment.

Following market trends can also be cost effective, because you’re
sharing the cost with other customers outside of government. We often
see the flip side of this with partners who are using collaboration or
development tools that are not actively used outside of government. In
these cases, agencies could end up shouldering the cost of nonstandard
or outdated practices, or technical debt that comes from using obscure
COTS products.

**If the same COTS solution is successfully in use elsewhere in
government (successful according to the users, not according to the
vendor).** A quick internet search can usually indicate if this product
is in production or has led to failure (for example, had serious cost
and time overruns, led to a lawsuit, or had major configuration
challenges). If it’s in use, check with the users — not the program
managers — of the system to see if it is meeting their needs
appropriately. They may be able to flag potential concerns around
customization or modification expenses. If it’s FedRAMP authorized, you
[can see which agencies use it](https://marketplace.fedramp.gov/) or
can use [USAspending.gov](https://www.usaspending.gov/#/keyword_search) to
start your research.

## What are some indications you should do more market research before moving ahead with a COTS solution?

**If you can see early on that the COTS solutions will require a lot of
modifications or customization to meet your user needs.** It’s rare that
your implementation will truly be “off the shelf”, and modifying COTS
solutions can have unexpected costs. Configuring a COTS product to meet
your needs is not inherently a problem, but we often see modifications
to the underlying code base grow to the point where the system cannot
handle any updates from the COTS provider. This poses security risks and
can be a risk to the long-term viability of the tool. Be sure to verify
that any customization and modification to meet your user needs will be
less costly than an open-source solution.

On the other hand, if the COTS product already meets your user needs,
does it come at the cost of having to support a suite of features that
your organization will never use? Large COTS platforms that are the
Swiss Army knife of solutions can leave your agency paying for large
licensing costs to support unused capabilities or features you will
never use. COTS providers will often have a disincentive to be
transparent about the maintenance costs of modification and may charge
additional costs for migrating existing data or extracting data when a
contract sunsets. You can mitigate this risk by procuring the smallest
possible solution or multiple smaller COTS products and [leveraging open-source components that fulfill discrete tasks]({{ "/2018/10/25/modular-contracting-and-working-in-the-open/" | url }})
so that you are less reliant on any one single component.

**If you’re looking for a software solution to meet your central program
mission.** Government services to the public are often unique and
distinct from private sector offerings. Therefore, if a private company
offers a product to manage a government service, it was likely developed
to be sold to multiple government entities, making use of decentralized
government purchasing. This can have advantages, but agencies can also
be susceptible to vendor lock-in. Vendors may have less incentive to
actively maintain and continue developing software with a small market,
meaning the government shoulders the cost of investment, but may end up
depending on nonstandard or outdated software to deliver against their
mission.

**If you’re looking for a tool for internal operations, such as human
resources or acquisitions, a COTS solution might not be able to deliver
against unique processes.** Government workflows are often unique and
face special regulatory and policy constraints. Even within government,
your specific regulatory framework is potentially different enough from
another agency’s that it would require extensive customization and the
cost-sharing of working with other agencies might not be realized. To
see if a COTS product meets administrative needs, you can do a similar
exercise to the value stream mapping described above. Map out the team’s
current and ideal workflows and conduct an assessment of how closely the
products that appear in your market research match the observed ideal
workflows. Most importantly, you need someone involved within the
government to advocate for migrating to those streamlined workflows; no
COTS solution will do that for you.

## What are the alternatives to COTS?

You have a few options:

1.  First, it’s worth asking if your processes could be adapted to meet the way the software already manages them. To do so, you need an empowered decision-maker who can prioritize users’ needs and enforce these changes.
2.  You can create a hybrid approach, where you leverage a combination of tools that communicate electronically (usually via an API) to meet your need. One example of this is [State of Alaska’s approach to developing a modern eligibility system](https://github.com/AlaskaDHSS/EIS-Modernization/wiki).
3.  You can leverage open-source technologies to build a custom solution that best meets your user needs. 18F has put together some [rules of thumb for reusing or customizing existing open source software.]({{ "/2017/10/23/how-reusable-is-open-source-software/" | url }})

One single approach may not be the best way to meet your needs. A
modular approach will allow you to create a small ecosystem of existing
and new tools to efficiently manage cost and feature necessity, whether
leveraging COTS or custom built open-source software.

Need help in evaluating these options for your office? Come [talk to
us](mailto:inquiries18f@gsa.gov) about how to make the decision in your
agency.

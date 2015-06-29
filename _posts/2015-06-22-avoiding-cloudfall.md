---
title: "Avoiding cloudfall: A systematic approach to cloud migration"
date: 2015-06-22
layout: post
authors:
- vdavez
- noah
- jfinch
- ozzy
- mbland
- chrisc
tags:
- 18f consulting
- modernization
excerpt: "18F has been working on reducing the costs of entry to the cloud and thinking about good practices for cloud migration. One good practice is to adopt a scaled approach to cloud migration to avoid cloudfall."
description: "18F has been working on reducing the costs of entry to the cloud and thinking about good practices for cloud migration. One good practice is to adopt a scaled approach to cloud migration to avoid cloudfall."
image: /assets/blog/avoiding-cloudfall/cloudfall.jpg
---

![A waterfall over rocks.](/assets/blog/avoiding-cloudfall/cloudfall.jpg)
*Source: [Recreation.gov Instagram](https://instagram.com/p/pZFSh0ivJe/)*

In 2011, the [White House recognized](https://www.whitehouse.gov/sites/default/files/omb/assets/egov_docs/federal-cloud-computing-strategy.pdf)
the enormous opportunity for the United States government to
increasingly migrate to “the cloud,” which [NIST has
defined](http://csrc.nist.gov/publications/nistpubs/800-145/SP800-145.pdf)
as a “model for enabling ubiquitous, convenient, on-demand network
access to a shared pool of configurable computing resources (e.g.,
networks, servers, storage, applications, and services) that can be
rapidly provisioned and released with minimal management effort or
service provider interaction.” In other words, the “cloud” is not one
thing, but rather a collection of resources and services on
other people's computers.

18F has, in recent months, been helping partner agencies do so. To do it
successfully,18F has been working on [reducing the costs of entry to
the cloud](https://18f.gsa.gov/2015/05/08/layering-innovation/) and
thinking about good practices for cloud migration. One good practice is
to adopt a scaled approach to cloud migration to avoid cloudfall.

##What is cloudfall?

It’s no secret that 18F promotes [agile and iterative
development](https://playbook.cio.gov/#play4) over traditional
“waterfall” approaches to software development.
[Waterfall](http://en.wikipedia.org/wiki/Waterfall_model), broadly
defined, is a lock-step approach to development, with an emphasis on
identifying all system requirements before development begins. There are
[many
reasons](http://ben.balter.com/2011/11/29/towards-a-more-agile-government/#b-waterfall-software-development-fails-to-adequately-respond-to-the-ever-changing-conditions-that-make-up-a-projects-problem-space)
why waterfall approaches often lead to poor results, but we focus on
two:

1.  **Forecasting**. It’s extremely difficult to predict what an agency will need, especially on something brand new to the agency; and

2.  **Multiple Dependencies**. Particularly when dealing with multiple systems, shifting dependencies and priorities make it difficult to just “flip a switch” and expect results.

By contrast, agile and iterative approaches increase the likelihood of
success, because they demand constant learning and continuous
improvement.

When it comes to moving to the cloud, some agencies — perhaps due to the
continued dominance of waterfall in federal IT — try to identify all of
the system requirements for the cloud and to design for most of the
implementation questions at the outset, before actually starting to
migrate to the cloud. We call this up-front approach cloudfall.

It should come as no surprise that, when it comes to cloud migration,
18F promotes iterative migration over cloudfall. Defining the system
requirements of moving to the cloud should not be an all-up-front
exercise. Instead, to successfully migrate to the cloud, agencies should
start small, adopt a *systematic framework* for cloud migration, and
embrace continuous improvement.

##A better approach: A systematic framework for cloud migration

Migrating to the Cloud using an iterative approach demands that an
agency focus on two critical topics:

1.  **Acquisition alignment**: Ensuring that the agency’s procurement strategy is closely linked to the deployment strategy.

2.  **Staged prioritization**: Deciding what applications and services to prioritize for migration.

### Acquisition alignment

It’s fundamentally important to appreciate that, today, cloud
*infrastructure* is largely a
[commodity](http://www.forbes.com/sites/timworstall/2014/04/15/cloud-services-become-quite-literally-a-commodity/)
that can be bought on the commercial market on-demand. As such,
developing a procurement strategy around cloud infrastructure is not the
hard part; there are [ample resources and well-understood
requirements](https://www.fedramp.gov/) regarding infrastructure
service.

In contrast, *deployment* of applications and services onto a cloud
infrastructure is much more specialized. Accordingly, purchasing
decisions around deployment will require close coordination between the
program and procurement offices and strong execution. Fortunately, by
using an iterative approach to cloud migration, both offices can develop
a greater understanding of each others’ needs and continuously improve
as migration proceeds.

### Staged Prioritization

In parallel with our [general
product-stage](https://18f.gsa.gov/dashboard/stages/) approach, cloud
migration can be broken down into roughly four major phases: Discovery,
Alpha, Beta, and Live.

-   **Discovery**: Focus on understanding what you want to migrate.
In this stage, the goal of the agency should be on inventorying the
applications and services that the agency wants to migrate.

-   **Alpha**: Focus on easy, demonstrable migrations.
In this stage, the goal of the agency should be on choosing applications and services that are *easy* to migrate and that can
demonstrate early success. Here, we mean “easy” as in applications and
services that have minimal integrations with other systems, very few
proprietary dependencies, and are likely to have a minimal
cloud-infrastructure footprint.

-   **Beta**: Focus on the cost-to-footprint ratio.
In this stage, the goal of the agency should be on deploying
applications and services that have large cost-to-footprint ratios,
where the numerator is the overall *infrastructure* cost and the
denominator is the overall *application or services’s* technical
footprint. If there are relative simple applications that have
significant computing costs, those are the highest priority during the
beta stage.

-   **Live**: Focus on key performance metrics.
In this stage, the goal of the agency is to continuously improve and
to benchmark the overall quality — at a stack level and across stacks
 — using metrics related to (among other things) reliability, security,
and efficiency of systems.

For example, say an agency has two applications: one application with a
minimal number of dependencies and small cost, and second application
with a moderate number of dependencies but a significant cost. The first
application should be prioritized for the *alpha* phase, even though it
has a smaller immediate business impact, because it can be an easy,
demonstrable migration. The second application should be prioritized
early during the *beta* phase because it has a high cost-to-footprint
ratio.

There may be other ways to prioritize your agency’s cloud migration,
depending on your specific needs and opportunities. But, in general,
your agency should have a methodology to prioritize which applications
and services should be migrated and when.

##Conclusion

If your agency is considering a move to the cloud, we hope that you’ll
consider using a systematic framework for iterative migration instead of
cloudfall. If you do, and if you want 18F to help, drop us a line at
[18FC@gsa.gov](mailto:18FC@gsa.gov).

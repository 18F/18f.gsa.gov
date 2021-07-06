---
title: "Architecture Decision Records: Helpful now, invaluable later"
date: July 6, 2021
authors:
  - eleni-chappen
  - ryan-hofschneider
  - michael-king
  - tim-ballard
tags:
  - culture change
  - best practices
excerpt: An Architecture Decision Record is like a journal entry for the life of
  your software
---
**TL;DR**

* People need to know how software has changed over time
* Architecture Decision Records (ADRs) are “just right” for this purpose
* ADRs have many other benefits
* Getting started with ADRs isn’t hard!

You own a software system. Luckily you’re able to hire someone to work on it. This person wants to learn more about the system so they can be confident that their changes don’t break things. They’d like to talk with the engineers who wrote the code, but they’re no longer around. 

This scenario is all too common. When someone new doesn’t have the luxury of talking to other maintainers, they have few ways of learning about what was already done. 

They could read the code as-is, but there are problems with this approach. Reading code will only describe the way the world is now, not what it was in the past, or what it could’ve been instead.

For what code was like in the past, they could reference the version control history, like Git commits. But this history may lack broader context—commits often don’t describe the larger “why” behind code changes, or the other options considered. 

For context, they could reference evergreen documentation, like a README. But since this type of documentation isn’t tied to code, it may be out of date, inaccurate, or not relevant to the maintainer’s needs.

In government, they could reference the System Security Plan or other compliance documentation, which may have details on the overall system design. But these resources can also be too high-level or out of date. 

Code represents a system, and systems inevitably change over time. Knowing how and why systems change over time can be very useful for a new software maintainer. But it’s most useful to them to view changes at a level slightly above the steady stream of the commit history. 

What level of documentation is “just right” here? Enter the [Architecture Decision Record](https://adr.github.io/), or the ADR. Developers write ADRs as the level in between the commit history and more evergreen docs. 

Writing ADRs takes effort, but they can be very helpful for current maintainers of a system and invaluable for future ones. Considering the benefits, they’re a worthwhile investment in the long-term life of a software product. 

## What is Software Architecture?

First, what do we mean by “architecture” when we talk about software? 

When we think about architecture in the “real” world, we think about buildings, roads, and other physical infrastructure. We might use words like foundation, groundwork, support, and structure.

These concepts also exist in software. For example, the web framework on which you choose to build your website is foundational to the rest of your code. Switching frameworks could mean rebuilding the codebase from scratch, just like replacing the frame of a house means building the house again from the ground up. 

Does any code change affect the architecture of a software system? Does every code change need an ADR? No it doesn’t. Just as a new coat of paint isn’t architectural, lots of code sits on top of the software architecture and can be added, removed, or changed without affecting the underlying structure.

When developers consider a structural change to the program, they need to think through:

* How costly will this change be in time, money, and effort? 
* Does this change add complexity to the system, or simplify it? 
* Will this change require more changes? 
* What are the security implications of this change?

The context around these decisions is critical, but is often kept in the heads of developers and never written down. Or if it’s written down at all, it’s done in an ad-hoc fashion and stored in multiple places. It’d be great if these decisions were explained in a consistent way, in one place that everyone can find. That’s exactly what ADRs try to do.

## What’s an ADR?

Think of an ADR like a journal entry for the life of your software. When you’re making a software architecture decision, you add a record to the collection.

Generally a record describes:

1. **Context**: Why did this change need to happen? What needed to be considered?
2. **Options**: What were the options? What were the pros and cons of each?
3. **Consequences**: What will happen as a result of this change?
4. **Status**: Has the decision been implemented, or is it still being researched?

Here is an example ADR documenting the selection of a database product:

<pre style="word-wrap: break-word; overflow-x: auto; white-space: pre-wrap; margin: 2rem 0;">
#4. Default database

Date: 2020-10-22

## Status

Accepted

## Context

We will likely need several relational database cluster instances (and likely per-state logical databases) in order to provide good data isolation within the system. However, usage within an individual database is expected to be fairly basic and undemanding.

## Decision

We have decided to use PostgreSQL across the system and maximize the use of database-agnostic SQL.

## Consequences

- The PostgreSQL Product-as-a-Service (PaaS), being based on an open source platform, is about 1/3 the hourly price of a similar, commercial database PaaS.
- We do not have data on whether or not PostgreSQL is commonly used at the partner agency. By using database-agnostic SQL, we aim to mitigate the risk of introducing a new tool into the partner agency's environment.
- PostgreSQL is 18F's default datastore – this eases engineering onboarding during the engagement.
</pre>

The audience for ADRs are engineers, product managers, and anyone else who’s able to change the code. ADRs may be a little too “in the weeds'' for product owners or program managers, and that’s okay—other types of documentation should cater to these groups.

An ADR doesn’t only have to be written after you implement a decision—in fact, you get many benefits when you write them throughout the decision-making process. Much like Test-Driven Development, writing ADRs preemptively can help drive decision-making. 

## Benefits of ADRs

Government software development is already heavy on documentation—why add to the pile?

ADRs have benefits to both the writers and the readers of them. 

Writing ADRs: 

* Helps you identify knowledge gaps
* Forces you to clarify assumptions
* May uncover options you haven’t considered
* Leads teams to consensus
* Prevents knowledge hoarding
* Allows you to step back from the day-to-day and think of changes on a broader scale

All of these benefits encourage best practices among your development team. Your ADRs can also inform documentation for other areas like security and compliance. Ideally all of these documents are cohesive and aligned. 

Writing ADRs is only part of the benefit. Reading ADRs:

* Gets new maintainers up to speed more quickly
* Frees teams from relying on one person for critical knowledge
* Shows maintainers if a change they’d like to do has been considered previously
* Can be shown as justification to stakeholders

## Getting started with ADRs

ADRs should be kept as close to your code as possible. If you have a code repository, keep ADRs in a folder there. That way, you can review ADRs in Pull Requests as you would do with any other code change.

Each ADR should follow the same [template](https://github.com/transcom/mymove/blob/master/docs/adr/template.md). There are many to choose from, and they range from the [simple](https://github.com/18F/piipan/blob/main/docs/adr/0001-record-architecture-decisions.md) to the [complex](https://github.com/transcom/mymove/blob/master/docs/adr/template.md). Don’t sweat about finding the perfect template—it’s more important that you just pick one and start writing. 

A newcomer should be able to skim the file names of your ADRs and get a concise, high-level overview of the life of your product. Have a consistent naming convention for your ADR files that briefly and accurately describes the decision. For example, a file name like `use-postgresql-for-database.md` that’s written in an active voice is more readable than `database-selection.md`.

Because ADRs represent a point-in-time decision, an ADR shouldn’t be altered once it’s added to the collection. Instead, a new ADR should be created to mark the change. 

You may end up with different threads of ADRs about particular topics or subsystems. While it’s helpful to see all ADRs together in one timeline, sometimes it’s good to focus on those about a single subject. You can use tags for this purpose or incorporate topic names into your file naming convention. 

For real-world examples of government projects that use ADRs, check out:

* [Office of Head Start Training & Technical Assistance Smart Hub](https://github.com/HHS/Head-Start-TTADP/tree/main/docs/adr)
* [Temporary Assistance for Needy Families (TANF) Data Portal](https://github.com/HHS/TANF-app/tree/main/docs/Architecture%20Decision%20Record)
* [Personal Property Prototype from the U.S. Department of Defense](https://github.com/transcom/mymove/tree/master/docs/adr)
* [National Accuracy Clearinghouse (NAC) minimum viable product (MVP)](https://github.com/18F/piipan/tree/main/docs/adr)

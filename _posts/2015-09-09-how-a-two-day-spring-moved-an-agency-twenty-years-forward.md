---
title: "How a two-day sprint moved an agency twenty years forward"
date: 2015-09-09
layout: post
authors:
- jtag
tags:
- agile
- how we work
- discovery
- proactive federal partner
- operational excellence
- our projects
- user research
- consulting
excerpt: "At 18F Consulting, we experiment with ways to empower agencies to build cost-efficient, excellent
digital solutions. Recently we partnered with the Department of Labor’s
Wage and Hour Division to run a two day “Design/Dev Agile Sprint” to help them modernize their Field Operations Handbook."
description: "At 18F Consulting, we experiment with ways to empower agencies to build cost-efficient, excellent
digital solutions. Recently we partnered with the Department of Labor’s
Wage and Hour Division to run a two day “Design/Dev Agile Sprint” to help them modernize their Field Operations Handbook."
image: /assets/blog/labor-handbook/foh-screenshot.jpg
---

At 18F Consulting, we experiment with [ways to empower agencies
](https://18f.gsa.gov/consulting/)to build cost-efficient, excellent
digital solutions. Recently we partnered with the Department of Labor’s
Wage and Hour Division (WHD) to run a two day “Design/Dev Agile Sprint.”

## Background: Investigators in Wage and Hour Division

The Department of Labor’s Wage and Hour Division is responsible for
enforcing a wide variety of federal labor laws, including those
requiring the minimum wage, overtime, child labor protections, and
family and medical leave laws. Over 1,000 investigators, working out of
local offices nationwide, and often literally in the field, investigate
employers to determine compliance with these laws. To gather the
information they need, they travel to a wide variety of businesses,
including farms, restaurants, hotels, retail shops, construction sites,
hospitals, and many others.

While conducting investigations, Labor employees often turn to the Field
Operations Handbook (what they call the FOH) for guidance. The handbook
is an operations manual that provides interpretations of the law,
procedures for conducting investigations, and general administrative
guidance. It reflects policies established through changes in
legislation, regulations, significant court decisions, and the decisions
and opinions of the WHD Administrator. The handbook is a critical tool
for WHD staff.

---

<p style="text-align:center;"><strong>How might we help DOL’s Wage Hour Division move forward with a quick win that would demonstrate what modernization can mean in a
meaningful, iterative way?</strong></p>

---


![Two investigators and an 18F user researcher who is shadowing them](/assets/blog/labor-handbook/field-team.jpg)
*Two investigators (left and right) and an 18F user researcher (center)
who is shadowing them to understand how investigators use paper and
digital methods to accomplish their job.*

## The current landscape: Publishing in the 21st century

The handbook consists of four five-inch-thick binders containing printed
and photocopied pages. These binders are replicated and distributed
across numerous regional and local offices. The handbook also exists as
online PDFs, where each chapter or subsection is published as its own
PDF. With these two options, investigators don’t have an easy way to
quickly access and search for much-needed information that helps them
complete investigations, particularly when they’re working out in the
field.

![Three large binders of handbook materials](/assets/blog/labor-handbook/handbook.jpg)

## The challenge: How to move this project forward?

The division's modernization team wanted to bring the handbook into the
21st century by placing it online and providing robust search
capabilities. This was not a radical idea.

Departments across the federal government often operate under three
constraints that can make these projects a challenge:

-   Lack of internal design and development staff dedicated to prototype or solve problems.

-   An often arduous vendor solicitation process to hire the right team to help with such projects. (WHD is experimenting with using a [modular, agile contract strategy](https://18f.gsa.gov/2015/03/30/new-rfp-ghostwriting-service-to-improve-contract-success/).)

-   Internal teams which may lack the time, tech literacy, or processes in place to support change. How do you support change you don’t quite understand?

18F Consulting is already working with the division's modernization team
on a much larger effort — the incremental modernization of an aging
management and investigation system. While that was underway, we
wondered, “How might we help the division move forward with a quick win
that would demonstrate what modernization can mean in a meaningful,
iterative way?” With the guidance of Tom Giancola, a WHD investigator,
and other WHD stakeholders, we chose to build a proof of concept for
modernizing the handbook.

At 18F Consulting, **“Prove by doing” is our motto.**

## The proof of concept sprint: From design to prototype in days, not months

In this two day sprint, about eight of us gathered to:

-   Prove that the division could produce a user-centered, technically feasible solution in days, not months.

-   Model and invite WHD team participation in human-centered design and agile development practices.

-   Produce a living, breathing pilot or minimum viable product (MVP) that the division could test with some of their investigators as they continue to build out this solution.

### Who participated?

-   One designer and two developers from the 18F Consulting team

-   One product owner from the WHD modernization team

-   Three WHD Investigators who frequently use this handbook

-   Three to five representatives from the division’s communications, policy, and document management teams. They helped us understand different use cases in the process and the current state of document creation, editing, and publication.

## Tuesday morning: Kick off!

We facilitated a two-hour kick-off meeting (sometimes called an
Inception). It got the group aligned around the problem and to agree on
a plan moving forward.

![The 18F and Labor team writes notes up on a large white board](/assets/blog/labor-handbook/group-1.jpg)
*Kick off (Inception)*

During this Inception we:

-   Identified the different types of **users** and prioritized which ones we’d focus on for our initial proof of concept.

-   Listed the **goals** and **non-goals** of the project (non-goals are great for parking valuable points that are out of scope for the current iteration).

-   Brainstormed ideas for **initial features** and prioritized them based on user value and build-feasibility.

-   Ensured there were no **timelines** or **stakeholder needs** that would cause problems in the near future.

-   Explored possible **risks** to the success of this project. We collaboratively grouped them by themes and discussed ways to reduce the risk moving forward.

## Tuesday afternoon: Start to build

The designer, developers, product owner, and investigators (our primary
users) hunkered down in a work room to make the first-ever, living,
modern digital version of the Field Operations Handbook (FOH)!

We created an ad hoc project board to track: Backlog, Current, In
Testing/Review, Finished. We used sticky notes to write [user
stories](http://en.wikipedia.org/wiki/User_story) and the wall of our
workspace to place the sticky note in the correct column as it
progressed. This helped the group understand our priorities for the two
days we had and to know at any time the work in progress.

We used this common user story format:

As a \_\_\_\_\_\_\_\_\_\_, I want \_\_\_\_\_\_\_\_\_\_\_\_, so that
\_\_\_\_\_\_\_\_\_\_\_\_\_.

Examples of our user stories:

-   As a Wage Hour Investigator, I want a place to view the FOH online so that I can access it. *(ensure a staging environment with working link)*

-   As an investigator, I want to search the FOH, so I can find answers to my questions. (*make Elasticsearch work, provide good search results page)*

-   As an investigator, I want to browse the FOH by chapter, so I can discover information by topic and adjacency. *(provide a good information architecture)*

-   As an investigator, I want inline links to other references so that I can make the best use of this body of knowledge. (*we automatically converted certain text standards into their corresponding links for hundreds of pages of documents)*

-   As an investigator, I want the FOH to be easy to read because past methods have been hard to read. *(provide good version 1 typography and design of this online resource)*

![Developers, investigators, and product owners work together on day 2. The project's progress boards are taped to the windows.](/assets/blog/labor-handbook/group-2.jpg)
*Day 2 of the team working out of the 18F common space. Developers on
the left. Investigators (users) and product owners talking about needs
on the right. Taped to the windows are the progress boards (Backlog,
Current, Done).*

Tom, the product owner had already used optical character recognition
(OCR) software to convert 100s of PDFs into MS Word documents. Microsoft
styles and headings were applied to the content to begin to structure
the data. (Aside: this is a perfect example of using the tools you know
best to move a project forward!) With that in hand, our developer
validated the technical feasibility of converting those Word documents
to HTML pages that could be searched using Elasticsearch.

By the end of Tuesday we had:

-   As a group understood the needs and challenges of the handbook as a larger project and scoped out what could be accomplished in a couple days

-   Demonstrated user story writing and how to use a simple agile or Kanban board

-   Within four hours, had a rough application that could search 100s of pages of documents as live HTML text. The division staff in the room thought that would take months!

## Wednesday: Build and design. Get feedback. Repeat.

### Build

Coming into the sprint, we understood that one of the major constraints
is that the handbook is created and maintained using Microsoft Word.
Minimizing the effect on workflow was therefore a key part of any
proposed technical solution. Fortunately, there are several open-source,
publicly available tools that allow for automated conversion from Word
files (.docx) into web-friendly files (.html), including
[pandoc](http://pandoc.org/). So, first, we wrote a
[script](https://github.com/18F/dol-whd-foh/blob/master/src/build.js)
that uses pandoc to automatically convert the Word files to HTML files.

Then, to get the HTML files to be more usable, we wrote a [second
script](https://github.com/18F/dol-whd-foh/blob/master/src/make.js)
that extracts the content from the HTML file, does some high-level
parsing, creates a Table of Contents, establishes JSON objects for each
part of the Chapter (along with associated metadata), loads the JSON
objects into an Elasticsearch service, and rewrites each HTML file to
include links to other government sources and internal links. Finally,
the files and search results were served using NGINX as the application
server (later, this was rewritten to work with Apache).

---

<p style="text-align:center;"><strong>"...we made so much progress in a short period of time! It’s searchable and you can actually read it." —Amy, Senior Advisor, Immigration and Farm Labor Branch </strong></p>

---

### Design

One of the great things about a cross-functional team in the same room
for a sprint is you can use faster design tools. Instead of creating
pixel perfect “mockups” of how navigation might work, or how a page
might visually feel, we did quick pen sketches on paper, a rough color
scheme in Illustrator and then went right into design and developer
pairing. We discussed problems and opportunities on the spot and were
empowered to move forward with our ideas.

### Feedback

Actual investigators made this sprint a success. Working with them over
the two days, we determined the best interface copy that would be clear
and actionable to their peers. Seconds after code was pushed to the
staging site, we observed how they used search and understood the search
results pages. Feedback was immediately incorporated.

![Screenshots of the prototype for an online version of the handbook.](/assets/blog/labor-handbook/foh-screenshot.jpg)
*Two days later we had a working prototype showing browsable chapters
and a search results page.*

## What’s next?

For many of us in the design and software development profession,
building a working prototype is not a big deal. For the dedicated civil
servants in the federal government, it can be. Over these two days we
demonstrated that with the right support and the right people in the
room, ideas can be tested, iterated upon, and realized without months of
requirements gathering, large waterfall contractual agreements, and
other impediments.

This prototype, built over a two-day sprint, is still an internal proof
of concept for the people responsible for improving the FOH. For
important legal reasons, they are dedicated to ensuring the
confidential, internal-facing guidelines are developed in a secure, yet
accessible way. Our prototype used the public-facing portion of their
guidelines to reduce that risk. In the next few months, they will pilot
this with a few regions while they work on securing a development
environment that can house the more useful internal-facing documents
(helping government do that better is another story for another day).
Meanwhile, for all future discussions, they have a working prototype,
created with internal stakeholders in the room who helped build it!

18F and GSA are committed to being proactive federal partners and
providing operational excellence wherever we can. By working
hand-in-hand with the WHD team, we’ve been able to show them what’s
possible, and have given them the basic knowledge to ask the right
questions to help them develop solutions in a cost-effective,
user-centered way.

If your agency has a project you’d like us to look at, please contact
18F Consulting at [inquiries18F@gsa.gov](mailto:inquiries18F@gsa.gov).

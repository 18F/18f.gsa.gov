---
title: "Turning learning up to 11: Transparent internal operations "
date: 2016-01-04
authors:
- mbland
tags:
- how we work
- best practices
- communication tools and practices
- hub
excerpt: "In the second post in this series on how transparency, autonomy, and collaboration produce organizational culture change, I describe a few of the initiatives we’ve undertaken to increase transparency into 18F’s internal operations."
description: "In the second post in our series on how transparency, autonomy, and collaboration produce organizational culture change, we describe a few of the initiatives we’ve undertaken to increase transparency into 18F’s internal operations."
image: /assets/blog/turn-up-to-11/skeleton-t-shirt.jpg
hero: false
---

[{% image "assets/blog/turn-up-to-11/skeleton-t-shirt.jpg" "A man wearing a skeleton t-shirt from the movie Spinal Tap" %}](https://i.ytimg.com/vi/XuzpsO4ErOQ/maxresdefault.jpg)[*“This is my exact inner structure, done in a tee shirt. Exactly medically accurate. See?”*](http://www.imdb.com/title/tt0088258/quotes?item=qt0261729)

In the [first post of this trilogy]({{ "/2015/12/30/turning-learning-up-to-11/" | url }}), I summarized my DevOps Enterprise 2015 talk that focused on transparency, autonomy, and collaboration as primary factors in producing organizational culture change. In this post, I’ll describe a few of the initiatives we’ve undertaken to increase transparency into 18F’s internal operations. While primarily for the benefit of our team members, we hope they will inspire other organizations to adopt similar models and tools.

18F Hub and the new 18F Handbook
--------------------------------

[About a year ago]({{ "/2014/12/23/hub/" | url }}), I began
writing the 18F Hub (link removed) as a prototype of a
very lightweight intranet tool to help organize our team information and
expose the connections between people, projects, skills, interests, and
locations. One of the most important functions of this tool was to
improve the onboarding experience by providing the content new hires
needed to feel acclimated and productive.

The tool still has some rough edges and hasn’t fulfilled every promise
yet — nothing, after all, is a silver bullet. However, the Hub has
helped convince all of 18F that documentation, information architecture,
and transparency of team information are critical to our continued
success as an organization.

As a result, the 18F Handbook effort spawned from the Hub and the
[Documentation Working
Group](https://pages.18f.gov/wg-documentation/). It’s a ground-up
re-architecture of content that organically grew within the Hub, our
shared document drive, and people’s heads. It’s nearly complete, and
we’re excited to report that [it has already contributed to a vastly
improved onboarding experience for our recent new
hires]({{ "/2015/12/01/how-we-dramatically-improved-18fs-onboarding-process-in-3-months/" | url }}).

At the same time, we have a product team dedicated to further
development of the Hub and related products, with the Handbook serving
as the minimum viable product. We’re currently evaluating whether to
build or buy the functionality we need that the Hub doesn’t currently
provide. Once that decision is made, we expect to migrate the Handbook
content into whatever we come up with to provide an even smoother
experience.

Getting our internal documentation in better shape will benefit not only
new hires, but also existing team members who need to travel to a new
office, remember how to register for benefits, or who want to see the
current array of working groups and guilds; in short, it will benefit
everyone. Ultimately, we hope to provide the tools, or at least a
repeatable model, that other agencies can easily adopt and adapt to suit
their own needs.

.about.yml files and the Team API
---------------------------------

Dropping down to a more technical level, we’ve begun to develop and
promote a metadata standard we call
[.about.yml](https://github.com/18F/about_yml/). The idea is that
these files will appear in each of our GitHub repositories where they’re
accessible to everyone and easily maintained by project members. They
will provide information regarding active project contributors, partner
agencies, technology stacks, milestones, and more. In addition to our
actual software products, we’ll add these files to documentation
repositories that serve as working spaces for working groups and guilds.

In addition to providing immediate transparency into a particular
repository, we’re already harvesting this information to produce what we
call the [Team API](https://team-api.18f.gov/public/api/). It joins
.about.yml metadata with information from other sources regarding 18F
team members and 18F at large and creates a completely connected graph
between people, projects, places, skills, and interests. We’re working
to make this system as generic as possible, with all of the code
publicly available, so that it might be reused by other organizations.

In other words, we extracted the data indexing logic from the 18F Hub
into a generic RESTful JSON API so that it’s available to the Hub, the
18F Dashboard, our project code health dashboard, and whatever else 18F
or other groups might create in the future. [An extra layer of
indirection not only solves all
problems](https://en.wikipedia.org/wiki/Fundamental_theorem_of_software_engineering),
but often introduces new possibilities beyond what’s currently
imaginable.

Stonehenge wasn’t built in a day
--------------------------------

The Hub, the Handbook, the .about.yml standard, and the Team API all
started as prototypes developed by myself and my colleagues within the
[Documentation Working
Group](https://pages.18f.gov/wg-documentation/), the [18F Testing
Grouplet](https://pages.18f.gov/wg-testing/), and the [Working Group
Working Group](https://pages.18f.gov/wg-working_groups/). After
developing these concepts and products in a largely ad-hoc fashion for
months, 18F decided they were important enough to evaluate using [our
intake process](https://pages.18f.gov/partnership-playbook/), just like
any other project. We now have an official product team assigned to
developing all of them as an integrated ecosystem. We’re also closely
coordinating with the [Agile Guild](https://pages.18f.gov/agile/), our
first internal partner, to update the 18F
Dashboard (link removed), our first consumer of
.about.yml data via the Team API.

We’ve built this product team because we understand that our
organization needs these tools and artifacts to support our processes
and values. We believe that *how* we work is just as important as *what*
we produce for our partners. Product is a reflection of process. By
setting an example of an open, thriving learning organization, 18F
provides an example that members of other federal agencies can use to
introduce similar methods into their teams.

In the final installment of our trilogy, I will discuss our community of
[Working Groups and Guilds](https://pages.18f.gov/grouplet-playbook/),
how they have produced an explosion of [18F
Guides]({{ "/2015/05/28/18F-guides/" | url }}) using our [18F
Pages]({{ "/2015/05/14/18Fpages/" | url }}) platform, and our
ambitions to foster in-house training development via the [18F
Edu](https://pages.18f.gov/edu/) initiative.

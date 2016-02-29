---
title: "How user story estimation helps my team deliver value"
date: 2016-01-25
authors:
- michael-torres
tags:
- agile
- how we work
- tools you can use
- best practices 

excerpt: "At 18F, we believe that employing agile practices is the most effective way to build digital services. User story estimation is one of the most useful agile tools, and in this post, I’ll talk about how and why my team has been using it."
description: "At 18F, we believe that employing agile practices is the most effective way to build digital services. User story estimation is one of the most useful agile tools, and in this post, I’ll talk about how and why my team has been using it."
image:
redirect_from:
-  /2016/01/22/how-user-story-estimation-helps-my-team-deliver-value/
---

At 18F, we believe that employing [agile practices](https://pages.18f.gov/agile/) is the most effective way to build digital services. [User story](https://en.wikipedia.org/wiki/User_story) estimation is one of the most useful agile tools, and in this post, I’ll talk about how and why my team has been using it.

What is user story estimation?
------------------------------

A user story is a description of value to be delivered to a user, and an
estimate is an educated guess as to how much effort it will take for a
team to deliver that value. Our team uses a Fibonacci point system to
estimate the size of that effort. The values are 1, 2, 3 or 5, with 1
representing the smallest chunk of work, and 2, 3 and 5 representing
multiples of that smallest unit ([why is the 4
missing?](http://www.the-program-manager.com/project-management/agile-estimating-tool-planning-poker-using-fibonacci-sequence/)).

A 1 may be a user story where effort is really well understood, like “So
that this user can navigate back to a homepage, a breadcrumb link to the
homepage should be added.” A 5 might be something that is not as clear,
but the effort is still somewhat understood. For example, “So that team
member details can be updated automatically, they should be pulled in
via an API (that already exists).” There will be more work involved with
the 5 point story, and because of that there are more unknowns (even
though the API exists, integration will likely involve some stops and
starts).

Why my team uses it
--------------------

It’s nice to point people to a pretty chart that shows how much work we
get through every week, based on our estimations, so that they can track
our productivity. But, we find that estimation is useful *mainly
because* it forces us to break down large user stories into smaller,
more understandable chunks that we can grapple with. Doing this
regularly helps us:

1.  Focus us on delivering small increments of value that we can demonstrate to users
2.  Identify and deal with unknowns that are blocking the team
3.  Helps us prioritize as a team

Delivering small increments of value gives the team a sense of
accomplishment and makes it possible to get feedback from users more
quickly, which then allows us to iterate in the right direction.

I work on a team at 18F responsible for content and information
platforms. The majority of the team came together after the initial
codebase was written, so when we first started working together, it was
hard to guess how much effort it would take us to complete a given user
story. We’re still frequently off base, but the act of estimating has
helped us identify unknowns, so that we can slowly reduce their effect
through automated testing and documentation. Recently, we realized that
our estimates around our API work were frequently way off base. This
forced us to prioritize refactoring — or rewriting — the code, testing,
and beefing up our documentation. This will slow feature progress in the
short term but will make us move faster in the long term.

Although our estimations will never be 100 percent accurate, we already
feel that our knowledge level around the codebase is improving, and the
unknowns are becoming less of an issue. And we’re documenting everything
so that we, and any new team members, will have an easier time getting
up to speed. And developing a shared understanding of how to estimate
stories over time will help us prioritize (small stories with high value
get prioritized over larger stories that aren’t as valuable).

The end game of a product is to deliver and measure incremental value
for users. The exercise of estimation helps us get there and keeps us
going.

---
title: "Sketching with code: protosketching"
layout: post
date: 2015-01-06

authors:
- alan
- robert

tags:
- protosketching
- 18f consulting
- how we work

description: Meetings are boring. Prototypes are cool. Use the meeting to build the prototype. We call building a prototype in three hours or less "protosketching."

image: /assets/images/2014/12/protosketch.jpg
---
*Giving program managers the freedom to sleep at night*

Meetings are boring. Prototypes are cool. Use the meeting to
build the prototype. We call building a prototype in three hours or less
*protosketching*.

<!-- more -->

Developers and designers working in bureaucratic organizations can astonish
their colleagues by building clickable prototypes in a one-to-three hour
meeting. Designers often sketch on paper and developers often prototype with
code. We argue that you should sometimes sketch in code — protosketching.
Being able to do this within a meeting sparks the imagination. Even if the
protosketch is wrong, it gives you something concrete to review and elevates
the discussion to issues of data, design, and functionality. In the words of
Ward Cunningham,

> “The best way to get the right answer on the Internet is not to ask a
question, it's to post the wrong answer.”

Why not be wrong with your protosketch in the meeting, and turn the meeting
into something that gives you the right answer?

Agile and lean methodologies focus on testing hypotheses as quickly as
possible-—**protosketching allows us to rapidly create hypotheses designed
with engaged stakeholders.** Agile works in timeboxes called “sprints,”
which are usually a few weeks long. Sometimes agile practitioners work even
faster, on often but not always throwaway experiments called
[spikes](http://www.extremeprogramming.org/rules/spike.html). Protosketching
is just a spike limited to the timebox of a single sales, design, or
brainstorming meeting. This short timebox guarantees that you are making a
cheap gamble that liberates you from any commitment to try to recover the
sunk cost of your short investment. In our experience, this immediate
exploration is game-changing for federal agencies.

The goal isn't to produce anything close to production-ready software, but
rather to use a clickable prototype to get closer to user needs and
functions. Since the goal is to learn about stakeholder understanding of
user needs, there shouldn't be much thought given to choosing programming
languages, databases, or design frameworks. Just go with what will quickly
get a clickable page into the hands of the end-user in order to get
feedback, because the protosketch is just part of the process.

## Why to Protosketch In the Government

The fundamental reason to protosketch is to have fewer sleepless nights.

Agile and lean methodologies promote continuous learning. This fundamentally
reduces risk by allowing bad ideas to be tested by the end-user and
discarded quickly—rather than surviving deep into the final production
process. Protosketching demonstrates this in a shorter time frame.

In the federal government, this speed has historically been an unattainable
experience. Many agencies do not have the technical resources in-house. They
may wish to employ outside resources to perform this experimentation and
testing, but may be stymied by the delay imposed of the procurement process.

Imagine how liberating it would be to many executives and program managers
to have protosketching services available on demand to test out ideas in a
single hour or afternoon as part of a user-centered design process? This may
prevent months of errant planning caused by not interacting with the
end-user early enough in the program. More importantly, it may allow
opportunities to be discovered that might not have been discovered until
years later.

Every agency deserves this ability to realize its mission more effectively
and to save taxpayer money.

## De-risking The Procurement Process

In a typical procurement setting, prospective contractors might be the most
technical voices in the room, creating a risk of technical asymmetry. A
protosketcher, whether they are from [18F
Consulting](https://18f.gsa.gov/consulting) or from within the agency,
should act as a trusted technical adviser to the program manager. A meeting
with a protosketcher will significantly mitigate any asymmetry in technical
expertise between the agency and prospective contractors by demonstrating
technical possibilities and the ease of various solutions. The program
manager will better understand what they want to get out of an RFP and be
empowered to write on based on a more certain understanding of the problem
and possible solutions. Contractors will find this specificity and clarity
refreshing and produce lower, more accurate bids. The American people will
be rewarded with less vendor lock-in, more cost effective maintenance, and
effectively evolving digital services. Oh and better digital experiences!

## Protosketching in the Wild: Actual Experience

At [18F](https://18f.gsa.gov/), we have protosketched for prospective
clients in three meetings and also for our audience at the last 18F Demo
Day.

At a three-hour meeting with the Department of Labor (DOL), we protosketched a
mobile application for Investigators to use in the field. With great
foresight, the DOL had brought actual Investigators (the end-user for this
case) into the meeting. The DOL was seeking to streamline workflows for
their investigators who often found themselves spending precious time on
redundant and often non-user-friendly data entry. For example, it was common
for investigators to keep track of data on a highly specialized spreadsheet
template which could later be uploaded to a DOL case management system.
While one member of the 18F team discussed project goals and explained the
benefits of a modular, API-driven system architecture, the other 18F staff
members protosketched a user interface made possible by such an
architecture.

Several investigators at the meeting were able to provide dynamic feedback
as they interacted with the mobile application on their own smartphones. A
technology stack comprised of Ruby, Sinatra, and Bootstrap made it easy to
rapidly create clickable forms and sortable tables. Because Bootstrap is a
responsive layout, the protosketches were just as compelling on the
investigators’ mobile phones as they were on the projector. This was an
initial step in design process which led to wireframes and more extensive
prototypes.

We recently did a very similar three-hour session with the U.S. Navy Reserve. In a
world where agencies are used to having to go through a lengthy procurement
process and a requirements writing phase in order to see any design or
prototype at all, this is a game-changer.

<img src="/assets/images/2014/12/protosketch.jpg" class="align-left" alt="A
protosketch running on a phone" />

At another protosketch meeting, this time with GSA Human Resources, we
protosketched a human resources dashboard which simulated combining several
siloed data sources. We [built](https://github.com/18F/aaa-exp-proto1) a
[sample dashboard](https://18f.github.io/aaa-exp-proto1/) with
[jQuery](http://jquery.com/), static [JSON](http://www.json.org/) files,
[Bootstrap](http://getbootstrap.com/), and were able to preview it via
[GitHub pages](https://pages.github.com/). As the sample dashboard was
displayed on the projector, participants quickly pointed out fields that
they’d like to see included, excluded, or modified. Even better than that,
though, was the lively discussion between participants. Seeing a clickable,
interactive demo helped them test out hypotheses as a team about the
features they needed most.

## Summary of our technique: reuse on steroids

Do these successes prove how smart we are?

No.

They prove that we know how to reuse work that others have spent
person-years, sometimes person-centuries, making freely available for
everyone to reuse (see our upcoming post, “How to Protosketch”). We are also
reusing our own experience with these systems. We are practiced at quickly
installing, configuring, and in some cases, programming, powerful systems.

## Conclusion

If you are a leading a project, ask for a protosketch. If you are a
developer, learn to protosketch. Create imagination-sparking moments, *in
the meeting*. Give your team the freedom to play — with ideas, code and
data. Minimize risk to your project and the American taxpayer by quickly
testing ideas with the end-user in a vivid, clickable form. Develop and
evaluate hypotheses on the fly. Protosketch to delight your team, your boss,
and your customers.  

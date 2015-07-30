---
title: "Tocking time"
date: 2015-05-21
layout: post
authors:
- sean
tags:
- 18f
- how we work
excerpt: "I recently spent time helping with one of our internal frustrations — how members of 18F track how we spend our time. Ultimately, we opted to try rolling our own simple solution using Django: Tock."
description: "I recently spent time helping with one of our internal frustrations — how members of 18F track how we spend our time. We opted roll out our own simple solution using Django, called Tock."
image: /assets/blog/tockingtime/tock03.jpg
---
One of the most important questions we ask ourselves when starting a
project is if we should “build” or “buy.” Do we develop a custom piece
of software that meets our needs exactly or use an existing solution
(open source software or a paid service)? At 18F, we have that
conversation nearly every day, both for projects with our partner
agencies and for internal ones, which help our team work faster and more
effectively.

<img class="align-center" src="/assets/blog/tockingtime/tock2.gif" width="800">

I recently spent time helping with one of our internal frustrations —
how members of 18F track how we spend our time. 18F operates many of our
projects under the Economy Act. For the uninitiated, this means that all
project costs must be billed to the partner agency. 18F walks a fine
line. We cannot make a profit on our work, nor can we take a loss.
Thus, it is critical that we manage time and money responsibly, both for
our own accounting and for the taxpayers who support our work.

For a long time, our internal time tracking looked something like this:

![Old time tracking screenshot](/assets/blog/tockingtime/tock02.jpg)

Every week, our operations team dutifully created a giant Google Sheets
spreadsheet and shared it with the entire team. As we grew, the number
of rows multiplied, and the number of columns increased, making it more
and more difficult to manage. Our last spreadsheet time tracker had 55
line items and over 60 employees, and it was clear this process would
not scale. Our operations team and product leads had the unenviable task
of ensuring people didn’t accidently type in the wrong cell. Once the
timesheet was completed, they then had to spend even more time
converting the spreadsheet into account statements that we could send to
our partners. While this approach worked well when we were a small group
of twenty, as we grew to over a hundred, we realized the time spent
maintaining the spreadsheets was unsustainable.

We needed something new.

###Evaluating options

Many people would say tracking time is a solved problem — endless tools
and services exist to help organizations like ours do it well. Before we
started looking at what was available, we conducted some minor usability
research among both reporters of time (everyone at 18F) and backend time
processors (the operations team). Out of those conversations, a few
things became clear:

- We wanted the flexibility to record time in either **hours** per week or a **percentage** of a given allotment of hours.

- No one wanted another login. Luckily, another 18F project ([MyUSA](https://my.usa.gov/)) does a great job at authentication. Thank you!

- We needed to customize the periods in which we record time — such as by fiscal year, weeks with federal holidays, etc.

- Ideally, we wanted to record enough information that later developments could allow the system to provide real-time information on project costs to our partners.

- Ideally, we wanted the system to help others inside 18F better understand not only how much our employees are working but also *how* they are spending their time.

- To minimize our footprint, we want to deploy something on 18F’s new [platform as a service](https://18f.gsa.gov/2015/05/08/layering-innovation/), which would take care of many of our operational and security concerns.

We looked at the available products, weighing options that met our
criteria, and estimating how much time we would spend if we built a
custom solution. Ultimately, we opted to try rolling our own simple
solution using Django, a Python framework both I and Dave Zvenyach (a
fellow 18Fer who volunteered to help) have experience in. Although
building our own solution meant we would need to spend time developing
and maintaining a system into the future, we felt that something so
critical the entire team touches it every week was important enough that
we really wanted to make the user experience as simple and easy as
possible. We also felt this was a great opportunity to try out our
internal platform as a service and flex our Python muscles.

###Building things out

The first prototype took about day to build and deploy. We built it
entirely in the open (see our [GitHub repository](https://github.com/18f/tock)) and immediately put it online for the team to test.

![Prototype screenshot](/assets/blog/tockingtime/tock03.jpg)
*The first iteration of Tock*

At the core, this is a very simple Django site. We have four main
models, or types of information:

####Users

A person who is reporting time. We integrated with MyUSA so 18F
employees are automatically logged into Tock based on their email
address. No passwords here!

####Reporting periods

The timespan we are recording, for example, the week of May 11 to May
15.

####Projects

The individual line items we record time against. Every 18F project gets
a line item, and we also have general line items for things like “out of
office” or time spent on 18F-focused activities, such as our weekly
all-hands meeting.

####Timecards

The glue that holds everything together. Each user gets one timecard for
every reporting period, on which they report each project and how much
time they’ve spent on it.

Although this initial effort didn’t do everything one could ever want in
a time tracking system, the core functionality worked, and we had a
viable prototype.

###Sharing with the team

We asked everyone at 18F to try Tock for a week and report back. Initial
feedback was very positive:

*"Tock has made accurate reporting of how we spend our time at work much
easier."*

*"Before Tock, I used to hate Mondays."*

As with any project at 18F, people were also quick to provide a lot of
constructive feedback as to how to make the experience even better. For
example, now that time tracking was much easier, our list of projects
grew rapidly as people tried to strike the right balance between
capturing work accurately and forcing users to browse a long list of
random things:

![List screenshot](/assets/blog/tockingtime/tock00.jpg)
*So many items!*

We fixed this, in part, by providing an auto-select based on
[Chosen](http://harvesthq.github.io/chosen/), an open source tool
designed specifically for this purpose. Now, Tock users can search by
either the project or partner agency name when selecting a line item:

![Line screenshot](/assets/blog/tockingtime/tock01.jpg)

###The future of time

We’ve had Tock in operation for a little over one month. So far our time
investment has proven well worth the results. Our operations team spends
less time tracking hours spent on projects, members of 18F are relieved
to leave the monster spreadsheet behind, and the Tock team had a great
opportunity to build a small, fun app. We now have a solution that works
the way we do. Hopefully, it can be a useful solution for other
organizations as well.

Think Tock may be a good solution for you? Check out the code on
[GitHub](https://github.com/18F/tock). Would you like to be recording
your time spent helping make the government awesome in Tock?
Well...[we’re hiring](https://18f.gsa.gov/2015/02/25/We-Are-Hiring/)!

---
title: A visit to the National Earthquake Information Center’s open source team
authors:
- boone
tags:
- u.s. geological survey
- open source
image: /assets/blog/earthquake-center/earthquakecenter.jpg
description: The National Earthquake Information Center’s web team is committed to open source. By building in the open, they ensure the public gets information about seismic activity within minutes of the ground starting to shake.
excerpt: I visited the Earthquakes team at their office on the Colorado School of Mines campus in Golden, CO, to learn about this open source team’s role in public service.
---

{% image "assets/blog/earthquake-center/earthquakecenter.jpg" "A mountain and some buildings as seen from National Earthquake Information Center’s office on the Colorado School of Mines campus in Golden, CO." %}
*The view from the National Earthquake Information Center’s office on the Colorado School of Mines campus in Golden, CO.*

On January 28, 2016 people living at the Jersey Shore felt a shake. New
Jersey, like most Mid-Atlantic states, has a [relatively low
probability of
earthquakes](http://earthquake.usgs.gov/earthquakes/states/new_jersey/hazards.php),
especially compared to a place like
[California](http://earthquake.usgs.gov/earthquakes/states/california/hazards.php).
Despite the probability, the ground shook, sensors felt it, and
[earthquakes were reported to the United States Geological Survey’s
(USGS) National Earthquake Information
Center](http://earthquake.usgs.gov/earthquakes/eventpage/us20004vbk#general_region).

But if you were in the area, you probably saw some fighter jets fly
overhead just as the ground began shaking because it wasn’t *actually*
an earthquake that took place. What residents in NJ felt [was a sonic
boom](http://www.nj.com/news/index.ssf/2016/01/shaking_in_nj_was_likely_a_sonic_boom_usgs_says.html),
a phenomenon caused when an object exceeds the speed of sound. Even
though it’s not an earthquake, those shock waves can be powerful enough
to create seismic activity.

Reporting earthquakes: A human-computer interaction
---------------------------------------------------

I learned about this incident after visiting the National Earthquake
Information Center’s web team at their office on the Colorado School of
Mines campus in Golden, CO. I wanted to learn about this open source
team’s role in public service, and they were happy to explain what
happens whenever the earth shakes.

Here’s the rundown: When the ground shakes,
[sensors](http://earthquake.usgs.gov/monitoring/?source=sitenav) and
[humans](http://earthquake.usgs.gov/data/dyfi/) around the world send
reports to the USGS, kicking off a chain of events ([described in this
PDF](http://pubs.usgs.gov/of/2015/1120/ofr20151120.pdf)) to alert
scientists and the public about what happened and where, whether it was
likely an earthquake, and what the [economic and human
impact](http://earthquake.usgs.gov/earthquakes/eventpage/us20004y6h#impact_pager)
might be. Our understanding of the event then becomes more accurate as
more and more data trickle in. Large earthquakes can cause hundreds of
millions of dollars in damage, take hundreds of lives, and trigger other
disasters like fires and tsunami. Earthquakes are unpredictable. When
they happen people need information fast. So when a big earthquake hits,
the web team must have a tough day, right?

“Not really,” said Lynda Lastowka with a smile, “not anymore anyway.
Everybody else does.”

Not too long ago, this team of six would have had a bad day keeping this
system alive during a significant event. According to their web
analytics data, they can see up to 20 thousand requests *per second*
starting in an earthquake’s first five minutes. That’s 6 million page
loads in five minutes, 2 million more than they’ve seen so far in the
last 30 days.

The site is typically [the top domain within the U.S.
Interior](https://analytics.usa.gov/interior/) and received more than 3
million pageviews in the last 30 days; second only to the National Park
Service within Interior’s vast array of online offerings.

“With a product or a startup, you can kind of predict when you’re going
to have a big day and spin up some more servers,” Eric Martinez from the
earthquakes team told me. “For us, we could have that big day right
now.”

A larger part of the team’s work is replacing legacy pieces of the
system that were developed long ago and never supposed to make it into
production. That is not always an easy task, and it’s even harder to
open source these systems. For example, one system is a script that
generates and then calls a series of other scripts.

“And the best part,” Martinez said, “is that all those intermediary
scripts get deleted at the end.” This system wasn’t *designed* so much
as it was assembled over time to automate or process things for the
earthquake team.

As they attempt to update this system, they’re starting with the most
important processes and making them better. They find that being open
and working iteratively helps set expectations for their customers in
the USGS and for their end users, too. Those end users range from
members of the public to engineers who have to plan buildings in
earthquake-prone areas. If the team fix a bug, [they release it
publicly](https://github.com/usgs/earthquake-eventpages/releases) so
that everyone can see the immediate progress rather than trying to keep
lots of different people up to speed over individual emails.

The benefits of open source narrative often focuses on contributions and
reuse of software, and the earthquakes team definitely does that. A
lesser told story, though, is around the benefits gained from the hyper
transparency of working in the open. [As we saw at the
EPA]({{ "/2015/12/07/what-exactly-do-we-even-do-all-day/" | url }}),
working openly helps keep the earthquake team’s primary users and
stakeholders informed while also providing a public record of how the
system works. When working with a system as important as earthquake
information, the public needs to be able to verify the system’s accuracy
and trust that problems will get fixed. Working in the open does both
and lets the team focus on making sure the public is getting the best
information available, as soon as possible.

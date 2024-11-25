---
title: "USEITI: What we learned and where we’re headed"
date: 2015-11-02
authors:
- boone
tags:
- agency work
- open data
- useiti
description: During Sunshine Week, we wrote about our progress on the U.S. Extractive Industries Transparency Initiative (USEITI). Since then, the 18F team has worked with the USEITI team to process research on the current state of the project as well as the next steps for the U.S. as a candidate country for the global initiative.
excerpt: During Sunshine Week, we wrote about our progress on the Extractive Industries Transparency Initiative, or EITI, an international coalition organized here by the U.S. Department of the Interior and a multi-stakeholder group that includes representatives from nonprofits, academia, industry and local governments. Since March, the 18F team has worked with the USEITI team to process research on the current state of the project as well as the next steps for the U.S. as a candidate country for the global initiative.
image: /assets/blog/eiti/drill.jpg
hero: false
---
{% image "assets/blog/eiti/drill.jpg" "An oil rig on public land. Courtesy of the Department of Energy" %}

_Oil drilling is one of many industries included in the Extractive Industries Transparency Initiative (EITI). The U.S. Department of the Interior and the USEITI multi-stakeholder group will publish the first report this December._

During [Sunshine Week](http://www.sunshineweek.org/), [we wrote about
our progress on the U.S. Extractive Industries Transparency Initiative, or
USEITI,]({{ "/2015/03/18/sunshine-week-extractive-industries-transparency-initiative-event/" | url }}) an international coalition organized here by the U.S. Department
of the Interior and a multi-stakeholder group that includes
representatives from nonprofits, academia, industry and local
governments. Since March, the 18F team has worked with the USEITI team
to process research on the current state of the project as well as the
next steps for the U.S. as a candidate country for the global
initiative.

To recap: The original project, a collaboration with the Department of
the Interior, published for the first time ever data about revenues the
government earned from companies that extract resources such as coal,
natural gas, and oil from public lands. The [current
website](https://useiti.doi.gov/) is a live beta visualizing some of
the insights we could glean from the data. As we wrote in our Sunshine
Week post:

> In 2013, more than $9.8 billion dollars were earned from active
> natural resource leases on federal land. In the ten previous years,
> $127.4 billion was earned in resource revenues from the extractive
> industries. The [international initiative is a
> group of 48 countries,](https://eiti.org) including the United
> States, dedicated to opening up information about revenues from these
> industries by establishing a global standard to promote openness and
> accountability in extractives management.

The [spirit of the global EITI](https://eiti.org/eiti/principles) is
to publish these data in order to inform and engage public debate. This
is why USEITI decided that the report due in December should be
published solely through an interactive website.

What we learned from the live beta
----------------------------------

After launching the initial beta, we immediately started working with
users to test the site’s usability and effectiveness at communicating
the data in a meaningful way. **We learned that while our site looked
great, people weren’t really sure what to make of the data, what USEITI
was, or how the website fit into the initiative.**

From those lessons we developed some [hypotheses that are shaping our
work](https://github.com/18F/doi-extractives-data/wiki/Hypotheses#functional-hypotheses)
moving forward. They focus on providing:

-   A clearer explanation of USEITI and what the site is for
-   More location-based information
-   More explanation of the government’s role in the natural resources industry
-   Added structure to the data so casual users can get useful information and dive deeper as interested

There’s also a lot of new information included in the 2015 report. For
example, because production data is typically tied to drilling
agreements for political, logistical, and scientific reasons, the Office
of Natural Resource Revenue used to estimate how much of a resource was
produced using sales volumes. Over the last couple years, the office has
undertaken a big effort to more precisely calculate production numbers
and the 2015 report will publish these new data. Beyond the numbers, the
new report will illustrate the narrative of how the whole system of
leasing land and collecting royalties off of the extracted materials
works in the United States.

As we work on building the 2015 EITI report, we hope to share some of
the challenges we faced and the technical and design choices we made to
ensure that the site is providing clear, accessible information for the
public to better understand how federal, state, and local governments
interact with industries extracting material from our public lands.

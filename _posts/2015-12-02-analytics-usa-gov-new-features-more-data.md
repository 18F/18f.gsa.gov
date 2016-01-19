---
title: "analytics.usa.gov: New features and more data"
date: 2015-12-02
authors:
- timlowden
- gray
- juliawinn
- gramirez
- eric
tags:
- how we work
- culture
excerpt: "We’ve recently added a few new features to analytics.usa.gov: location data, download data, and expanded downloadable files."
description: "We’ve recently added a few new features to analytics.usa.gov: location data, download data, and expanded downloadable files."
image: /assets/blog/dap/analytics-homepage.jpg
---

*This post was originally published on the [DigitalGov blog](https://www.digitalgov.gov/2015/12/01/analytics-usa-gov-new-features-and-more-data).*

![The analytics.usa.gov homepage.](/assets/blog/dap/analytics-homepage.jpg)

As of writing this post, 25,225 of the 124,878 total visitors on federal
government websites participating in the [Digital Analytics
Program](http://www.digitalgov.gov/services/dap/) (DAP) are NOT located
in the United States. And as a result of a new location feature on the
expanded [analytics.usa.gov](https://analytics.usa.gov/), you are free
to check for yourself how many current users are from outside the
country, anytime you’d like.

[Back in March of this year](http://mashable.com/2015/03/19/white-house-open-source-analytics/#lw5sIJFfwqq9),
DAP released [analytics.usa.gov](https://analytics.usa.gov/) in
collaboration with [18F](https://18f.gsa.gov/), which provides the
technical support to take DAP data and [turn it into a beautiful,
open-source, public
dashboard](https://18f.gsa.gov/2015/03/19/how-we-built-analytics-usa-gov/).
We have been overwhelmed with positive response via [social
media](https://twitter.com/18F/status/578563466018963456), [press
coverage](https://www.washingtonpost.com/news/the-switch/wp/2015/03/19/the-most-popular-government-web-sites-ranked/),
and thoughtful comments on
[GitHub](https://github.com/18F/analytics.usa.gov). To our delight, a
few other folks used portions of our code to stand up their own web
analytics dashboards, including the city governments of [Philadelphia,
PA](http://analytics.phila.gov/) and [Boulder,
CO](https://bouldercolorado.gov/stats). We even got [President Obama
to check it
out](https://www.digitalgov.gov/files/2015/12/POTUSdap.jpeg).

We’ve recently added a few new features to
[analytics.usa.gov](https://analytics.usa.gov/):
location data, download data, and expanded downloadable files.

Location data
-------------

We’ve created two new location charts on the dashboard, one showing the
cities providing the most visitors and one showing U.S. vs.
international traffic, including a breakdown of the countries with the
most visitors outside the U.S. Both of the visualizations reflect data
in real-time (updating every minute), so you can wake-up to see which
countries are visiting U.S. government websites while we’re asleep!
Additionally, while most of the time you’ll see U.S. cities on that
particular chart, it is not limited to the United States. If there is a
world event and for some reason a large proportion of people in Mumbai,
India (for example), are visiting U.S. government websites, the chart
will reflect that.

![A snapshot of location data from analytics.usa.gov](/assets/blog/dap/analytics-locations.jpg)

One thing to keep in mind about location information is that since we
anonymize IP addresses of visitors at the earliest possible point, the
location data is not accurate enough to pinpoint exact locations of
visitors. With IP addresses anonymized, we rely on the network domain
and service provider to determine a relative location. As a result,
people visiting from a suburb may appear as visiting from the closest
city.

Download data
-------------

You can now see not just the popular pages and sites along the
right-hand column, but also the most frequently accessed “downloads”.

Two important things to understand about downloads:

1. Here, “downloads” just means “things other than web pages”, like PDFs and spreadsheets. It doesn’t necessarily mean a visitor chose to save the file, since many browsers open PDFs and other files directly in a separate tab.

2. Downloads are logged when visitors click links to them from a page that participates in the Digital Analytics Program. It does not include visits from direct links to files, such as links that were emailed, posted on social media, or posted on websites that do not participate in DAP.

PDF files seem to dominate the list, but other extensions in the
category include .doc, .xls., .mp3, among others. The data reflects the
number of times the file was accessed in the past seven days.

![A screenshot of a top downloaded item, in this case an Application for Naturalization from USCIS.](/assets/blog/dap/analytics-downloads.jpg)

You can click on the page title, “Application for Naturalization |
USCIS,” to go to the page the file is located, or you can click on the
file name, “n-400.pdf”, to download (or open) the file right from
analytics.usa.gov!

Expanded downloadable files
---------------------------
<div style="float: right;"><img src="/assets/blog/dap/analytics-downloads2.jpg" alt="A list of types of data you can download from analytics.usa.gov." width="300px"></div>

There’s a limit to how much data we can display on the page for you, so
we have greatly expanded the downloadable data reports. We offer
downloads of various types of data (some in CSV format and some in JSON)
so that you can work with the data yourself!

Previously, the downloadable files generally only contained the same
data that was displayed on analytics.usa.gov. Now, some of the files
include hundreds or even thousands of rows, where applicable. We have
set lower limits on the larger datasets to remove the “long tail”
effect. We list pages that have least 10 visitors on the page in
real-time, and domains which have received at least 1,000 visits in 30
days.

Over the coming months, we will continue to expand and improve on
[analytics.usa.gov](https://analytics.usa.gov). We hope you like what
we’ve done so far, but there is more to come. We’re continuously
evaluating new ideas, and welcome your feedback [on GitHub](https://github.com/18F/analytics.usa.gov/issues)
or [via email](mailto:dap@support.digitalgov.gov). Tell us what you
think, and what you’d like to see in the future.

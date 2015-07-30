---
title: "How we built analytics.usa.gov"
layout: post
image: /assets/blog/dap/screen.png
date: 2015-03-19 10:00:00
tags:
- analytics
- open government
- dap

authors:
- eric
- gramirez
- gray
- leah
- shawn

excerpt: "The U.S. federal government now has a public dashboard and dataset for its web traffic, at analytics.usa.gov. 18F worked with the Digital Analytics Program, the U.S. Digital Service, and the White House to build and host the dashboard. Read on to learn about how the dashboard works, the engineering choices we made, and the open source work we produced along the way."
description: "The U.S. federal government now has a public dashboard and dataset for its web traffic, at analytics.usa.gov."
---

The U.S. federal government now has a public dashboard and dataset for its web traffic, at [**analytics.usa.gov**](https://analytics.usa.gov).

<a href="https://analytics.usa.gov" target="_blank"><img src="/assets/blog/dap/screen.png" title="Screenshot of the new Digital Analytics Program public dashboard" style="border: 1px solid #ddd" /></a>

This data comes from a unified [Google Analytics](https://www.google.com/analytics/) profile that is managed by the [Digital Analytics Program](https://www.digitalgov.gov/services/dap/), which (like 18F) is a team inside of the [General Services Administration](https://en.wikipedia.org/wiki/General_Services_Administration), an independent federal agency.

18F worked with the [Digital Analytics Program](https://www.digitalgov.gov/services/dap/), the [U.S. Digital Service](https://www.whitehouse.gov/digital/united-states-digital-service), and the White House to build and host the dashboard and its public dataset.

You can read more on the [White House blog](https://www.whitehouse.gov/blog/2015/03/19/turning-government-data-better-public-service) about the project, and some insights from the data.

In this post, we'll explain how the dashboard works, the engineering choices we made, and the open source work we produced along the way.

A few important notes:

* The dashboard doesn't yet show traffic to _all_ federal government websites, because not every government website participates in the program. Details on coverage are [published below the dashboard](https://analytics.usa.gov/#explanation).
* [analytics.usa.gov](https://analytics.usa.gov) was made in a very short period of time (2–3 weeks). There are clearly many more cool things that can be done with this data, and we certainly hope you'll give us feedback on what to do next.
* As the dashboard shows, the federal government has a very large Google Analytics account. Individual visitors are not tracked across websites, and [visitor IP addresses are anonymized](https://support.google.com/analytics/answer/2763052?hl=en) before they are ever stored in Google Analytics. The Digital Analytics Program has a [privacy FAQ](https://www.digitalgov.gov/services/dap/common-questions-about-dap-faq/#part-4).

## A nice-looking dashboard

The analytics.usa.gov dashboard is a static website, stored in [Amazon S3](https://aws.amazon.com/s3/) and served via [Amazon CloudFront](https://aws.amazon.com/cloudfront/). The dashboard loads empty, uses JavaScript to download JSON data, and renders it client-side into tables and charts.

The real-time data is cached from Google every minute, and re-downloaded every 15 seconds. The rest of the data is cached daily, and only downloaded on page load.

So the big number of people online:

<img src="/assets/blog/dap/now.png" title="Screenshot of the dashboard's big number of people" style="border: 1px solid #ddd" />

...is made with this HTML:

```html
<section id="realtime"
  data-block="realtime"
  data-source="https://analytics.usa.gov/data/live/realtime.json"
  data-refresh="15">
  <h2 id="current_visitors" class="data">...</h2>
  <div class="chart_subtitle">people on government websites now</div>
</section>
```

And then we use a whole bunch of [D3](http://d3js.org) to [download and render the data](https://github.com/GSA/analytics.usa.gov/blob/fff6e21b86a5cdcecb4de9279ae5bb8c2fce478b/js/index.js#L49).

Each section of the dashboard requires downloading a separate piece of data to populate it. This does mean the dashboard may take some time to load fully over slow connections, but it keeps our code very simple and the relationship between data and display very clear.

## An analytics reporting system

To manage the data reporting process, we made an open source tool called [`analytics-reporter`](https://github.com/18F/analytics-reporter).

It's a lightweight command line tool, written in [Node](http://nodejs.org), that downloads reports from Google Analytics, and transforms the report data into more friendly, provider-agnostic JSON.

You can install it from [npm](https://www.npmjs.com/package/analytics-reporter):

```
npm install -g analytics-reporter
```

After following the [setup instructions](https://github.com/18F/analytics-reporter#installing) to authorize the tool with Google, the tool can produce JSON reports of any report defined in [`reports.json`](https://github.com/18F/analytics-reporter/blob/master/reports.json).

A report description looks like this:

```javascript
{
  "name": "devices",
  "frequency": "daily",
  "query": {
    "dimensions": ["ga:date" ,"ga:deviceCategory"],
    "metrics": ["ga:sessions"],
    "start-date": "90daysAgo",
    "end-date": "yesterday",
    "sort": "ga:date"
  }
}
```

And if you ask the included `analytics` command to run that report by name:

```
analytics --only devices
```

Then it will print out something like this:

```javascript
{
  "name": "devices",
  "data": [
    {
      "date": "2014-10-14",
      "device": "desktop",
      "visits": "11495462"
    },
    {
      "date": "2014-10-14",
      "device": "mobile",
      "visits": "2499586"
    },
    // ...
  ],
  "totals": {
    "devices": {
      "mobile": 213920363,
      "desktop": 755511646,
      "tablet": 81874189
    },
    "start_date": "2014-10-14",
    "end_date": "2015-01-11"
  }
}
```

The tool comes with a built in `--publish` command, so that if you define some Amazon S3 details, it can publish the data to S3 directly.

Running this command:

```
analytics --only --devices --publish
```

...runs the report and uploads the data directly to:

> [https://analytics.usa.gov/data/live/devices.json](https://analytics.usa.gov/data/live/devices.json)

Real-time data is downloaded from the [Google Analytics Real Time Reporting API](https://developers.google.com/analytics/devguides/reporting/realtime/v3/), and daily data is downloaded from the [Google Analytics Core Reporting API](https://developers.google.com/analytics/devguides/reporting/core/v3/).

We have a single [Ubuntu](http://www.ubuntu.com/server) server running in Amazon EC2 that uses a [crontab](https://github.com/18F/analytics-reporter/blob/master/deploy/crontab) to run commands like this at appropriate intervals to keep our data fresh.

There's some pretty clear room for improvement here &mdash; the tool doesn't do dynamic queries, reports are hardcoded into version control, and the repo includes an 18F-specific crontab. But it's very simple to use, and a command line interface with environment variables for configuration gives it the flexibility to be deployed in a wide variety of environments.


## Everything is static files

Our all-static approach has some clear limitations: there's a delay to the live data, and we can't answer dynamic queries. We provide a fixed set of data, and we only provide a snapshot in time that we constantly overwrite.

We went this route because it lets us handle potentially heavy traffic to live data without having to scale a dynamic application server. It also means that we can stay easily within Google Analytics' daily [API request limits](https://developers.google.com/analytics/devguides/reporting/core/v3/limits-quotas), because our API requests are only a function of time, not traffic.

All static files are stored in Amazon S3 and served by Amazon CloudFront, so we can lean on CloudFront to absorb all unpredictable load. Our server that runs the cronjobs is not affected by website visitors, and has no appreciable load.

From a maintenance standpoint, this is a dream. And we can always replace this later with a dynamic server if it becomes necessary, by which time we'll have a clearer understanding of what kind of traffic the site can expect and what features people want.

## Usability Testing

We went to a local civic hacking meetup and conducted a quick usability testing workshop. In line with PRA guidelines, we interviewed 9 members of the public and a handful of federal government employees. Any government project can do this, and the feedback was very helpful.

We asked our testers to find specific information we wanted to convey and solicited general feedback. Some examples of changes we made based on their feedback include:

* We changed the description of the big number at the top of the page from "people online right now" to "people on government websites now."
* We added more descriptions to help explain the difference between top 20 "pages" vs "domains." For the top 20 charts for the past week and month, we show the number of visits to an entire government domain, which includes traffic to all sub-pages within a government domain (for example, irs.gov and usajobs.gov). However, for the top 20 most popular sites _right now_, the team wanted to show the most popular single page within the government domains (for example, the IRS's Where's My Refund? page or USCIS's Case Status Online page).
* We indented and adjusted the look of the breakdown of IE and Windows data to simplify and clarify the section.
* We changed the numbers in the Top 20 section from "505k" and "5m" to actual, specific numbers (for example, 505,485 and 5,301,691). Testers often assumed any three-digit number was actually short for a six-digit number.

We certainly haven't resolved all the usability issues, so please [share your feedback](https://github.com/GSA/analytics.usa.gov/issues).


## Living up to our principles

**Open source:** We're an [open source team](https://github.com/18F/open-source-policy), and built the dashboard in the open [from day 1](https://18f.gsa.gov/2014/07/31/working-in-public-from-day-1/).

* [github.com/GSA/analytics.usa.gov](https://github.com/GSA/analytics.usa.gov) - The dashboard itself.
* [github.com/18F/analytics-reporter](https://github.com/18F/analytics-reporter) - The data reporting system.

All of our work is released under a [CC0 public domain dedication](https://github.com/GSA/analytics.usa.gov/blob/master/LICENSE.md).

**Open data:** All the data we use for the dashboard is available for direct download [below the dashboard](https://analytics.usa.gov/#explanation). Right now, it's just live snapshots, and there's no formal documentation.

Your [ideas and bug reports](https://github.com/GSA/analytics.usa.gov/issues) will be very helpful in figuring out what to do next.

**Secure connections:** 18F uses HTTPS for [everything we do](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/), including analytics dashboards.

In the meantime, we hope this dashboard is useful for citizens and for the federal government, and we hope to [see you on GitHub](https://github.com/GSA/analytics.usa.gov).

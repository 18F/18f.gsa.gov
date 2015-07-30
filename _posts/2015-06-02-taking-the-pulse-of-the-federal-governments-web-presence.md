---
title: "Taking the pulse of the federal government's web presence"
date: 2015-06-02
layout: post
authors:
- eric
- julia
- gray
- jtindel
tags:
- pulse
- analytics
- https
- dap
excerpt: "The U.S. federal government is launching a new project to monitor how it's doing at best practices on the web. A sort of health monitor for the U.S. government's websites, it's called Pulse, and you can find it at pulse.cio.gov."
description: "The U.S. federal government is launching a new project to monitor how it's doing at best practices on the web called Pulse, at pulse.cio.gov."
image: /assets/blog/pulse/pulse.png
---
The U.S. federal government is launching a new project to monitor how it's doing at best practices on the web.

A sort of health monitor for the U.S. government's websites, it's called **[Pulse](https://pulse.cio.gov)**, and you can find it at **[pulse.cio.gov](https://pulse.cio.gov)**.

[![pulse homepage](/assets/blog/pulse/pulse.png)](https://pulse.cio.gov)

[Pulse](https://pulse.cio.gov) is a lightweight dashboard that uses the [official .gov domain list](https://github.com/GSA/data/blob/gh-pages/dotgov-domains/2015-03-15-federal.csv) to measure two things:

* **[Analytics](https://pulse.cio.gov/analytics/domains/):** Whether federal executive branch domains are participating in the [Digital Analytics Program](https://www.digitalgov.gov/services/dap/) that powers [analytics.usa.gov](https://analytics.usa.gov).
* **[HTTPS](https://pulse.cio.gov/https/domains/):** Whether federal domains have deployed the [HTTPS protocol](https://https.cio.gov/faq/), and how well they've done it.

These two things are just a start — there are a lot of other important things worth measuring! It's also important to note that Pulse is currently only measuring parent domains (e.g. `agency.gov`) and is _not_ measuring subdomains (e.g. `portal.agency.gov`).

The project will hopefully expand over time to measure more best practices and more websites. In the meantime, Pulse is a commitment by the U.S. government to build a world-class analytics program and to transition entirely to HTTPS.

## Background

[![pulse screenshot of analytics](/assets/blog/pulse/analytics-agencies.png)](https://pulse.cio.gov/analytics/agencies/)

Pulse is a collaboration between 18F and the [Office of Government-wide Policy](http://www.gsa.gov/portal/content/104550) (OGP).

Like 18F, OGP is an office of the U.S. General Services Administration. Among many other things, OGP operates the [.gov domain registry](https://www.dotgov.gov) and the [CIO Council](https://cio.gov), an interagency forum of Chief Information Officers.

18F previously partnered with OGP in December to [release the complete .gov domain list](https://18f.gsa.gov/2014/12/18/a-complete-list-of-gov-domains/). Since then, 18F has worked with the Digital Analytics Program [to build analytics.usa.gov](https://18f.gsa.gov/2015/03/19/how-we-built-analytics-usa-gov/), and has coordinated with a number of agencies to [strengthen HTTPS for federal .gov domains](https://18f.gsa.gov/2015/02/09/the-first-gov-domains-hardcoded-into-your-browser-as-all-https/). We're deeply gratified that we've had the opportunity to work with OGP to create a platform that continues this momentum.

## How pulse.cio.gov works

[![pulse screenshot of https](/assets/blog/pulse/https-agencies.png)](https://pulse.cio.gov/https/agencies/)

Pulse was created in around six weeks. We built the project [in the open from Day 1](https://github.com/18f/pulse), obtained our domain name and relevant cybersecurity approvals in our first couple weeks, and released new versions of the dashboard to [pulse.cio.gov](https://pulse.cio.gov) early and often throughout the process.

We also gathered usability feedback throughout development from users both inside and outside of the government, and repeatedly incorporated the results of that feedback into our work. Even though Pulse is only a handful of pages and puts most of its data into a simple table, we wanted to pay attention to detail and take the same user-centered approach 18F takes with our larger projects.

Pulse is a static website whose data is created from a combination of sources:

* The [official .gov domain list](https://github.com/GSA/data/blob/gh-pages/dotgov-domains/2015-03-15-federal.csv). This is currently exported manually by GSA staff on a roughly quarterly basis.
* The [list of websites](https://analytics.usa.gov/data/sites.csv) which participate in the Digital Analytics Program. This is also currently exported manually by GSA staff on a roughly quarterly basis.
* Data collected from a public scan of how federal domains respond to HTTP and HTTPS, using an open source tool by [Ben Balter](https://twitter.com/benbalter) called [`site-inspector`](https://github.com/benbalter/site-inspector).
* Data collected from a public scan of HTTPS configuration details for federal domains, using the [SSL Labs API](https://github.com/ssllabs/ssllabs-scan/blob/stable/ssllabs-api-docs.md).

To coordinate the data collection process, we created [`domain-scan`](https://github.com/18F/domain-scan), a small Python command line tool that runs domains through `site-inspector` and the SSL Labs API and produces CSV reports.

We then run these CSVs through a [final step](https://github.com/18F/pulse/blob/master/data/data.py), where we take the low-level primitives we gathered during the scanning process and create some higher-level conclusions and save them in a format that Pulse can automatically render into a table.

The process is not fully automated, and so Pulse isn't updated every day. There's work to do on all of the above to get to the point of showing fully up-to-date data without human intervention.

## Measuring participation in the Digital Analytics Program

[![pulse screenshot of analytics homepage](/assets/blog/pulse/analytics.png)](https://pulse.cio.gov/analytics/domains/)

The [Digital Analytics Program](https://www.digitalgov.gov/services/dap/) is a free, shared web analytics service for U.S. federal agencies.

To participate, agencies place some JavaScript on their websites that report to a combined analytics account. The Digital Analytics Program has [privacy controls](https://www.digitalgov.gov/services/dap/common-questions-about-dap-faq/#part-4) that anonymize visitor addresses and restrict data sharing.

Access to the account is shared within the federal government, and much of its data is shared publicly on [analytics.usa.gov](https://analytics.usa.gov/). The Digital Analytics Program also regularly publishes a list of around 4,000 participating websites that have reported visitor data in the preceding 2 weeks.

[![pulse screenshot of analytics domains](/assets/blog/pulse/analytics-domains.png)](https://pulse.cio.gov/analytics/domains/)

Pulse measures participation in the simplest way possible: by comparing the .gov domain list to the list of participating websites published by the Digital Analytics Program. It's not rocket science, but in the future we'd like to automate this process using the [`analytics-reporter`](https://github.com/18F/analytics-reporter) tool [we created for analytics.usa.gov](https://18f.gsa.gov/2015/03/19/how-we-built-analytics-usa-gov/).

## Measuring HTTPS in .gov

[![pulse screenshot of https homepage](/assets/blog/pulse/https.png)](https://pulse.cio.gov/https/domains/)

Enforcing strong HTTPS is an [important baseline](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/) for government websites, and is in the [process](https://blog.mozilla.org/security/2015/04/30/deprecating-non-secure-http/) of [becoming](https://www.chromium.org/Home/chromium-security/marking-http-as-non-secure) the baseline for the web at large.

HTTPS is simple enough to detect, but characterizing HTTPS support for a domain, precisely and reliably, is trickier than you might expect.

We lean heavily on the open source [`site-inspector`](https://github.com/benbalter/site-inspector), a command line tool written in Ruby. `site-inspector` measures various useful things about websites, and was originally written by Ben Balter to [analyze .gov domains](http://ben.balter.com/2015/05/11/third-analysis-of-federal-executive-dotgovs/).

[![pulse screenshot of https domains](/assets/blog/pulse/https-domains.png)](https://pulse.cio.gov/https/domains/)

To get the precision we wanted, we needed to take into account several subtle things about domains:

* Domains have 4 possible "endpoints" — `https://www`, `https://`, `http://www`, and `http://` — which may each exhibit very different behavior. Describing a domain's HTTPS support means detecting which endpoint is "canonical," as well as looking holistically at which endpoints redirect to others.
* A domain's HTTPS certificate might be issued for an invalid hostname (e.g. `a248.e.akamai.net`). In this case, HTTPS is likely an **unsupported** way to access the domain.
* A domain's HTTPS certificate might have an incomplete or untrusted chain (e.g. missing intermediates, or a private root certificate), in which case HTTPS is likely a **supported** way to access the domain.
* A domain might set an [HSTS](https://https.cio.gov/hsts/) policy for `www`, but neglect to apply one to the bare domain, negating HSTS policy for its other subdomains.
* A domain might support HTTPS with a valid certificate, but have a policy of "downgrading" users by redirecting away from HTTPS to HTTP.

We use `site-inspector` to look at all of the above factors (and many more) and calculate a bunch of helpful things about a domain's HTTPS support. If you really want to dive deeply into the methodology, you can read the [original work discussion](https://github.com/benbalter/site-inspector/pull/24).

To measure HTTPS quality, we lean on [SSL Labs](https://www.ssllabs.com). SSL Labs' [grading system](https://www.ssllabs.com/downloads/SSL_Server_Rating_Guide.pdf) has become a widely respected, universally referenced gauge of HTTPS quality. (Here's the [report for Pulse itself](https://www.ssllabs.com/ssltest/analyze.html?d=pulse.cio.gov).)

We used [`ssllabs-scan`](https://github.com/ssllabs/ssllabs-scan), an open source client for the [SSL Labs API](https://github.com/ssllabs/ssllabs-scan/blob/stable/ssllabs-api-docs.md), to collect the top-level grade along with some common relevant issues that are worth addressing (such as forward secrecy, or the use of SHA-1 signatures).

## Looking forward

We're still in the process of fully documenting the tools we used. If you're interested in using any of it in your own work, and you have questions about how to get started, [ring in on GitHub](https://github.com/18f/pulse/issues/new). We're an open source team, and we'd love your contributions!

Pulse is clearly a small and simple website, but we think it's a promising foundation for celebrating (and motivating) the U.S. government's progress on making world-class websites and online services.

We're thrilled we had the opportunity to work with the Office of Government-wide Policy here at GSA to get Pulse started, and we hope others find it useful. Feel free to [leave feedback](https://github.com/18F/pulse/issues/new) on the project so far, and where to take Pulse next!

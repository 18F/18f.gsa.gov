---
title: "An introduction to HTTPS, by 18F and DigitalGov University"
date: 2015-07-16
layout: post
authors:
- eric
- gray
tags:
- howto
- https
- digitalgov
- security
- technical
- video
excerpt: "18F uses HTTPS for everything we make, and the U.S. government is in the process of transitioning to HTTPS everywhere. As part of this effort, we've recently partnered with DigitalGov University to produce a two-video series introducing the why's and how's of HTTPS."
description: "18F uses HTTPS for everything we make, and the U.S. government is in the process of transitioning to HTTPS everywhere. As part of this effort, we've recently partnered with DigitalGov University to produce a two-video series introducing the why's and how's of HTTPS."
image: /assets/blog/https-webinar/https-webinar-screen.jpg
---
18F [uses HTTPS for everything we make](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/), and the U.S. government is in the process of [transitioning to HTTPS everywhere](https://18f.gsa.gov/2015/06/08/the-us-government-is-moving-to-https-everywhere/). As part of this effort, we've recently partnered with [DigitalGov University](https://www.digitalgov.gov/digitalgov-university/) to produce a two-video series introducing the why's and how's of HTTPS.

- In an **[Introduction to HTTPS for beginners](#introduction-to-https-for-beginners)**, we cover what happens when you use the web, how HTTPS helps protect users, and examines why the web (including the U.S. government) is transitioning to use it for everything. **No technical background required.**

- In **[Implementing HTTPS](#implementing-https)**, we cover the mechanics of HTTPS, how to migrate a website or an API, some of the most important technical guidelines when setting up HTTPS, and some ongoing and future technical and political developments in the field. Some technical background is helpful, though not required.

## Introduction to HTTPS for beginners

This presentation explains how communication across the web works today and briefly dives into [whitehouse.gov](https://www.whitehouse.gov/) using an ordinary browser. It then shows [how HTTPS protects users on the web](https://https.cio.gov/faq/), and walks through a number of reasons for the web and the government to use [HTTPS everywhere](https://https.cio.gov/everything/).

There is no technical background required for this video — anyone who has used the web before should be able to understand the concepts discussed.

<iframe width="800" height="450" src="https://www.youtube-nocookie.com/embed/d2GmcPYWm5k" frameborder="0" allowfullscreen></iframe>

Table of contents:

- [0:00](https://youtu.be/d2GmcPYWm5k?t=0m0s) - Introduction to the webinar
- [2:34](https://youtu.be/d2GmcPYWm5k?t=2m34s) - What happens when you use the web
- [10:12](https://youtu.be/d2GmcPYWm5k?t=10m12s) - Exploring whitehouse.gov via Chrome Developer Tools
- [14:54](https://youtu.be/d2GmcPYWm5k?t=14m54s) - How HTTPS helps
- [24:50](https://youtu.be/d2GmcPYWm5k?t=24m50s) - Why HTTPS for everything?
- [32:37](https://youtu.be/d2GmcPYWm5k?t=32m37s) - Why not HTTPS for everything?
- [38:29](https://youtu.be/d2GmcPYWm5k?t=38m29s) - Now we're using it for everything
- [41:25](https://youtu.be/d2GmcPYWm5k?t=41m25s) - Q&A until the end

## Implementing HTTPS

This presentation discusses how HTTPS works today, the technical details of [migrating websites](https://https.cio.gov/mixed-content/) and [APIs](https://https.cio.gov/apis/) to HTTPS, and goes into the specifics of [HTTP Strict Transport Security](https://https.cio.gov/hsts/).

It then covers the most important [technical guidelines](https://https.cio.gov/technical-guidelines/) that all websites (not just the government) should be aware of when setting up HTTPS, many of which are measured by [the Pulse HTTPS dashboard](https://pulse.18f.gov/https/domains/).

Finally, the presentation looks ahead at some ongoing and future technical and political developments in the field of HTTPS and certificate authorities.

Some technical background in the web is helpful, but may not be required for much of the material.

<iframe width="800" height="450" src="https://www.youtube-nocookie.com/embed/rnM2qAfEG-M" frameborder="0" allowfullscreen></iframe>

Table of contents:

- [0:00](https://youtu.be/rnM2qAfEG-M?t=0m0s) - Introduction to the presentation
- [6:05](https://youtu.be/rnM2qAfEG-M?t=6m5s) - Recap: Intro to HTTPS
- [10:56](https://youtu.be/rnM2qAfEG-M?t=10m56s) - How HTTPS works
- [33:20](https://youtu.be/rnM2qAfEG-M?t=33m20s) - Migrating to HTTPS
- [41:02](https://youtu.be/rnM2qAfEG-M?t=41m2s) - Strict Transport Security (HSTS)
- [51:55](https://youtu.be/rnM2qAfEG-M?t=51m55s) - Technical guidelines
- [1:11:45](https://youtu.be/rnM2qAfEG-M?t=71m45s) - The future
- [1:29:29](https://youtu.be/rnM2qAfEG-M?t=89m29s) - Q&A

We've also created an accompanying list of [links used in the presentation](https://github.com/GSA/https/blob/master/resources/implementing-https-links.md).

As 18F, the U.S. Digital Service and other agencies develop these resources, we'll continue to share them with other federal, state, and local agencies as well as the public, so that everyone can benefit from what we've learned. Big thank you to [DigitalGov University](https://www.digitalgov.gov/digitalgov-university/) for working with us to create these presentations!

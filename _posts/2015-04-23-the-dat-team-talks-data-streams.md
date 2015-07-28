---
title: "The Dat Team Talks Data Streams"
layout: post
authors:
- eric
tags:
- presentation
- open data
- api
- developer
- open source
excerpt: "Max Ogden and Mathias Buus Madsen are visiting 18F today to talk about dat, an open source project for versioning and sharing datasets. This new piece of software is part of their effort to build “automated, reproducible data pipelines that sync."
description: "Max Ogden and Mathias Buus Madsen are visiting 18F today to talk about dat, an open source project for versioning and sharing datasets. This new piece of software is part of their effort to build “automated, reproducible data pipelines that sync."
image: /assets/blog/max-ogden-talk/streams.JPG
---
[![Image of a stream.](/assets/blog/max-ogden-talk/streams.JPG)](https://commons.wikimedia.org/wiki/File:Small_streams.JPG)

Everything I ever learned about [streams](http://ejohn.org/blog/node-js-stream-playground/), I learned from software developer [Max Ogden](https://twitter.com/maxogden). Max, who lives in Oregon, develops client applications, developer tools, and APIs, and works as a developer at a market research company.

He and [Mathias Buus Madsen](https://twitter.com/mafintosh), a developer in Denmark, are visiting 18F today to talk about [dat](http://dat-data.com/), an open source project for versioning and sharing datasets. This new piece of software is part of their effort to build “automated, reproducible data pipelines that sync.”

Not unlike our mission, Max, Mathias and their colleague Karissa McKelvey are committed to expanding the reach and impact of open data.

Before their visit, I spoke with Max to learn more about dat.

**Q: What's the immediate target audience for dat? Who can use it right now to get their work done?**

A: Right now we're building things for people who work with datasets, either the people who publish or the people who install datasets. Dat itself can work with lots of different types of datasets but our core use case is reproducible science, which is why we are currently funded to focus on use cases for scientific data. We also are still in beta, so we try to encourage early adopters to get involved but purposefully aren't looking for mass adoption right now.

When we started working with researchers one year ago we assumed we would need to build GUI apps on top of dat to make our tools useful, but we were pleasantly surprised when all of the researchers requested command line tools.

So I would summarize our current ideal audience as: people who are frustrated with their current workflows when it comes to downloading, publishing, cleaning/munging, importing or exporting datasets and also like to use things on the command line and open issues on GitHub repositories with helpful feedback when things don't work as they expect :)

**Q: Why did you make dat? What was the world missing out on without dat? (Relatedly: What incident or incidents spurred your decision to create dat?)**

A: From 2008-2011 in my hometown of Portland, Oregon, and later in 2011 during my Code for America fellowship, I worked on various data tools for making civic datasets easier to use. These ranged from things like converting raw data into CSV/JSON and putting them into REST APIs, all the way to writing obscure parsers for proprietary government vendor contracted software data formats that nobody's heard of.

One of the themes I noticed was that almost all of the data was "read-only", meaning you could access the data through some sort of data portal or API, but you couldn't fork it, adapt it or send contributions upstream. I thought (and still think) this is a huge problem. Imagine if we didn't contribute to each others source code and just downloaded zip files, modified them on our own machines but never took the time to send our changes or fixes back to the original author. That's what it is like to work with datasets today.

**Q: For a development team like 18F that loves open data and open government with its whole body, how do you think we might use dat in the course of our work?**

A: Think of a dataset that would be more awesome if anyone could contribute to it. The big ones like wikipedia, openstreetmap and openaddresses come to mind, but there are also tons of smaller ones, e.g. a dataset of all the green spaces in a city. You could start by taking the official park boundary dataset from that cities parks & recreation GIS department, but what if you want to include a privately owned publicly accessible park that isn't listed in the cities data because it isn't taxpayer owned? App developers would surely want to have both private and public parks available for their apps, but the city wouldn't normally want to maintain non-city data.

We're designing dat to be useful in a scenario like this. We want to make it easy to combine data sources while still preserving provenance of the data. If you want to know where a piece of data came from, you can look in the history and see. If you are an enterprising individual that might want to host a green spaces dataset, you can take the cities data, fork it, and host your own copy online that combines multiple data sources.

Dat is pretty low level right now, but we're excited to see what things people build on top of it. For example, in the case above it would be really useful to have a merge UI that could let you combine points, lines and polygons to handle geographic data conflicts when combining multiple data sources. We are hoping dat and it's APIs can enable for some really amazing next generation collaborative data tools.

**Q: What’s the biggest technological obstacle you’ve faced while developing dat, and what’s the biggest human-instigated one? What challenges do you foresee as you work to increase dat’s visibility and user base?**

A: We had to go back to the drawing board a few times so far. Originally dat only worked with tables of data, but lots of people had non-tabular data, too (images, pdfs, etc). There's lots of computer science-y things inside dat to make it fast and distributed, but the hardest part of the whole project has been how to take the insanely heterogeneous landscape of databases and data formats and try and come up with an intuitive design language that people will be able to pick up with and throw at their messy data management problems. Git has the advantage of working in a very restrictive environment since all programming languages are just text files in a folder. They can use a single diffing algorithm and much simpler abstractions for representing their data. With datasets it can get very complicated very quickly.

**Q: To date, what has been the most surprising side effect of developing dat?**

A: We started out with government open data use cases in mind. I was quite amazed when we were approached by the Alfred P. Sloan Foundation and were basically convinced by them to focus to work on scientific data problems. I had been an admirer from afar of various open and reproducible science groups, but never thought I would get to join the ranks myself. Compared to the open civic + government data communities, the scientific communities I've worked with have some really amazingly different challenges. For example, openness isn't as important to scientists until after they've published, so the term 'open science' is sometimes a scary idea. I think in many ways the community still has a lot of R&D left to do before we really know what works.

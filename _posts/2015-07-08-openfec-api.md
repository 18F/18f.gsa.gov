---
title: "Introducing the Federal Election Commission’s first API"
date: 2015-07-08
layout: post
authors:
- lindsay
tags:
- our projects
- open data
- fec
excerpt: "Today marks the launch of the FEC’s first API. With that API, searching for candidates and committees will be easier and more interactive."
description: "Today marks the launch of the FEC’s first API. With that API, searching for candidates and committees will be easier and more interactive."
image: /assets/blog/openfec-api/openfec-banner.jpg
---
![The OpenFEC banner](/assets/blog/openfec-api/openfec-banner.jpg)

The Federal Election Commission (FEC) empowers citizens with the
information they need to make informed decisions about their democracy.

Since opening its doors in the ‘70s, the FEC has evolved to better serve
the public with that information. As the years progressed, records have
gone from paper to microfilm and eventually to the web. Today marks the
launch of the [FEC’s first API](https://api.open.fec.gov/developers).

With that API, searching for candidates and committees will be easier and more interactive. Information is organized around concepts like candidates, which are more welcoming than navigating buckets of information based on forms. 

<div style="width: 30%; float: right; margin-left: 10px;">
<a href="http://www.fec.gov/pages/40th_anniversary/40th_anniversary.shtml"><img alt="FEC staff scanning compliance forms, 1982" src="/assets/blog/openfec-api/old-fec.jpg"></a>
<em>FEC staff scanning compliance forms, 1982. Image from the FEC.</em>
</div>

All of these features are supported by our [public
API](http://api.open.fec.gov/developers) so those outside of government
can directly benefit from this technology, by making or using their own
apps. For example, we created an endpoint that accepts partial names in
queries, so you can make your own type-ahead
search.

The API is the backbone of
[OpenFEC](https://18f.gsa.gov/dashboard/project/openfec/) — the FEC's
next digital evolution. It’s also the first public release from our
partnership. Be on the lookout for a new app and an eventual site
redesign. As with all our projects, looking modern isn’t just an
aesthetic choice, it comes from smart design and asking actual website
users what they want. Take a look at our [interactive API
documentation](https://api.open.fec.gov/developers). It not only has a
fresh look, but it’s driven by modern technology underneath the hood.

Releasing the API before it’s complete allows 18F and FEC to get public
feedback and ensure the project will continue to grow and adjust to
better serve the people.

This first round of data focuses on essential information about
candidates and the committees that spend money in elections.

## API endpoints

### Candidates

- See important details about candidates
- View candidate history over time
- Find the committees that fundraise for a candidate

### Committees

- See important information about groups that raise and spend money in
elections
- Look up how those groups change over time

### Financial

- Look up total spending and fundraising
- See major filing reports

### Search

- Data is organized by ID, so search endpoints can help you find the
data you want about the candidate or committee you are looking for.

## API improvements in the works

### Filings

- Browse reports and other document data

### Schedules

- Individual donations (Schedule A)
- Granular spending data (Schedule B)
- Subtotals for Schedule A by state and zip code

### And more!

OpenFEC is the most recent step toward a new website and the latest tool
helping the FEC make campaign finance more accessible for journalists,
academics, developers, and other transparency-seekers.

But don't just read about the API, [sign up for an API key](https://api.data.gov/signup/) and [try it out yourself](http://api.open.fec.gov/developers).

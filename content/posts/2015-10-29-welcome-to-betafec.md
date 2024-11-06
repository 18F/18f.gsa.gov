---
title: "Welcome to betaFEC: campaign finance for everyone"
date: 2015-10-29
authors:
- emileigh
tags:
- agency work
- fec.gov
- open data
- open government
image: /assets/blog/fec/beta-fec-home.gif
excerpt: "As the 2016 presidential election heats up, here at 18F we’ve been working with the Federal Election Commission (FEC) to make campaign finance data more accessible to the public. Today, we launched betaFEC, the first piece in a complete redesign of the FEC’s online presence. We were excited to work on a project that allowed us to delve into intricate campaign finance data, plain language, and the FEC’s first API."
hero: false
---

[<img src="{{ "/assets/blog/fec/beta-fec-home.gif" | url }}" alt="The betaFEC homepage." />](https://beta.fec.gov)

As the 2016 presidential election heats up, here at 18F we’ve been working with the Federal Election Commission (FEC) to make campaign finance data more accessible to the public. Today, we launched [betaFEC](http://beta.fec.gov), the first piece in a complete redesign of the FEC’s online presence.

We were excited to work on a project that allowed us to delve into intricate campaign finance data, plain language, and the FEC’s [first API]({{ "/2015/07/08/openfec-api/" | url }}). The FEC made for a fantastic partner — eager to explore new ideas, design for the user, and communicate in an understandable way.

“The FEC has been doing open data since before it was cool,” said Noah Manger, an 18F designer who created the new site’s user interface.

The result is a beta site with an ambitious goal: Make campaign finance information accessible — and comprehensible — to everyone.

## Why you should care

Campaign finance information can be challenging to understand. It’s governed by complicated statutes and the sheer volume of data can be overwhelming. But every day, thousands of visitors access FEC.gov to search for campaign finance data, research compliance information, study agency actions, file disclosure reports, and more.

The FEC releases information to the public about the money that federal candidates and committees raise and spend, a requirement under the Federal Election Campaign Act. Are you interested in seeing how much money a Senate candidate raised? Or spent? How much debt they took on? Which committees contributed to the campaign? The FEC is the original source.

For example, in the 2012 presidential election, 14 candidates spent more than $1.3 billion dollars combined. That same year, the 1,949 congressional candidates doled out even more: in excess of $1.8 billion. So far this cycle, presidential candidates have raised more than $273 million.

The FEC already housed all that information on their website; the new site makes it easy to search, share, and understand the data.

“Conceptually, you look at the existing FEC website, and it’s organized by FEC reporting forms,” said Lindsay Young, an 18F developer on the project. “For people who don’t know which thing is disclosed on which form and don’t care what bucket it flows into, it can be frustrating.”

## betaFEC features

The new site allows users to browse comprehensive lists of candidates, committees, filings, receipts, and disbursements. And if users are unfamiliar with those terms, they can use a new glossary tool, which defines campaign finance jargon. The glossary is always accessible from the top menu as well as linked by an icon you’ll see next to technical terms like “independent expenditure” and “principal campaign committee.”

Site visitors can find information about candidates and committees with new pages that break down:

-   Basic information, including party, status, treasurer, address, and FEC ID
-   Financial information, including contributions, disbursements, and other transactions
-   All filings in a sortable and filterable format
-   Links to detailed pages about the election and district

Users can also find information about elections by location — searching for a ZIP code, browsing a map, or choosing a state and district. Along with the location search, our team built out election pages. They were designed keeping in mind the most popular features on the current FEC site — the campaign finance maps. The resulting pages add consistency across elections and make related data easier to find.

For example, from the 2016 presidential election page, users can compare two or more candidates by contribution size, contribution location, or type of contributor:

-   Contribution size breaks financial data into five groups ranging from “$200 and under” to “$2,000+.”
-   Contribution type breaks it into individuals and non-individuals.
-   Contribution location shows data by state, either as a table or a map.

While we’re thrilled with the beta site, our work over the past year has been much more extensive than that. Working with FEC, we’ve conducted extensive user research and testing. We also reorganized large quantities of data to build the FEC API, which is the foundation for the beta site. To build the API, we transferred data from FEC’s data warehouse to 18F’s cloud infrastructure and provided hosting, ATO, and DevOps support.

## Why beta?

Beta means we’re still actively working on the site. Information and features aren’t comprehensive or complete. We’ve launched the beta now to gather user feedback from you, the public. We celebrate your [input and contributions](https://github.com/18F/FEC). After all, this site was designed for you.

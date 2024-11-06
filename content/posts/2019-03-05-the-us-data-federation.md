---
title: "The U.S. Data Federation wants to make it easier to collect,
combine, and exchange data across government"
date: 2019-03-05
authors:
- julia-lindpaintner
tags:
- 10x
- data access
- open data
excerpt: "The U.S. Data Federation Project is an initiative of the GSA
Technology Transformation Services 10x program, which seeks to address
the need for knowledge sharing, repeatable processes, and reusable tools
for federated data efforts."
image: /assets/blog/us-data-fed/data-federation-banner.png
---

Coordination and collaboration across disparate, often complex
organizational boundaries is inherent in our distributed system of
government. One way this shows up frequently is in the process of
collecting, aggregating, and sharing data between federal, state, and
local government entities. These data may be used to support policy or budget decisions, to increase operational efficiencies, or be published in aggregate form for other data users. This is what we call a *federated data effort*, and they’re increasingly seen as an engine for transparency, economic growth, and accountability.

18F has worked on a number of federated data projects, perhaps the most prominent being the [Digital Accountability and Transparency Act (DATA Act) of 2014*]({{ "/our-work/data-act/" | url }}), which required all agencies to adopt a new data standard for submitting financial data to the Treasury.

While these federated data efforts are happening all the time, all
across government, there has been very little systemic support or shared processes and infrastructure for these efforts to date. There are a number of things that make federated data efforts difficult: Aligning incentives across organizational boundaries, specifying data standards, ensuring integrity in the data collection process, implementing reliable data validation processes, etc. Despite the fact that efforts like these are becoming more frequent, each new effort is still improvising solutions in terms of processes, tooling, and compliance infrastructure, with little sharing of lessons from one effort to the next.

That’s where the U.S. Data Federation Project comes in. An initiative of the GSA Technology Transformation Services (TTS) [10x
program](https://10x.gsa.gov/), which funds technology-focused ideas
from federal employees, **the U.S. Data Federation Project seeks to
address the need for knowledge sharing, repeatable processes, and
reusable tools for federated data efforts. Its goal is to make it easier to collect, combine, and exchange data from disparate sources**. The project will curate best practices and resources including guides and repeatable processes around data governance, organizational coordination, and standards development in federated environments. The reusable tools it hopes to develop are intended to include capabilities around data validation, automated aggregation, and the development and documentation of data specifications. All our work is documented on [GitHub](https://github.com/18F/data-federation-project) and available to the public. The team is also exploring ways to incorporate the project with other efforts under the [Federal Data Strategy](https://strategy.data.gov/).

## Piloting our first tool

Following an initial research phase, in which we interviewed successful data federation projects and synthesized an [initial playbook](https://github.com/18F/data-federation-project/blob/master/DataFederationFramework.md#the-data-federation-playbook) for anyone undertaking a federated data effort, we prototyped the first
in what we hope will be a suite of customizable tools for data
federation: an open-source data aggregation and validation tool that can be accessed via a web interface or API.

To refine this tool and learn what it takes to implement it, we’ve
partnered with the USDA Food and Nutrition Service (FNS) to pilot a
first application in a few states. Their example helps illustrate the
way these generalized data federation tools can be applied to specific federated data efforts.

Each school year, FNS requires that any institutions participating in
the National School Lunch Program and School Breakfast Program verify
eligibility for a small percentage of households approved for free or
reduced price meals. The results of this verification process are
reported to the states, who in turn submit the data to FNS. This data
set is a critical source of school district level administrative data
for the National School Lunch and Breakfast Programs. It’s used to
answer policy questions, to provide technical assistance to Congress in the legislative process, and as a sampling frame for millions of dollars of research conducted by FNS every year.

Though the standards for the data are set by FNS, state offices have
primary responsibility for ensuring data quality, and currently go
through a process of both automated and manual checks to ward against
errors that would require a lengthy and burdensome remediation process. Similar to the opportunity described in a previous blog post about [reducing the duplication of effort across states implementing eligibility rules]({{ "/2018/10/16/exploring-a-new-way-to-make-eligibility-rules-easier-to-implement/" | url }}) for federal programs, FNS saw an opportunity to build upon existing state and federal validation checks, maintain all of them at the federal level, and allow state systems to access them via API.

With this approach, when school districts submit their verification data through their state’s online system, that data will be checked against a comprehensive set of rules maintained by FNS. Any errors will be returned in real time, allowing the administrators at the school district level to resolve the majority of errors before completing the submission process. Instead of fifty states creating and maintaining separate edit-check systems, the states will all access one central system, significantly reducing effort, cost, and time devoted to data verification. This approach will also reduce the risk of discrepancies as processes and forms are updated, allowing for more sophisticated and consistent data validation, ultimately resulting in higher quality data.

## Where you come in

Over the next several months, we’re hoping to find other partners who
are dealing with similar thorny problems associated with federated data efforts. **If you’re dealing with a process similar to that of FNS, working on harmonizing data, building data specifications, or working on something else that might fit the bill, or even if you just have feedback or questions about this project, please reach out to us at [data-federation@gsa.gov](mailto:data-federation@gsa.gov)!** We’re eager to talk about ways we may be able to help you and learn from your work.

*A number of people have contributed to the project over the course of
several phases, including Philip Ashlock, Catherine Devlin, Tony Garvan, Chris Goranson, Mark Headd, Ethan Heppner, Joe Krzystan, and Amy Mok. We are also grateful for the collaboration of our partners at the USDA Food and Nutrition Service.*

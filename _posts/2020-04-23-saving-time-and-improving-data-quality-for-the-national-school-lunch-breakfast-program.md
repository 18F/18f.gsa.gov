---
title: >-
  Saving time and improving data quality for the National School Lunch &
  Breakfast Program
date: 'April 23, 2020'
authors:
  - julia-lindpaintner
  - mike-gintz
tags:
  - 10x
  - data access
  - open data
excerpt: >-
  In February 2020, pilot states reported back on their experience implementing
  and using a new data validation service during the fall of 2019. They agreed
  that it had significantly improved the data collection and submission process
  for their teams, citing time savings, fewer errors returned, greater ability
  to plan ahead, and lower stress.
---
In March of 2019, we published a post describing the ambition of the 10x U.S. Data Federation project: our work was motivated by the goal of [making it easier to collect, combine, and exchange data across government](https://18f.gsa.gov/2019/03/05/the-us-data-federation/). We hypothesized that this could be done by making reusable tools and repeatable processes more available across government.

To test this hypothesis, we built one such tool called ReVal, a reusable validation library, and partnered with the USDA Food & Nutrition Service (FNS) to put it into production. Two additional use cases at the U.S. Department of Transportation and the Census Bureau helped us feel confident in ReVal’s reusability. One year later, we are excited to share the results of the pilot of the FNS Data Validation Service (DVS), which uses ReVal to streamline data validation for the National School Lunch and Breakfast Program: the FNS DVS resulted in time savings,reduced stress, and greater efficiency for the pilot states, as explained below. 

## Before the FNS DVS: “Tedious and frustrating”

To appreciate the impact of FNS DVS, here’s some context about the previous status quo:

Once a year, program rules require institutions participating in the National School Lunch and Breakfast programs to verify eligibility for a small percentage of approved and participating households. The results of this verification process are reported by the school district-level institutions via the FNS-742 form to their state (usually via a state-provided online system). States in turn collect the responses and submit the data to FNS via the Food Programs Reporting System (FPRS).

Though the standards for the data are set by FNS, state offices have primary responsibility for ensuring data quality. Historically, automated data validation only happened when data were submitted to FPRS; when errors arose, states had to undertake an often lengthy remediation process to resolve the errors with their school district contacts. Over time, many states created their own automated and manual data validation processes to anticipate and resolve errors that would be returned from FPRS. But because states’ processes and systems vary, there is significant duplication of effort as individual states code and maintain validation checks in their systems. State contacts characterized the process as “tedious and frustrating.”

As shown in this diagram, the previous process was characterized by a heavy burden on states to conduct data validation and resolve errors with school districts:

![](https://lh5.googleusercontent.com/AHeFztcwTAnS7sevyMLVlvOXKJZFq37JT8aug-jjN2rixDctwPb1acyDqY2GPELP9RIrXQUSzsahHAcZ_P4HlwQPhvdpxYXrT5qumbVYpvdOpeZpfgpzNGwxemKxEO_FCbDcKC5y)

While FNS collects data through other forms throughout the year, the dataset derived from the FNS-742 is a critical source of administrative data—the most important one that provides school district level data. It’s used to answer policy questions, to provide technical assistance to Congress in the legislative process, and as a sampling frame for millions of dollars of research conducted by FNS every year. Accuracy is important!

## Implementing the FNS DVS

FNS saw an opportunity to use ReVal to power a process, called the FNS Data Validation Service (DVS), that would build upon existing state and federal validation checks, maintain these validation checks at the federal level, host them in the cloud, and allow state systems to access them via Application Programming Interface (API). With this approach, when school districts submit their verification data through their state’s online system, those data are checked against a comprehensive set of rules maintained by FNS. Any errors are returned in real time, allowing the administrators at the school district level to resolve the majority of errors before completing the submission process. And because the DVS is maintained by FNS, the agency was free to increase the number of validation checks without imposing new burdens on the states. The result is a far more rigorous process than the one it replaces.

Here’s an illustration of the new process with ReVal (aka the FNS DVS) in place, offering 110 checks across 73 fields:

![](https://lh3.googleusercontent.com/8pkN4Wg9Ho_PeU4PbyUwoG9jgZHRu-IsoeN7LHGmCCw-vlqZYsIBGPdm-0MHnIjKn1ZAej4VjP4pLTJ0j-1nD02ZVDzXdB-Y4865ErhUOxebZQQu7IY6OasH2dnvj4LARybd_AoW)

FNS anticipated this solution would result in:

* reduction in the burden of the verification process on states during and after the verification season,
* increased confidence by school district staff in data reporting as a result of the more comprehensive validation process,
* time savings and cost avoidance going forward, since changes to validation would happen only at the federal level, and
* higher quality data to support program administration and agency research.

The U.S. Data Federation team worked closely with FNS partners in the Office of Program Integrity (OPI) to adapt ReVal to serve this purpose and published the code as an [open source project on GitHub](https://github.com/18F/usda-fns-ingest). Meanwhile, FNS spread the word about the DVS to states over the course of 2019 and the U.S. Data Federation team provided support to a few state teams experimenting with setting it up. The last pieces of the puzzle—securing Authority To Operate (ATO) and setting up the DVS in a cloud environment managed by FNS—were completed in September, making it possible for Kansas and Arizona to pilot the FNS Data Validation Service during the fall 2019 verification season. A third state, while unable to connect to the FNS DVS in time, implemented the expanded set of validation checks provided by the DVS locally.

## After the FNS DVS: “Ridiculously, tremendously easier”

In February 2020, the pilot states reported back on their experience implementing and using the FNS DVS and its new set of validation checks during the fall of 2019. They confirmed that the FNS DVS had significantly improved the data collection and submission process for their teams, citing time savings, fewer errors returned, greater ability to plan ahead, and lower stress.

Here are a few examples of the benefits, in their own words:

* “We had a reduction in errors from 96 last year to 2 this year. In terms of time, that’s days of work. It used to take at least one person a week—40 hours—to get all the data back fixed.”
* “In the past I would have run the data \[to prepare it for submission] 6-8 times. … This year I ran it twice.”
* “The benefit to my site is it flags the warnings before we upload the data to FPRS so we already have the information and data we need. … I used to have to track what errors were appearing when I uploaded to FPRS—but now I don’t have to do that anymore, which is amazing… we’re skipping an entire back-and-forth now.”
* “Having the results and knowing what warnings are going to be—so I can have the explanations for those things ready to go—saved time and also lowered our stress level so, so, so much. … It even helped us find a few small bugs in our system because we knew what to expect.”

Another noted advantage of the FNS DVS was that instead of states interpreting federal guidance and creating and maintaining separate validation rules, FNS is now essentially providing that guidance as code, prompting one partner to comment:“As far as I’m concerned, when the federal government passes regulations, this should be the model… this is how it should be done.”This approach should also reduce the risk of discrepancies as processes and forms are updated, allowing for more sophisticated and consistent data validation, ultimately resulting in higher quality data.

While the FNS DVS is maintained at the federal level, its design still allows states to adapt it to suit the needs of their users. For example, states may create translations for some of the automated error messages to make sense in the context of their systems. One state that had a multi-step interface for data input got creative to make sure errors resulting from incomplete data weren’t displayed. Despite the effort involved in making these adaptations, however, the states were satisfied and even suggested that they’d like to see a similar service made available for other forms in the future: “DVS doesn’t currently provide us with validation for \[another form]—we did that ourselves… But if FNS’s tool did \[that] someday, we’d just swap ours out and use yours instead.”

## What’s next for FNS & the U.S. Data Federation

For the FNS DVS to fully deliver on its promise, the team at OPI hopes to see full adoption of the tool across all 50 states. Towards that end, OPI

* created a “marketing group” that finds and creates opportunities to promote the DVS,
* promotes the DVS at government and partner conferences, and
* is participating in webinars and other events as appropriate to get the word out.

Meanwhile, the U.S. Data Federation team is using its last phase of [10x funding](https://10x.gsa.gov/the-10x-process/) to return to the underlying ambition of the project. We recognized a synergy between our goal of ensuring that reusable tools and repeatable processes are made available across government and the mandates and recommendations within both the [Evidence Act](https://www.congress.gov/bill/115th-congress/house-bill/4174) and the recently published [Federal Data Strategy 2020 Action Plan](https://strategy.data.gov/action-plan/#action-11-develop-a-repository-of-federal-enterprise-data-resources). In response, we’re collaborating with ongoing efforts by the Office of Management and Budget, the Office of Government Information Services at the National Archives, and other teams inside the General Services Administration to enhance and relaunch [resources.data.gov](https://resources.data.gov/) as a key repository for data-related tools and resources for federal staffers. Having conducted user research with over 30 data workers across more than 14 agencies—from Chief Data Officers to developers to data managers—we learned that this will require changes to the organization of the site and a robust content strategy to ensure the repository’s continued development and relevance. We are prototyping approaches to both of these in the hope that we will be able to demonstrate the need and a model for ongoing investment to support [resources.data.gov](https://resources.data.gov/). By making resources.data.gov as useful and user-friendly as possible, we hope to make success stories like FNS’ more common.

*Many have contributed to the U.S. Data Federation project over the course of several phases, including Philip Ashlock, Catherine Devlin, Tony Garvan, Chris Goranson, Mark Headd, Ethan Heppner, and Joe Krzystan. The current team includes Mike Gintz, Julia Lindpaintner, Amy Mok, Princess Ojiaku, and James Tranovich. We are grateful for the collaboration of our partners at the USDA Food and Nutrition Service, their state partners across the country, data.gov, the U.S. Census Bureau, and the U.S. Department of Transportation.*

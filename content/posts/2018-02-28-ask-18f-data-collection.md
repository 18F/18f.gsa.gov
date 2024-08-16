---
title: "Ask 18F — A new advice column for federal employees"
date: 2018-02-28
authors:
- elaine
tags:
- ask 18f
- data access 
excerpt: "We are launching a new series called Ask 18F – an advice column that answers questions sent in by federal employees. Our technical experts hope to dispel myths and ease fears about building or buying technology in government. We aim to give you suggested resources, questions to ask your team and lastly, a good starting off point to tackle the problem you wish to solve."
---

We’re launching a new series called, “Ask 18F” – an advice column that answers questions sent in by federal employees. Our technical experts hope to dispel myths and ease fears about building or buying technology in government. We’ll give you helpful resources, questions to ask your team, and a good starting point to tackle your problem.

So bring us your questions on technical topics from security to user research best practices to cloud migration. We’d love to hear them all. To help us give you the best answer, the more specific you are about the issue, the better.

To get this column started, we have answers from two of our data experts to a question that’s common among many agencies.

## My office gathers data from a wide variety of sources. How can I make this process easier for our office and our sources? Where should I start?

### [Lindsay Young]({{ "/author/lindsay/" | url }}) - 18F Developer working with the Federal Election Commission 

Collecting data and making it available to the public is no easy feat. With any large project, I recommend starting small. You may be able to collect data by email or use spreadsheet software to make a prototype. Make sure to document the format you need and logic you use to update your data so you can scale prototypes into larger solutions as needed. 

In terms of the content of your data, understanding the various risks will be important. Are you collecting Personally Identifiable Information (PII)? If so, you may need to take a closer look at how you will collect, store, and share this data. I recommend evaluating your systems and security practices as a first step. Here’s [GSA’s policy on PII](https://www.gsa.gov/reference/gsa-privacy-program/rules-and-policies-protecting-pii-privacy-act).

While this may seem daunting, the good news is that you’re not alone. Many agencies, likely including your own, have done this in the past. Look up data other agencies have made public and reach out to the team. To find people who maintain data sets, go to [data.gov](https://www.data.gov/) and look up contact information associated with similar data sets. Sharing best practices, or even tools, amongst fellow federal workers is a great starting point. 

My recommendation is to start small, understand the risks, and reach out for support. Good luck!

### [Tony Garvan]({{ "/author/anthony-garvan/" | url }}) - Data Lead at 18F 

Easing data ingest for the public and for your office is a big undertaking — you likely won’t be able to tackle it all at once. The good news is that things that lessen the burden for the public usually also lessen the burden for your office: less back and forth and more validation up front helps both parties. Digitizing a paper form into a responsive website is generally a good first step. Choose the form that has the biggest impact and that can be deployed in less than six months (generally one with less than five pages). Don’t reinvent the wheel: consider using tools like [login.gov](https://www.login.gov/), [cloud.gov](https://cloud.gov/) and the [U.S. Web Design System](https://designsystem.digital.gov/) to accelerate development and deployment. Once you’ve had success with that, you can move on to bigger fish!


Got a question? No matter how small the task or how big the project, email us at [18f@gsa.gov](mailto:18f@gsa.gov).

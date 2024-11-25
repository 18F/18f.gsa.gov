---
title: "Announcing the criteria for 18F's first micro-purchase contract"
date: 2015-10-26
authors:
- vdavez
tags:
- micro-purchase platforms
- procurement
- acquisition services
- open source
image: /assets/blog/calc-announcement/calc_homepage.jpg
description: "Today, we're beginning our micro-purchase experiment. Here are the details of what we are looking for and our acceptance criteria for the final submission."
excerpt: "Today, we're beginning our micro-purchase experiment. Here are the details of what we are looking for and our acceptance criteria for the final submission."
---

Two weeks ago, [we announced]({{ "/2015/10/13/open-source-micropurchasing/" | url }}) our intention to pursue an experiment in open-source micro-purchasing. Today, the experiment *begins*. Here's how it works.

First, go to [this GitHub issue](https://github.com/18f/calc/issues/255) to see the basis for the micro-purchase. In the title of the issue is the current bid. There, you’ll have access to this [Google Form](https://docs.google.com/a/gsa.gov/forms/d/1eRFX0hSTTXMc2FulK6kPP2P02ZApQqlYZL7oVDghJJo/viewform), where you can provide your DUNS number, your GitHub username, and your bid. (Note: You must be registered in SAM.gov to participate in this first iteration).

As we mentioned before, we’ve identified an item from our product backlog for the [CALC](https://calc.gsa.gov) product that we've tagged as a "micro-purchase." That issue is [available here](https://github.com/18F/calc/issues/255), and reads as follows:

> ## Load Schedule 70 data into CALC
>
> As previously explained, this issue has been tagged as a "micro-purchase" issue. The opening "bid" for this issue is $3,499, and vendors may offer lower bids. The vendor with the lowest bid at closing time will have 10 working days to provide code that satisfies the requirements and acceptance criteria below. Upon successful completion, the vendor will be paid. If the vendor fails to complete the requirements and satisfy the acceptance criteria within the 10 working day period, then the vendor with the next lowest bid shall have 10 working days to provide the code. If the acceptance criteria are not satisfied, vendors shall not receive payment pursuant to this competition.
>
> ### Description of issue
>
> Currently, CALC uses a [management command to load data](https://github.com/18F/calc/blob/master/contracts/management/commands/load_data.py) from 7 different schedules. We want to load the Schedule 70 data provided into CALC (note, the data will likely need to be reformatted). 
>
> ### Acceptance criteria
>
> 1. Either a new Django management command or modification to [this file](https://github.com/18F/calc/blob/master/contracts/management/commands/load_data.py) to load the Schedule 70 as Contract objects in the database.
>
> 2. Whether a new command or a modification to the existing command, the rating from [Code Climate](https://codeclimate.com/github/18F/calc) for the file must be at a B or better rating, and test coverage for the command at 90% or better upon completion.
>
> 3. Front-end changes to ensure the ability to filter results by schedule type (e.g. Schedule 70 data or others) and easily see the schedule source for each row in the results.
>
> ### Bid submission deadline
>
> Bids for this issue close at 12 p.m. EST on Thursday, Oct. 29, 2015. To bid on the issue, [click here](https://docs.google.com/a/gsa.gov/forms/d/1eRFX0hSTTXMc2FulK6kPP2P02ZApQqlYZL7oVDghJJo/viewform)

If you’re interested in bidding, the closing time for the bid is 12 p.m. on Thursday, October 29, 2015. The opening bid starts at $3,499, and the lowest bid at the closing time will have 10 working days to ship the code necessary to satisfy the criteria. If the criteria are met, the vendor gets paid. If the criteria aren't met the vendor shall not receive payment, the next lowest bidder will have the opportunity.

Bear with us as we try this experiment out. There will no doubt be hiccups, but if you have any questions, please email [micropurchase@gsa.gov](mailto:micropurchase@gsa.gov). In the meantime, let’s ship it.

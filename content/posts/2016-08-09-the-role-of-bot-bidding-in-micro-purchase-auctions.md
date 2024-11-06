---
title: "The role of bot-bidding in Micro-purchase auctions"
date: 2016-08-09
authors:
- michael-torres
- alan
tags:
- micro-purchase platforms
- acquisition services
excerpt: "The 18F Micro-purchase team recently introduced the ability to bid on an auction via API. This feature is part of our long-standing commitment to experiment and iterate towards the easiest bidding process for vendors. Like everything in the platform, we treated this feature as an experiment to learn how it would affect bidding behavior and the final price of auctions. Here’s what we learned."
description: "The 18F Micro-purchase team recently introduced the ability to bid on an auction via API. This feature is part of our long-standing commitment to experiment and iterate towards the easiest bidding process for vendors. Like everything in the platform, we treated this feature as an experiment to learn how it would affect bidding behavior and the final price of auctions. Here’s what we learned."
---

The 18F [Micro-purchase](http://micropurchase.18f.gov) team recently  introduced the ability [to bid on an auction via API](https://pages.18f.gov/micropurchase-api-docs/api-reference/). This feature is part of our long-standing commitment to experiment and iterate towards the easiest bidding process for vendors. Like [everything in the platform]({{ "/2015/11/06/micro-purchase-lessons/" | url }}), we treated this feature as an experiment to learn how it would affect bidding behavior and the final price of auctions. Here’s what we learned:

## Bidding behavior changes

Before the [cloud.gov auction](https://micropurchase.18f.gov/auctions/24), we’d been averaging 5-7 bids per auction with approximately 3-5 unique bidders per auction. So, we were quite surprised that there was so much activity with this auction: There were 70 bids from seven unique bidders, with three unique bidders on just the last day. The final price was $2,866, which was the second highest ever at the time. This was interesting for us to see, as we’d expected five unique bidders and a final price much lower than the one we got.

## What happened?

There were a few elements about this auction that made it different from others we’d done in the past. First, it was for [18F’s cloud.gov platform](https://cloud.gov/), which is an incredibly exciting effort that has the potential to markedly improve the way the federal government builds software. The auction itself was also atypical of the normal auction, and was probably appealing just because of the technology involved: working with the Amazon Web Services broker using Go.  

In addition to this, for the first time, we saw bots being used heavily by two vendors in particular. These bots bid against each other throughout the auction, and against other vendors who were manually bidding via the UI. The winning bid came in just seconds before the deadline and was made by a bot.

## How do bots affect bidding behavior?

Our hypothesis was that enabling bidding via API would actually increase activity in a way that would drive down the price of the auction, and bring in more people to participate. In the cloud.gov auction, we saw an increase in the total number of bids, and the total number of unique bidders, but 74 percent of the bids came from two bots using the API to bid against each other, and the winning bid was very high relative to previous auctions.

Vendors used bots in this auction to set a floor bid, based on an initial evaluation of the auction requirements, and then set the bots to auto-bid in increments until the floor bid was reached. So, **bots collapse reverse auctions into a kind of sealed-bid auction when the end date is rigid**. This could explain the high number of bids, since the bidding increments are small. The relatively high price could also be because the work [was more than we had realized]({{ "/2016/07/07/when-a-micropurchase-doesnt-work-out-we-try-to-learn-from-it/" | url }}), and the vendors would have set their floor bids accordingly.

It was also interesting to note that the winning vendor was experimenting with the platform as well. He built an open source bot that he hoped others would leverage against him in the bidding process. As it turned out, no-one else used it. But that could change in the future. It would be interesting to see what would happen if more people were using bots and we made some changes so that the reverse auctions didn’t collapse into sealed-bid auctions.

## Questions and action items going forward

As we continue to iterate, we want to keep the automated bidding feature, and allow bots. However, we’ve gotten some informal feedback from vendors that it can be demotivating to them to be underbid at the last minute by a bot (even though this could occur absent automated bidding).

So how do we maintain the value of this experiment for both the vendor and the customer? Is there value in multi-bid auctions when bots are involved? Does this just make bidding far too much of a hurdle for most vendors to participate? If bidding bots effectively collapse a multi-bid auction into a sealed bid auction, then why not just run sealed bid auctions?

Our team is considering adding some features to decrease the likelihood of someone getting out-bid a the last minute:

- Extend the bid time if a bid comes in at the last minute (automated or not).
- We may also want to experiment with alerts to notify bidders of the time extension.
- Increasing the smallest increment (currently $1) a vendor can bid
Automatic re-bidding

The [Micro-purchase API](https://pages.18f.gov/micropurchase-api-docs/) is designed to help us be transparent about what we’re doing, and to give vendors an easy way to participate (so they don’t have to log into the platform every time they place a bid). We want to continue iterating in this direction, and we’ll continue to encourage use of the API in whatever capacity vendors choose because we believe it will improve the experience for everyone.

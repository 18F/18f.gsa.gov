---
title: "How and why we built the micro-purchase bidding platform"
date: 2016-02-19
authors:
- alan
- kane
- alla
tags:
- micro-purchase platforms
- procurement
- acquisition services
excerpt: "This past December, 18F launched a micro-purchase platform to enable
vendors to place bids on opportunities to deliver open source code that
costs $3,500 or less. This is a look at how and why we built this platform."
description: "This past December, 18F launched a micro-purchase platform to enable
vendors to place bids on opportunities to deliver open source code that
costs $3,500 or less. This is a look at how and why we built this platform."
image: /assets/blog/micro-purchase/micro-purchase-homepage2.jpg
hero: false
---

This past December, 18F launched a micro-purchase platform to enable
vendors to place bids on opportunities to deliver open source code that
costs $3,500 or less. This platform is a key part of 18F’s larger
experiment around using the federal government’s [micro-purchase
authority](https://www.acquisition.gov/far/html/Subpart%2013_2.html) to
procure useful digital services from the broader vendor community. Below
is a look at how and why we built this platform.

Testing a hypothesis with a minimum viable product
--------------------------------------------------

[{% image "assets/blog/micro-purchase/micro-purchase-issue.jpg" "The first version of the micro-purchase experiment used a GitHub issue to track bids." %}](https://github.com/18F/calc/issues/255)

For the [first micro-purchase
auction](https://github.com/18F/calc/issues/255), we launched a minimum
viable product (MVP). We wanted to test the hypothesis that vendors
would bid on very small opportunities and successfully deliver the
requirements. If this hypothesis was false, we wouldn’t want to have
sunk many hours into building a more complex platform that serves no
purpose. To test the hypothesis, we built a web-based contraption
consisting of Google Forms, GitHub Issues, and the GitHub API. Vendors
placed bids in the Google Form, which populated a Google Spreadsheet.
The spreadsheet triggered a Google Apps Script program that interacted
with the GitHub API to update the title of a designated GitHub Issue.
Several times during the bidding process, we needed to manually re-run
the script as it did not always run when it needed to. The contraption
worked good enough but was not something we would want to keep using.

Building a platform
-------------------

[{% image "assets/blog/micro-purchase/micro-purchase-homepage2.jpg" "The micro-purchase platform site." %}](https://micropurchase.18f.gov)

After the initial auction, our hypothesis was proven: many vendors
placed bids, and the winning vendor successfully delivered the
requirement. However, the Google Form MVP was not sustainable for future
auctions. With this in mind, we set out to build a platform to enable
easy open source micro-purchases. First and foremost, our goal for the
platform was that it would be easy for vendors to participate. That
meant that vendors would not have to waste time with long registration
processes or get mired down in lengthy requirements documents. Second,
we wanted the platform to make the administration of posting, receiving
bids, and evaluating the vendor-delivered code to be a painless,
scalable process for 18F staff.

As we said in our blog post [introducing the micro-purchase
experiment]({{ "/2015/10/13/open-source-micropurchasing/" | url }}),
one goal with this project is to “contract for [open source]
contributions. And we want to do it the 18F way.” One aspect of
contracting “the 18F way” is that systems should be built out of
API-driven, modular components. The micro-purchase platform itself is no
exception to this principle. In addition to a Rails application’s web
interface, we built an API interface, as well as Ruby client libraries
for the platform’s API and for the SAM.gov API, where vendors had to
register before bidding on an auction.

The main codebase can be accessed at [micropurchase.18f.gov
](https://micropurchase.18f.gov)and is [available on
GitHub](https://github.com/18F/micropurchase). We chose Rails because
it’s an open source, well-documented framework for rapidly building web
applications. Also, we have a lot of in-house expertise in Ruby and some
team members who knew how to keep a Rails apps
[clean](https://codeclimate.com/github/18F/micropurchase) while moving
fast.

Because we require all participating vendors to have a DUNS number as
part of a valid SAM.gov registration, we use the SAM.gov API to assist
us with the administration of the micro-purchase platform. We built a
separate Ruby gem, called [Samwise](https://github.com/18F/samwise),
to access the SAM.gov API. Samwise, in turn, is used in a [Rake
task](https://github.com/18F/micropurchase/blob/develop/lib/tasks/sam.rake)
for verifying that DUNS numbers provided by vendors are registered in
SAM.gov.

We also took a somewhat unorthodox approach to authentication for a
government website. The micro-purchase platform only uses GitHub OAuth
for authentication (for now, at least). We made this decision because
vendors need to have a GitHub account in order to deliver the
requirements of a micro-purchase via pull request. Since vendors would
need to have a GitHub account anyway, we felt it would be onerous to
require an account with an additional identity provider in order to
participate.

Most of the site content can be seen without having to sign in. The home
page has a list of current and expired auctions with details about bids.
When you want to bid on an auction, you are prompted to sign in through
GitHub.

## What’s next?

Our team will continue this experiment, and we anticipate rolling out
new auction methods in the coming weeks. This will include single-bid
auctions as well as opportunities reserved for certain types of vendors
(such as [SBA 8(a) small
businesses](https://www.sba.gov/contracting/government-contracting-programs/8a-business-development-program)).
We’ll also continue iterating on the platform and making it better for
users and administrators, alike. The next set of auctions will launch at
1 p.m. EST on February 24, and we look forward to posting a larger
variety of opportunities in the future!

Want to learn more about the platform and future micro-purchases? [Join
our email list](http://eepurl.com/bJQHFr) to receive periodic updates.
We also welcome issues and pull requests on both the platform and
[API](https://pages.18f.gov/micropurchase-api-docs/).

---
title: "67 million more Federal Election Commission records at your
fingertips"
date: 2015-07-15
layout: post
authors:
- lindsay
tags:
- our projects
- open data
- fec
- api
excerpt: "The records we’re adding today to the Federal Election Commission's API are the meat and potatoes of campaign finance. You can see in detail where a campaign’s money comes from and where they spend their money."
description: "The records we’re adding today to the Federal Election Commission's API are the meat and potatoes of campaign finance. You can see in detail where a campaign’s money comes from and where they spend their money."
image: /assets/blog/openfec-api/openfec-banner.jpg
---
We’re so glad that people have been [so
excited](https://storify.com/18F/18f) about the [Federal Election
Commission’s (FEC) first
API](https://18f.gsa.gov/2015/07/08/openfec-api/). Now, there are
millions of more records for you to explore! We’re looking forward to
seeing what the public will build with its data.

The [OpenFEC API](https://api.open.fec.gov/developers) added a filings
endpoint as well as itemized receipt and disbursement data. This is the
first major update to the API, but the OpenFEC API is part of a larger
project that will have continual improvements and additions. **The
records we’re adding today are the meat and potatoes of campaign
finance. You can see in detail where a campaign’s money comes from and
where they spend their money.**

As my fellow campaign finance geeks are well aware, the July quarterly
deadline is today, and we’re introducing some new endpoints today that
you might find fun to try out. But you don’t have to be a “campaign
finance geek” to use the API.

If you haven’t seen it yet, Bob Lannon of the Sunlight Foundation wrote
a [great
explainer](https://sunlightfoundation.com/blog/2015/07/08/openfec-makes-campaign-finance-data-more-accessible-with-new-api-heres-how-to-get-started/)
about how to use the API. He even published an [iPython
notebook](https://github.com/boblannon/blogpost_fec-api-howto/blob/master/fec_api.ipynb)
so you can dig into his code interactively.

Keep in mind that the API is still [in
beta](https://18f.gsa.gov/dashboard/stages/#beta) and not battle
tested, so continue to use the data at the
[original FEC site](http://www.fec.gov/pindex.shtml) for trusted figures. Please file
[bug reports](https://github.com/18F/openFEC/issues) if you find
something that’s incorrect.

Here are some tips you might like to know before you [grab an API
key](https://api.data.gov/signup/) and check out the new features in
the [interactive documentation](https://api.open.fec.gov/developers).

## See new campaign finance documents

We now have a [new filings
endpoint](https://api.open.fec.gov/developers#!/filings). The current
plan is to update OpenFEC data nightly. Right now, this endpoint will be
an easy way to look for new filings. The filings endpoint will
eventually house all reports and other documents, like “Requests for
Additional Information,” that the FEC sends to filers.

Some of the most interesting data to play with is contained in
“Schedules.” Today, we’re releasing Schedule A, which details
contributions to campaigns, and Schedule B, which reports spending by
campaigns.

## Find who’s giving to campaigns using Schedule A data

Our release of an endpoint for Schedule A ([`/schedules/schedule_a`](https://api.open.fec.gov/developers#!/schedules/get_schedules_schedule_a)) enables one of the most
requested features — looking for contributions by contributor name.

Schedule A contains interesting details that describe itemized money
that comes into a campaign.

Two things that tend to confuse people are “memoed” contributions and
“unitemized” contributions. Memoed contributions provide more details
about a previously reported item, so you don’t want to include memoed
items in totals. Campaigns aren't required to report individual
contributors who give $200 or less in the Schedule A section of the
forms, but the total of those small donations are reported as
“unitemized contributions” on the summary section of the form.

Aside from the raw data, we’ve also created some subtotals that will be
great shortcuts for people interested in doing data visualization.

**Would you like to visualize money flowing between different FEC
filters?**

See the breakdown of contributions that came from other committees using this endpoint: [`/schedules/schedule_a/by_contributor`](https://api.open.fec.gov//developers#!/schedules/get_schedules_schedule_a_by_contributor)

Also, keep in mind that the data reflects the paperwork coming into the
FEC, so if key information like the FEC ID of a committee contribution
is missing, the data will under-represent contributions that belong to
that committee.

**Would you like to compare how much money is coming from differently
sized contributions?**

The [`/schedules/schedule_a/by_size`](https://api.open.fec.gov/developers#!/schedules/get_schedules_schedule_a_by_size) endpoint aggregates Schedule A donations based on size:

-   $200 and under
-   $200.01 - $499
-   $500 - $999
-   $1000 - $1999
-   $2000 +

In cases where the donations are $200 or less, the results include
small donations that are reported on Schedule A, but filers are not
required to itemize those small donations, so we also add unitemized
contributions. Unitemized contributions come from the summary section of
the forms. It represents the total money brought in from donors that are
not reported on Schedule A and have given $200 or less.

**Perhaps you want to find where a campaign’s contributions are coming
from by state?**

Pick a committee ID and the [`/schedules/schedule_a/by_state`](https://api.open.fec.gov/developers#!/schedules/get_commttee_committee_id_schedules_schedule_a_by_state) endpoint will give you the totals reported
by state for that committee.

## Use Schedule B to see where campaigns spend money

Our FEC data sherpas (in other words, the people who have been climbing
this mountain all along and don’t get enough credit) Paul Clark and Jeff
Chumley, [released itemized
disbursement data](http://www.fec.gov/finance/disclosure/ftpdet.shtml)
last February, which allows you to view where all this campaign money is
going. Now, this information is also available via the API.

This provides yet another opportunity for data visualization.

Schedule B provides the details of where campaigns spend money. You can
filter by many values, including amount and name of the entity receiving
the money, by using the [`/sechedule/schedule_b`](https://api.open.fec.gov/developers#!/schedules/get_schedules_schedule_b) endpoint.


## Pagination and count

We’re working with large datasets, so there are some trade-offs between
performance and features. One of those trade-offs is that we’re using
approximate count for the larger data sets. For example, we’re using 45
million Schedule A records. We can return your subset of records in a
timely manner, but it would take several minutes to get the exact count,
since the database counts them one at a time. Instead, Josh Carp
discovered a [wonderful hack that uses postgres’ EXPLAIN
function](https://wiki.postgresql.org/wiki/Count_estimate) to get an [approximate count quickly](https://github.com/18F/openFEC/blob/develop/webservices/common/counts.py).
We use approximate counts for large result sets and revert to exact
counts for smaller queries.

On the behemoth data sets, pagination is a bit less straightforward. You
can sort a variety of ways, but you need to supply indexes to get to the
next page. Again, this is to make the endpoint perform better. Managing
random offsets on a data set of this size would take a very long time
per request.

Due to the large quantity of Schedule A and Schedule B records, these
endpoints are not paginated by page number. Instead, you can request the
next page of results by adding the values in the `last_indexes`
object from `pagination` to the URL of your last request. For example,
when sorting by `contributor_receipt_date`, on the schedule\_a
endpoint, you might receive a page of results with the following
pagination information:

```json
{
  "pagination": {
    "pages": 2152643,
    "per_page": 20,
    "count": 43052850,
    "last_indexes": {
        "last_index": 230880619,
        "last_contributor_receipt_date": "2014-01-01"
    }
  }
}
```

To fetch the next page of results, append
`last_index=230880619&last_contributor_receipt_date=2014-01-01` to
the URL.

Our goal is to display as much data as possible. For the bulk of
candidate and committee information, we’re displaying data starting with
the 1980 cycle. For performance and expense reasons, we are limiting
Schedule A and B data to the last four years. If you need older data, it
is still available in the [FEC’s extensive bulk data
offerings](http://www.fec.gov/finance/disclosure/ftpdet.shtml).

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Most profound compliment you can make of an <a href="https://twitter.com/hashtag/opendata?src=hash">#opendata</a> API is to build something with it. Let&#39;s get cracking folks. <a href="https://t.co/TGKTglprLj">https://t.co/TGKTglprLj</a></p>&mdash; Mark Headd (@mheadd) <a href="https://twitter.com/mheadd/status/619098677710340096">July 9, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

If you make something with the FEC API, be sure to share your creations
with us on
[Twitter](https://twitter.com/18f).
We would like to highlight some of your great work.

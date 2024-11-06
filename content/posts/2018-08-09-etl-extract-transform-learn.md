---
title: "ETL: Extract, Transform, Learn"
date: 2018-08-09
authors:
- catherine
tags:
- data access
- best practices
- technical guides
- lessons learned
excerpt: "Providing government data to the public almost always requires
building a data processing pipeline between its place of origin and the
systems that will serve it. Data must be copied, transferred between
digital storage formats, reshaped to meet the needs of reporting
systems, groomed for readability, and cleansed for accuracy."
---

Providing government data to the public almost always requires building
a data processing pipeline between its place of origin and the systems
that will serve it. Data must be copied, transferred between digital
storage formats, reshaped to meet the needs of reporting systems,
groomed for readability, and cleansed for accuracy.

All these processes are commonly called ETL: Extract, Transform, Load.
In our work with a variety of agencies, we've learned several lessons to
guide future ETL work.

## Respect quantity

### Why we don't worry

ETL processes happen "out-of-band" from the end user's point of view; by
the time they request data through a web interface or API, the ETL tasks
are already complete, so ETL speed has no direct effect on the user's
experience. Also, we imagine each element of data passing through the
ETL process only once. Thus, we often think of the speed of ETL as a
minor concern.

### Why we should worry

Human brains have little intuition for large numbers, and federal
information systems can contain large amounts of data — so do the math!
If processing a development sample of 1,000 rows takes 10 minutes, and
the full data set contains 100 million rows — entirely realistic for
some datasets we work with — processing the full set will take more than
10 days.

### It won't be one-time

Data providers will revise the data supplied upstream. Bugs, policy
changes, and downstream data schema changes will require changed ETL
code. In each case, those "one-time" ETL processes will need to run
again. And again. And again.

### Consider set-based operations

Most web developers use object-relational mappers that loop over rows
one by one, but set-based operations can run much faster. Options for
set-based operations include

- Raw SQL
- Data analysis libraries like [Pandas](https://pandas.pydata.org)
- Set-based functions within ORMs (such as Django's `.bulk\_create\`
and `.update`)

If your project will ultimately need a set-based technology, it's best
to make that decision early, since switching from loop-based to
set-based can mean rewriting the entire ETL process.

## Humility

### Transform modestly

The data's schema describes the shape of the data — how fields are
defined and grouped together into tables, how those tables relate to
other tables, and so forth.

On one major project, we tried to make application development easy by
designing a data schema carefully fitted to the application's needs.
This was very different from the form in which data was provided
upstream, so the back-end developers worked hard to write and test an
extensive ETL process.

But [agile, user-centered
design]({{ "/2015/11/17/choose-design-over-architecture/" | url }})
means you can’t know the application's final format at the beginning of
a project; it evolves continually with the experiences of the
developers, product owner, and end users. Our front-end developers made
extensive changes as needs were clarified and discovered.

Changes in data schemas and ETL processes, however, are more laborious
and risky than front-end changes. Instead of trying to keep up, the team
ultimately built a series of [materialized
views](https://en.wikipedia.org/wiki/Materialized_view) — query
results stored as tables, presenting data to the application in a useful
form without restructuring the underlying tables. These views are easier
to rapidly evolve to keep up with the application's needs.

But, if the data structure would end up hidden behind a set of
materialized views anyway, what was the point of reshaping the data from
upstream? Couldn't materialized views have masked the data in its
original upstream shape as well as they mask the post-ETL shape?

The lesson is to put as little "T" in "ETL" as possible — transformation
might be more work than it's worth, especially when lightweight
techniques like materialized views might do.

### Cleanse humbly

It's very unsatisfying to expose data that isn't clean and beautiful.
Missing state codes from a location, obvious misspellings, inconsistent
abbreviation, and more cry out to be cleansed; the itch to write
cleansing code immediately can be overwhelming.

But that code will be wasted if product owners don't want to use it. Why
wouldn't they? Cleansing data suggests taking responsibility for its
accuracy; cleansing some portions can imply claiming the full
correctness of the rest. When product owners are different from the
data's upstream source, they may want to take responsibility only for
faithfully reporting data as delivered to them, not for the overall
accuracy of processes they don't control.

As usual, strong communication between developers and project owners is
key — make sure to know the project owner's overall intent and stance.

## Leave breadcrumbs

Often upstream data is submitted to a system multiple times, by mistake
or to correct earlier errors. A good data pipeline should be idempotent
— you should be able to run data through it multiple times safely,
without generating duplicate records. That requires connecting records
in their final form to their original sources.

Assuring yourself and QA that the data pipeline preserves information
faithfully — and debugging it when it doesn't — likewise demand
information about records' sources.

If you don't record that information during the ETL process itself,
puzzling it out afterward involves detailed detective work, slow-running
queries, or both. Retaining information about data origins saves work
and uncertainty later.

Advanced SQL like array functions and Common Table Expressions with
RETURNING clauses can help. A simple array example:

```
INSERT INTO locations
SELECT recip_city AS city,
  recip_state AS state,
  recip_addr AS addr,
  ARRAY_AGG(id) AS source_ids
FROM grants
GROUP BY 1, 2, 3
```

For more precise debugging, record not just source row IDs, but the name
of the ETL script you used and its version control commit identifier.

## Consider tools

ETL needs vary widely between projects, and do-everything platforms that
promise to encompass all possible ETL can cost you flexibility. However,
using modular tools with a "[small, sharp
tool](https://brandur.org/small-sharp-tools)" approach can leverage
other developers’ skills and make a pipeline more systematic.
Researching available open-source tools from [curated tool
lists](https://github.com/pawl/awesome-etl) can be time well-invested.

Agile development processes for web apps are well-understood, but agile
development of ETL pipelines is less well-trodden ground. Hopefully
these experiences will help!

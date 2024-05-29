---
title: "How we get high availability with Elasticsearch and Ruby on Rails"
date: 2016-04-08 12:05:00 -4
authors:
- pkarman
tags:
- best practices
- technical guides
- modern practices
excerpt: "If you’re already using Ruby on Rails and Elasticsearch, check out our replacement Rake tasks for the Elasticsearch Rails gem."
description: "If you’re already using Ruby on Rails and Elasticsearch, check out our replacement Rake tasks for the Elasticsearch Rails gem."
image:
---

On [e-Manifest](https://github.com/18F/e-manifest),
[C2](https://github.com/18F/C2), and [Open Data
Maker](https://github.com/18F/open-data-maker), we pair a full-text
search tool with a storage tool, as is a common technique for
information management systems. For example, we keep the canonical data
in a database and also push it to a search tool; all queries are
directed first at the much-faster search tool.

The technique is so common that [modern
databases](http://www.postgresql.org/docs/current/static/textsearch.html)
often include an [integrated
full-text](http://dev.mysql.com/doc/refman/5.7/en/fulltext-natural-language.html)
[search component](https://www.sqlite.org/fts5.html), which can be
very useful for simple data models where you want to, for example,
search blog posts or a few large text columns in a table or two.
Sometimes, though, your data model is complex enough or the user
experience demands features that the built-in search component does not
offer. Then it's [time to consider a standalone search
tool](https://github.com/18F/C2/issues/865), like Solr or Elasticsearch.

A database gives us safety: redundancy, validations, referential
integrity checks, and transactions. With safety comes tradeoffs: it can
be difficult and expensive to match a single word from multiple columns
of many words, and all those data integrity features take time and CPU
cycles.

A full-text search tool gives us speed; an [inverted
index](https://en.wikipedia.org/wiki/Inverted_index) makes finding a
needle amidst a haystack of data a very fast operation. As with the
storage tool, there are tradeoffs: the data pushed into the search tool
must be de-normalized, and then kept in sync with the canonical storage
tool.

The experience for the user can be lovely: near-instantaneous search
results, even for really large datasets. The experience for the
developer can be ... less than lovely. Keeping multiple tools in sync,
especially for large datasets, can require a lot of both time and
effort. For anything beyond the simplest of models, the stored data is
likely normalized across multiple tables and columns, so creating the
searched data can make re-assembling the data into its de-normalized
state a costly exercise. In a typical use case, the time spent follows
the [Pareto
principle](https://en.wikipedia.org/wiki/Pareto_principle): 80 percent
of the time is spent
[marshalling](https://en.wikipedia.org/wiki/Marshalling_(computer_science))
the data from storage and sending it to the search tool, while the
search indexing process itself usually takes about 20 percent of the
total time.

Example
-------

Take this example. We have a database with these tables:

-   reports
-   attachments
-   users
-   groups
-   user_groups

Each report may have zero or more associated attachments (one-to-many)
and zero or more associated users (one-to-many). Each user may have zero
or more associated groups (many-to-many).

Say we want to find all the reports that belong to user Jane and that
have attachments that contain the word "apple". Searching the inverted
index can be a query as simple as:

> user:janedoe@example.com attachments:apple

But to make that simple query possible, we must de-normalize a report
and its associated objects into a single "document" object, which might
look like this:

```json
{
  "id": 123,
  "title": "my report",
  "description": "all the apples fit to eat",
  "user": {
    "id": 456,
    "first_name": "Jane",
    "last_name": "Doe",
    "email": "janedoe@example.com",
    "groups": [ "SomeGroup", "AnotherGroup" ]
  },
  "attachments": [
    {
      "id": "abc123",
      "filename": "list-of-apple-orchards.csv",
      "content": "honeycrisp yummy, macintosh tasty, apple cores by the bushel"
    }
  ]
}
```

Building that de-normalized object from the database requires multiple
SQL queries:

```
SELECT * FROM reports WHERE id=123
SELECT * FROM attachments WHERE report_id=123
SELECT * FROM users WHERE id=456
SELECT name FROM groups WHERE groups.id IN (SELECT group_id FROM user_groups WHERE user_id=456)
```

That’s a lot of work to make the user query so simple.

Problem: Wall-clock time
------------------------

Performed once, those SQL queries probably take, cumulatively, less than
a second. But if you have a million reports to index in your search
tool, that adds up to many millions of SQL queries and a lot of
[wall-clock time](https://en.wikipedia.org/wiki/Wall-clock_time). And
if your search index configuration needs to change, you probably need to
re-index everything again. During development, especially, you may
re-index large data sets many, many times.

Solution: Divide and conquer
----------------------------

Fortunately, as an [impatient developer](http://threevirtues.com/) you
can take advantage of the fact that, even though the marshaling phase of
the synchronization process takes up the majority of the wall-clock
time, the problem lends itself to the
[MapReduce](https://en.wikipedia.org/wiki/MapReduce) pattern; you can
split the problem into smaller pieces and run them in parallel. Modern
computers, even the laptop on which I'm composing this blog post, have
multiple processor cores, each of which can run multiple threads. A lot
of the time, one or more cores are sitting idle. Using all the resources
in the machine can decrease the total wait time significantly.

Parallel play
-------------

Here's a real example. I work on
[multiple](https://github.com/18F/e-manifest) [Ruby on
Rails](https://github.com/18F/C2) projects that depend upon PostgreSQL
and Elasticsearch. My laptop has [four
cores](http://stackoverflow.com/a/1715612), so during the data
synchronization process, one core will be dedicated to Elasticsearch,
and one core to PostgreSQL, leaving two cores free to run Ruby code that
will read from PostgreSQL (marshaling) and write to Elasticsearch
(indexing). I wanted to simulate a production dataset, so I created
100,000 dummy reports. Using the [Elasticsearch Rails
gem](https://github.com/elastic/elasticsearch-rails) it was very easy
to index my reports:

```
bundle exec rake environment elasticsearch:import:model CLASS='Report'
```

That task took about an hour to complete (or about 27 reports per
second). If we believe the 80/20 rule of thumb, that meant that about 48
minutes were spent marshaling data from PostgreSQL, and Elasticsearch
took 12 minutes to parse and index the reports.

But wait! Only one of the two available cores was busy during that time.
That's because the Rake task runs as a single process. It grabs a batch
of Reports (1,000 at a time by default), marshals them all into JSON
"documents" and sends them to Elasticsearch using the [bulk
API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html).

That lonely, idle processor core, twiddling its thumbs while its
neighbor is working so hard. Well, that core can now share in the fun
too:

```
bundle exec rake environment elasticsearch:ha:import \
NPROCS=2 CLASS='Report' BATCH=200
```

We wrote [some extensions to the basic Elasticsearch Rails
gem](https://github.com/18F/elasticsearch-rails-ha-gem) that can take
advantage of multiple cores. Now my 100,000 Reports can finish in 36
minutes (48/2 + 12) instead of 60. That increased speed is not without a
cost, though. Since we fork new processes instead of using threads, it
takes twice as much memory to run twice as fast. That's why I explicitly
set the BATCH size to be smaller than the default 1,000, so that the
memory used by each process is smaller.

We call these extensions "high availability" because this approach means
that re-indexing a production system can happen much faster, reducing
downtime for our users. We’re limited less by wall-clock time and more
by available cores and memory.

Zero downtime
-------------

We also included [a "staging"
feature](https://github.com/18F/elasticsearch-indexstager-gem), so that
when we re-index an entire system, we create the new index alongside the
existing index, and then "promote" the new index when it’s finished.

```
bundle exec rake environment elasticsearch:ha:stage \
elasticsearch:ha:promote NPROCS=2 CLASS='Report' BATCH=200
```

That means zero downtime for our users, and gives us the ability to
rollback the changes if we need to. In a production environment, where
there are already separate, dedicated servers for the database and
Elasticsearch, a single 8-core machine can churn through a re-indexing
task very quickly. That means, as a developer, I can spend more time
developing and less time waiting for the machine to do its work. Lovely.

Adding this to your project
---------------------------

If you’re already using Ruby on Rails and Elasticsearch, check out our
[replacement Rake
tasks](https://github.com/18F/elasticsearch-rails-ha-gem) for the
[Elasticsearch Rails
gem](https://github.com/elastic/elasticsearch-rails).

---
layout: post
title: "A new database testing utility"
image:
description: "rdbms-subsetter, a new utility from 18F's work for generating test databases"

authors:
 - catherine

tags:
- testing
- how we work
- open source
- developer
- culture
---
<p class="authors">
  by {% author catherine %}
</p>

If you test software that uses a database, 18F has
[a new tool for you](https://github.com/18F/rdbms-subsetter).

<!-- more -->

Much of our work at 18F involves writing APIs that expose
existing government databases.  New APIs demand good tests,
which demand good test databases -- small, yet
representative of production.  

So we've written a new utility,
[rdbms-subsetter](https://github.com/18F/rdbms-subsetter),
to automate extracting subsets of relational databases.
Populating the test database can be as simple as

    rdbms-subsetter postgresql://:@/proddb postgresql://:@/testdb 0.001

It should work against
[any database that SQLAlchemy supports](http://docs.sqlalchemy.org/en/rel_0_9/core/engines.html#supported-databases).
It guarantees referential integrity "upward" -- every child
record will have its required parent record.
It also makes efforts to fill in records "downward",
providing at least some child records for each parent record.  

As with any open source project, we welcome your
[bug reports, feature requests](https://github.com/18F/rdbms-subsetter/issues),
and code contributions.
Since we're 18F, filing any bugs you find --
and optionally writing tests for them, or even fixing them --
is not just encouraged, it's your patriotic duty.
(cue inspiring music)

For open-source enthusiasts, the potential to release work
as open-source projects is exciting and motivating.  At 18F,
our [Default to Open](https://github.com/18F/open-source-policy/)
policy means that releasing our work isn't a favor to beg
management for.  It's our everyday way of working --
no questions asked and no hoops to jump through -- and one
of the joys of being on the 18F team.

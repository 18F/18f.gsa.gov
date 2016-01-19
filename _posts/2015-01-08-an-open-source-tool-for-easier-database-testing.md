---
layout: post
title: "An open source tool for easier database testing"
date: 2015-01-13
image: /assets/blog/db-testing-tool/cut_sweater.jpg
description: "rdbms-subsetter, a new utility from 18F's work for generating test databases."
excerpt: "18F is dedicated to spreading modern software techniques like rigorous automated testing throughout the federal government; we want to showcase how solid testing enables rapid, high-quality development. When the product is based on a large relational database, this poses a dilemma: the full production dataset is too unwieldy to duplicate to the test and development environments."

authors:
 - catherine

tags:
- testing
- how we work
- open source
- developer
- culture


---
18F is dedicated to spreading modern software techniques like
rigorous automated testing throughout the federal government;
we want to showcase how solid testing enables rapid, high-quality
development.

When the product is based on a large relational database, this
poses a dilemma: the full production dataset is too unwieldy to
duplicate to the test and development environments.  Projects
are typically tested against small hand-written test databases
instead, but those simple constructs can't
duplicate the quirks and complexities of the production data set &#8212; and
the most subtle application bugs will only be revealed when
applied to those quirks.

Using a small subset of real production data is the ideal, but for
relational databases that's hard to accomplish &#8212; the mesh
of foreign key relationships between tables can make extracting a limited
yet valid subset of its tuples feel like trying to cut a little sweater
out of a big sweater without snipping any yarns.

![Don't break any yarns.](/assets/blog/db-testing-tool/cut_sweater.jpg)

So we've written a new utility,
[rdbms-subsetter](https://github.com/18F/rdbms-subsetter),
to automate extracting random yet relationally consistent
subsets of relational databases.
Populating a test database can be as simple as

```bash
rdbms-subsetter postgresql://:@/proddb postgresql://:@/testdb 0.001
```

![rdbms-subsetter in action](/assets/blog/db-testing-tool/subsetter.png)

It should work against
[any database that SQLAlchemy supports](http://docs.sqlalchemy.org/en/rel_0_9/core/engines.html#supported-databases).
It guarantees referential integrity "upward" &#8212; every child
record will have its required parent record.
It also fills records "downward,"
providing child records for each parent record &#8230; but within
limits (optionally tuned with `--children`) to avoid
requiring the entire production database.

Available options include:

<dl>
  <dt>--logarithmic</dt>
  <dd>Determine the desired number of rows logarithmically,
      so that a proportionally smaller number of rows is taken
      from larger tables.  Using <code>--logarithmic</code> with fractions
      between 0.3 to 0.5 seems to produce reasonable results.</dd>
  <dt>--children &lt;n&gt;</dt>
  <dd>set the number of child records per parent record to
      attempt to include (default 3)</dd>
  <dt>--force &lt;tablename:primary_key_val&gt;</dt>
  <dd>force rows of particular interest, with all their child
      and descendant records, into the test database</dd>
  <dt>--schema &lt;name&gt;</dt>
  <dd>Include this schema in the results (otherwise,
      only pulls rows from the connection's default schema)</dd>
</dl>

Like any open source project, we welcome your
[bug reports, feature requests](https://github.com/18F/rdbms-subsetter/issues),
and code contributions.
Since we're 18F, filing any bugs you find &#8212; and optionally writing tests for them, or even fixing them &#8212; is not just encouraged, it's downright patriotic.
_(cue inspiring music)_

For open source enthusiasts, the potential to release work
as open source projects is exciting and motivating.  At 18F,
our [Default to Open](https://github.com/18F/open-source-policy/)
policy means that releasing our work isn't a favor to beg
management for.  It's our everyday way of working &#8212; no questions asked and no hoops to jump through &#8212; and one
of the joys of being on the 18F team.


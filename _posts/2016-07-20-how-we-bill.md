---
title: "Why (and how) we bill: Cost recovery as a feature"
authors:
- vdavez
date: 2016-07-19
tags:
- how we work
- transparency
- rates and figures
excerpt: "18F is a 'cost recoverable' program. We do this by
charging the agencies and teams we partner with for our work. In this post, I explain why we bill, why billing is good for 18F overall, how we bill, and where we can still improve."
description: "18F is a 'cost recoverable' program. We do this by
charging the agencies and teams we partner with for our work. In this post, I explain why we bill, why billing is good for 18F overall, how we bill, and where we can still improve."
---

When I joined 18F last year, I quickly learned something that I didn't
expect coming in: We charge our partner agencies for our work. At first,
I was a bit put off by this reality. As someone who came from the legal
profession where most of my professional colleagues billed their time in
six-minute increments, having the *government* send an invoice to
another government customer seemed very much like a bug in the 18F
operations. But over time, I have grown to deeply appreciate this aspect
of 18F, and now consider it a feature, not a bug. In this post, I
explain why we bill, why billing is good for 18F overall, how we bill,
and where we can still improve.

## Why we bill

18F is funded out of the Acquisition Services Fund (ASF). The ASF is a
[revolving fund](http://www.gsa.gov/portal/content/200859) under the
direction and control of the Administrator of the General Services
Administration (GSA) and managed by GSA’s Commissioner of the Federal
Acquisition Service. As a revolving fund, the ASF must recover its costs
from customer agencies for the services provided and, as a practical
matter, that means 18F charges partner agencies for our work.

## Why billing is good for 18F

So, we bill other agencies because we _have_ to, but is it a good
thing? I've come to believe that it is a very good thing for several
reasons.

First, it requires us to be *service oriented*. We’re here on a demand
model: If we run out of customers in the government, we won’t exist. In
a world where you’re the only available option, the pressure to focus on
customer demands is much lower. But, when alternatives exist, you cannot
ignore the need to focus on the customer’s needs. In our case, in most
situations, 18F is not the only option. An agency could use in-house
resources, work with the U.S. Digital Service, or, in some cases, hire
contractors instead of 18F. To stay afloat, not only does 18F have to
deliver excellent value at a reasonable cost (more on that in a minute),
we have to be responsive to our partner agencies' needs.

Second, cost provides a useful design constraint. Every product has a
budget, whether it’s stated explicitly or not. A budget forces product
teams to make necessary decisions about tradeoffs. Because we’re cost
recoverable, we need to have hard conversations with our customers about
their project’s budget at the beginning of our engagement. It may be
uncomfortable at first, but it ultimately allows for future tradeoff
decisions to be more easily surfaced during the course of a project’s
development.

Third, it demands that we work on projects that our partner agencies
value. If a partner agency isn’t willing to plunk down some of its
scarce budgetary resources, then maybe the project’s not as important to
the agency as it claims. In economics, there is a concept of
"willingness to pay," which associates the value of a good or service
based on whether a customer will pay for the good or service. If someone
is willing to pay for something, it has value; if no one is willing to
pay, it doesn't. In practice, 18F projects have to follow this model. A
project may _seem_ important, but unless an agency is willing to pay
for it, we can't do it. The billing constraint therefore focuses our
work on projects that have clear value propositions, not just because we
want to do them. (Of course, the dollar value of our billing doesn't
measure the overall value we may provide in cost savings, cost avoidance
or other measurements of impact. We'll look at those in other posts.)

Finally, signing an interagency agreement at the outset of an engagement
ensures mutual understanding and sets everyone up for success.
Interagency agreements are not [*government
*](https://pages.18f.gov/partnership-playbook/)[*contracts*](https://pages.18f.gov/partnership-playbook/).
They reflect *mutual* agencies’ priorities and, in the case of 18F,
specify that we work in short, iterative sprints; that we require
intensive involvement from a single, responsible, empowered point of
contact at the partner agency; that we put users first throughout the
process; that we work [*in the
open*](https://github.com/18F/open-source-policy) absent extraordinary
circumstances; and that either party can terminate the agreement on 30
days’ notice. By the time we and our agency partners have signed on the
bottom line, everyone has been acculturated to [*how we
work*](https://18f.gsa.gov/tags/how-we-work/) and expectations are
properly aligned.

## How we bill

So, billing is necessary and good. But _how_ do we do it? Let’s start
by looking first to the expenditure side and then focus on the revenue
side.

Our expenditures come in two buckets: direct and indirect costs. The
first bucket — direct costs — are the amounts paid to 18F employees in
compensation and benefits, plus operational expenditures such as
computers, software, and other supplies. They represent about 75% of our
costs. The second bucket — indirect costs — are paid to GSA for shared
services like human resources and information technology, rent,
utilities, and security; these represent the remainder of 18F’s costs.
In fiscal year 2017, we’re projecting \$46,631,000 in total operating
expenditures.

On the other side of the ledger is revenue. Because 18F must recover
cost but not turn a profit, revenue should not exceed our costs. To
date, 18F has set per-hour rates based on a simple calculation:
projected total direct and indirect costs *divided* by the total
number of hours 18F employees are projected to work on projects for its
clients (often referred to in other settings as the “billable hour”).
From here, we assign different hourly rates to [each government pay
grade](https://pages.18f.gov/joining-18f/pay-grades) [that we estimate
will meet our cost recoverability goal for the fiscal
year.](https://pages.18f.gov/joining-18f/pay-grades)

## How we can improve

This billing methodology has been acceptable for 18F during its
relatively short existence. Like any feature, it could use some
[[*refactoring*](https://18f.gsa.gov/2015/11/17/choose-design-over-architecture/)](https://18f.gsa.gov/2015/11/17/choose-design-over-architecture/),
particularly because cost recovery is still years away and because
projecting our expenses and expected revenues is still a work in
progress.

But if there is one thing I love about 18F, it’s that acceptable is just
not good enough. A work in progress is an *opportunity* to improve. We
want to continuously improve, so that we can do an even better job
delivering for our partner agencies. In that regard, there are at least
two areas for improvement around how we bill.

The first area for improvement is our pricing model. Even though the
math for expenses divided by time is straightforward, like everything we
work on, the pricing model we have been using is constantly being
improved. In the coming months, we’ll be experimenting with different
pricing models, consistent with our legal authorities, for some of our
engagements to hopefully find better ways to align 18F's strengths with
its business model.

The second area for improvement relates to incremental and transaction
costs. From my perspective, one of the biggest opportunities for us to
keep our costs down without sacrificing quality is to reduce the
incremental and transactional costs associated with our services. In
software development terms, this means we should be promoting [DRY
(Don’t Repeat Yourself)
practices](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself). If
we spend an hour doing something, we want to make sure that no one else
has to spend an hour doing it. If we learn how to do something better,
we want to [make sure everyone else knows about
it](https://pages.18f.gov/guides/). We’re still a relatively new
organization, so we’re still learning. But as we mature, optimizing for
these costs will be a key opportunity for us to keep our cost as a low
as possible.

## Looking forward

Ultimately, the billable nature of 18F places constraints on what we
work on, but it also forces us to focus on delivering value to our
customers within government. On balance, it has been a remarkably good
thing for 18F, but as with anything, it can be improved. Fortunately,
because delivery is the strategy for 18F, our need to be cost
recoverable ensures that we’ll stay focused on continuing to improve how
we provide value for our partner agencies.

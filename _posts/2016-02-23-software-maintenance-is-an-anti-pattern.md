---
title: "Software maintenance is an anti-pattern"
date: 2016-02-23
authors:
- sarah
tags:
- agile
excerpt: "Governments often use two anti-patterns when sustaining software&#58;
equating the first release with complete and how they manage the reduction of staff when a reduction in budget is appropriate. To address the latter
anti-pattern, managers need to rethink how they approach spending their
operations and maintenance budget."
description: "Governments often use two anti-patterns when sustaining software&#58;
equating the first release with complete and how they manage the reduction of staff when a reduction in budget is appropriate. To address the latter
anti-pattern, managers need to rethink how they approach spending their
operations and maintenance budget."
image:
---

In his 1977 book “A Pattern Language: Towns, Buildings, Construction”,
Christopher Alexander defined ways to architect physical spaces to
enhance and support how people interact. This concept was very
influential in software development, leading to the popularization of
software *design patterns*, which identified ways in which we construct
software that are mostly independent of a programming language. These
are patterns of how software components behave and interact — ways to
effectively solve common problems.

This book also inspired the idea of an *anti-pattern,* which is a common
response to a problem that appears to solve the issue, but is actually
ineffective and even counterproductive. This term has grown to include
social patterns of human interaction, as well as software patterns.

Software maintenance is the common practice where, after a software
project is “complete,” a small, often part-time team or a single
developer ensures critical upgrades and fixes serious bugs, with limited
improvements, as time allows. This is commonly referred to as Operations
& Maintenance, or by its acronym, O&M. Software is never complete in its
first release, so devoting ongoing staff to sustain a piece of software
is a necessary practice. However, at some point, when the audience for a
particular piece of software is no longer growing, it’s appropriate to
reduce staff devoted to sustaining a software project.

Governments often use two anti-patterns when sustaining software:
equating the "first release" with "complete" and moving to reduce
sustaining staff too early; and how a reduction of staff is managed when
a reduction in budget is appropriate. To address the latter
anti-pattern, managers need to rethink how they approach spending their
O&M budget.

What happens in private industry?
---------------------------------

In the software industry, software is not considered complete when it’s
first released. The first release is the very beginning of the journey.
In successful software projects, the first version is always released
with open issues, deferred features, and a roadmap (or at least ideas)
of how it can and should be improved in the future. The team will
immediately start developing new features and fixing bugs and typically
will get *larger* over time, not smaller. Investing more to increase the
size of the team is justified in the private sector since companies will
remain focused on a growing market with growing revenue.

When the market stops growing and becomes saturated or declines and
revenues decrease, the investment in the software will be reduced to be
as small as possible. There’s an awareness that the software is on life
support, expected to die a slow death as customers become increasingly
dissatisfied.

Maintenance invites technical debt
----------------------------------

When a maintenance team is staffed with a skeleton crew, the team does
not have the time or authority to do user research or validate that
software is effectively meeting the needs of users. Instead, a support
team queues up a list of issues that are ranked based on negative
impact. The impact is typically assessed by the level of complaints and
measured by the expense of staffing the customer support line. It’s
assumed that “fixing” the bug will lead to a lower volume of complaints.

We know from experience that a complaint is often the tip of the
iceberg, reporting a symptom rather than the cause. When software is in
active development, we might look at a collection of a dozen bugs and
realize that altering the design of the feature will be a less expensive
approach and lead to increased customer productivity and ease of use.
Fixing any one or two bugs can seem like the right solution in the
short-term, but often doesn’t actually lead to a decrease in customer
complaints, or worse, can lead to the “whack a mole” phenomenon when a
developer will fix one bug only to cause another to pop up.

The software is then allowed to grow old until a full rewrite or
replacement is needed.

**It’s precisely this model of maintenance that has created the negative
legacy of government software systems we face today.**

A different model of software operations
----------------------------------------

Government software is different. There’s no profit motive. The market
is fixed (or fluctuates slowly with population or employment changes).
We need a model where we can create software that thrives when the
number of users and usage remains constant. We need to be able to reduce
costs when the software meets the needs of the people it serves, yet
detect when changes are needed.

To create a new, productive pattern, we’ll still need monitoring that
detects signs of trouble that could lead to outages, and to keep up with
regular software upgrades for security concerns. However, we need to
take a completely different approach to bug reports and customer
complaints.

To keep teams from constantly plugging leaks while missing the reason
the boat is sinking, we need to apply the principles of agile
development and user centered design to how we work on software after
the initial release. Instead of a small team working constantly to fix
small bugs, an entire team should work in bursts of activity. A team
might work on a few software projects focusing on a different project
each quarter, depending on the data.

The key point is that a full cross-disciplinary team would devote its
complete attention to the software for a sustained interval. Periodic
discovery activities would be followed by a burst of implementation,
then validation.

The discovery activities could take place once per year or every six
months or could be triggered by a significant change in system health or
usage metrics. The team would look at:

-   **User need.** Who is using the product? Are they the same target user? Who is not using the product who might find it useful? What other products or services are they using?
-   **Competitive analysis.** What exists in the marketplace that is similar to our solution? If there’s a clear competitor with market traction and a great user experience, the team should perform a cost analysis and if comparable with current costs, consider buying the solution.
-   **Usability test** with a sampling of current users
-   **Triage the backlog** of customer complaints, bug reports, and system health indicators — cross-reference with the results of usability tests and usage metrics. Make recommendation of key improvements and changes that would address underlying issues. Prioritize critical concerns.
-   **Net Promoter Score** or other happiness metric to evaluate effectiveness of the software solution

Potential impact
----------------

We don’t know if this new approach will be successful, but we do know
that the old approaches don’t work. We need alternate techniques to
sustain software services at moderate budget levels so that we don’t
simply re-create the failures of the past when digital services that
meet the needs of today slowly become obsolete as the world changes
around us.

This is particularly important as the pace of change is increasing,
along with the interconnectedness of new government services that are
increasingly delivered as web applications. In the ‘70s and ‘80s, we
could build software that would essentially function as designed for
5-10 years. In the 90s, with the growth of the web and changes in how
people use technology, that timeframe narrowed to 3-5 years. Now web
applications need more frequent updates. As we move from a paper-based
society to one that is increasingly connected and as our population
increasingly relies on mobile devices and online services for their
routine needs, we’ll need to make periodic improvements to keep our
services relevant and up to date.

There will always be some software systems that need a dedicated team
focused on continuous improvement. However, we also anticipate that
government will always have a need for software systems that serve a
stable audience of users with needs that might not change in a year,
though they will change at some point, and we need to notice and respond
to that change.

The potential impact of this kind of model will be to continue to reduce
costs while delivering higher value to the people who use our services.
If you see your agency follow this anti-pattern for O&M, talk to [our
transformation services team](mailto:inquiries18f@gsa.gov) about
helping to change how you sustain software.

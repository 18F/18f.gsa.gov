---
title: "Aiming for obsolescence: Lessons from an 18F product transition"
date: 2018-05-01
authors:
- alex-pandel
- ryan-johnson
tags:
- agency work
- useiti
- how we work
- lessons learned
excerpt: "Four years into 18F’s work, transition is a topic of frequent conversation among our team. Every organization and every project is different. At the same time, every transition offers lessons that can be applied to the next."
image: "/assets/blog/product-transition/product-transition.jpg"
---

*Alex Pandel is a design and product strategist at 18F, and Ryan Johnson
is a content strategist at the Department of the Interior’s Office of
Natural Resources Revenue.*

Rewind to July 2014: 18F was embarking on one of its earliest partner
engagements with the Department of the Interior’s Office of Natural
Resources Revenue (ONRR). ONRR sought to build an [interactive, open data
site](https://revenuedata.doi.gov/) to support the department’s participation in the [Extractive
Industries Transparency Initiative](https://eiti.org/) (EITI). The
project served as an early model for 18F’s style of collaboratively
building digital products
[*with not for*](https://medium.com/organizer-sandbox/building-technology-with-not-for-communities-an-engagement-guide-for-civic-tech-b8880982e65a)
our partner agencies and their constituents, and we’ve been blogging
about the site and our partnership
with ONRR since the work began.

Now fast-forward to today: the ONRR team is fully in the driver’s seat
on the project, continuing to [work in the
open](https://github.com/18F/doi-extractives-data/) and evolve the site
iteratively in response to user needs, and the 18F team is getting ready
to roll off the project entirely.

So, how exactly did we get here?

## The anatomy of an inter-agency product handoff

### We hired a cross-functional team.

In order to continue evolving to meet user needs, any website or digital
service needs a small but dedicated team to sustain and evolve it over
time. Once the end of 18F’s involvement in the project was in sight, we
knew there were three options to ensure ONRR had the team they needed in
the long-term: 1) train existing staff into new roles; 2) hire new
in-house staff; or 3) bring on contractor support.

In this case, 18F assisted ONRR in hiring three new, term-limited
roles to support the site, modeled loosely after the roles of the 18F
team: a content strategist, a front-end developer, and a user experience
designer. With help from 18F’s Talent Team, we identified candidates,
led the first round of interviews, and recommended candidates to ONRR
leadership for final interviews and hiring.

### We trained and coached existing team members into new roles.

The 18F team also worked with existing ONRR staff to ensure core team
members felt empowered to continue work on the site on their own. This
included **coaching one of the existing ONRR team members into the
product manager role** (leveraging [a training
approach](https://github.com/18F/product-training/wiki) established by
some of our 18F colleagues, [adapted for the ONRR
team](https://github.com/18F/doi-extractives-data/wiki/Product-management-training)).

To identify the roles the existing ONRR team members would step into and
the training and support that would be needed to get them there, we got
together in DC for an in-person workshop (like much of 18F, the ONRR
team works remotely). To start, the 18F team spelled out all of the
responsibilities we’d needed to run the site successfully thus far. We
then asked the ONRR team to **identify which responsibilities they’d
each be open to taking on** once the 18F team was gone in a few months
and once their new term-limited counterparts were gone in a few years.
This helped identify both near-term and longer-term training needs.

**For each new skill or piece of the workflow, 18F took a phased
approach**, gradually increasing ONRR’s level of responsibility until
18F was no longer needed. Taking the data update process as an example,
the 18F team started by demonstrating how the process works so the ONRR
folks could get familiar with all the moving parts before diving in
themselves. Then we moved on to pairing, where the ONRR folks were
running the show, but with 18F there to answer questions or troubleshoot
any issues. Before we considered the data update process “transitioned,”
we wanted the ONRR folks to complete a successful data update on their
own — without needing any help from 18F.

###  We transferred knowledge via pairing and documentation.

Since we were transitioning a workflow and codebase from 18F’s
development environment to DOI’s, we expected some issues to arise, and
sure enough, they did. For example, part of the data update script
assumed a macOS/Linux development environment, while the ONRR team was
running Windows.

Thankfully, we built enough time into the transition to accommodate
bottlenecks in the workflow and allow us to mitigate obstacles while
maintaining momentum. While challenging, **each bottleneck we
encountered presented some unexpected benefits:**

-   We made sure to pair together on mitigating each issue, which presented good opportunities to help onboard new ONRR team members to the codebase.
-   Mitigating these issues helped us identify a few gaps in the documentation that we filled in as we went, leaving the project in a more solid place than when we started.

### We revisited the product vision.

Early on in the transition, the U.S. withdrew from implementing the
EITI
Standard,
but Interior and ONRR remain strong supporters of good governance and
the principles of transparency represented by the EITI and are fully
committed to keeping this data open and available. With the site no
longer governed by USEITI’s [Multi-Stakeholder
Group](https://www.doi.gov/eiti/FACA), this shift ultimately
represented **a great opportunity for the ONRR team to take the lead on
revisiting [the vision and goals of the
site](https://github.com/18F/doi-extractives-data/wiki/Product-framing)**
with a newfound sense of full product ownership.

Taking this step to clearly and candidly articulate what we were trying
to achieve, what was feasible, and the risks we might confront along the
way was crucial to give the team a framework by which to prioritize
future work. The team conducted a round of user research to test our
assumptions and inform the [key user
scenarios](https://github.com/18F/doi-extractives-data/wiki/Product-framing#key-scenarios)
we’d support moving forward. We expect these priorities to continue to
evolve over time in response to changing user needs.

## Lessons learned

Although we’re still in the process of transition, we’ve identified some
important lessons learned thus far:

-   **Build in several months of explicitly transition-related work before you expect any “handoff” to happen.** It was important for us to give team members time to build confidence as they took on new, unfamiliar responsibilities and transitioned into new roles, as well as account for unexpected curveballs that no amount of careful planning will help you foresee. This work doesn’t happen overnight. Explicitly build it into your statement of work or work plan if you can.
-   **Establish a clear, shared definition among all stakeholders of what constitutes a successful transition.** Just like our product goals, 18F and ONRR worked together to [establish clear transition goals](https://github.com/18F/doi-extractives-data/wiki/Transition-goals) as well. This ended up being a vital step in helping us prioritize transition work and stay aligned towards the same goals.
-   **Recruit and train a product manager from within the existing team (rather than hiring this role out) if you can.** While it may feel like more work to train a member of the agency team into a new role versus hiring a contractor or bringing on a new, experienced team member, [18F has seen how much it pays off to keep this role in-house](https://github.com/18F/transformation-research/blob/master/preliminary-report.md#selecting-mid-senior-long-tenured-agency-staff-as-leaders). Thanks to her deep knowledge of the subject matter and her agency, the ONRR product manager has been able to steer the team toward the highest-impact work and advocate for the team in a way that would be significantly harder from someone coming from outside the organization.
-   **Take it one step at a time.** Moving into entirely new roles can be overwhelming. Take it slow to make time for team members to build familiarity with new skills and responsibilities (and figure out how to make space for it within existing responsibilities).
-   **Continually work to build bridges across the entire organization and bring everyone along.** Working iteratively [in an open forum](https://github.com/18F/doi-extractives-data) was a new way of working for many at ONRR, and it tested the IT infrastructure and practices of the organization. While we did significant work to identify product stakeholders at ONRR, we faced some challenges caused (in part) by a lack of buy-in around our process and development needs. If we could do it again, we’d integrate a wider range of stakeholders earlier on in the project to ensure anyone who had the ability to influence the project was brought along from the start.
-   **Build with transition in mind.** We realized in the course of transition that portions of the development workflow — while entirely open source — were not as cross-platform as they could have been. We’re still identifying work-arounds and options to translate this part of the workflow to the ONRR environment, but planning for this early could have minimized some headaches down the line.

## Every transition is different

Four years into 18F’s work, transition is a topic of frequent
conversation among our team. Every organization and every project is
different. Consequently, there’s no single formula for a successful
transition. Evolving goals, varying organizational structures, fluid
teams, and advancing technology all play a part in determining what a
successful transition looks like.

At the same time, every transition offers lessons that can be applied to
the next. Every time we transition a product, we get better at
anticipating and mitigating challenges, and we think about transition
earlier and more often in the initial development process.

We’ll continue to share lessons learned from this transition and others.

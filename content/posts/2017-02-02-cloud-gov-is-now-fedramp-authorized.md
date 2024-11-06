---
title: cloud.gov is now FedRAMP Authorized for use by federal agencies
layout: post
authors:
- britta-gustafson
- jameshupp
- bret
- will
tags:
- cloud.gov
- platforms
- tools you can use
- devops
excerpt: We’re delighted to announce that cloud.gov is now FedRAMP Authorized, which enables agencies to quickly transition their web-based services to efficient and easy-to-use cloud hosting. FedRAMP Authorized status marks completion of a comprehensive security and compliance assessment that enables federal agencies to start using cloud.gov with significantly reduced effort. cloud.gov is a government-customized hosting platform that takes care of technical infrastructure and security compliance requirements.
description: what
hero: false
---

<figure class="blog-figure-center tile-strip">
  {% image "assets/blog/cloud-gov/logo-badge.png" "The cloud.gov logo" %}
  {% image "assets/blog/cloud-gov/fedramp-badge.jpg" "The fed ramp logo" %}
  {% image "assets/blog/cloud-gov/fedramp-ready.png" "The fed ramp ready indicator" %}
</figure>

We’re delighted to announce that [cloud.gov](https://cloud.gov/) is
now [FedRAMP](https://www.fedramp.gov/about-us/about/) Authorized,
which enables agencies to quickly transition their web-based services to
efficient and easy-to-use cloud hosting. FedRAMP Authorized status marks
completion of a comprehensive security and compliance assessment that
enables federal agencies to start using cloud.gov with significantly
reduced effort. cloud.gov is a government-customized hosting platform
that takes care of technical infrastructure and security compliance
requirements.

Now that cloud.gov has FedRAMP Authorized status, teams can start using
cloud.gov in production with less upfront work, and using cloud.gov in
turn enables them to deliver services faster. In this post, we’re going
to explain more about what this means — and if you’re part of a team
interested in using cloud.gov, [we’d like to hear from you](https://cloud.gov/#contact)!

## What is cloud.gov?

cloud.gov gives federal agencies a fast and easy way to host and update
websites (and other web applications, such as APIs), so their employees
and contractors can focus on their missions instead of wrangling the
infrastructure and compliance requirements common to federal systems.
For all the details about how cloud.gov works, including our
fully-public technical documentation for users, see [the cloud.gov
website](https://cloud.gov/). We’ll also explain more below, including
how cloud.gov handles the majority of compliance requirements for
customers.

## How FedRAMP helps federal agencies use cloud.gov

Many agencies are interested in using cloud.gov, and historically each
agency would have to conduct their own in-depth review of cloud.gov’s
security and compliance before allowing their teams to use it. This is
important but labor-intensive work that can make it hard for agencies to
invest in trying a cloud service, even if they expect it will be useful.

FedRAMP (the [Federal Risk and Authorization Management
Program](https://www.fedramp.gov/)) solves this shared problem. FedRAMP
coordinates a [Joint Authorization Board
(JAB)](https://www.gsa.gov/portal/content/134223) made up of the three
Chief Information Officers of the Department of Defense, the Department
of Homeland Security, and the General Services Administration. Together,
they and their teams assess cloud services using rigorous standards, and
if the cloud service satisfies the requirements, they all endorse a
[Provisional Authority to Operate
(P-ATO)](https://www.fedramp.gov/resources/faqs/what-is-a-fedramp-provisional-authorization/).
Then, any federal agency can [leverage this
P-ATO](https://www.fedramp.gov/resources/faqs/how-does-an-agency-leverage-a-fedramp-authorization/)
(which comes with detailed security documentation from the cloud
service) instead of needing to do all their own independent research.

cloud.gov has received a JAB P-ATO at the Moderate impact level.
(Federal systems are categorized as [Low, Moderate, or High impact](http://csrc.nist.gov/publications/fips/fips199/FIPS-PUB-199-final.pdf#page=6), so
this means agencies can easily use cloud.gov to host Low and Moderate
systems, which are the majority of federal systems.) When an agency
accepts this P-ATO, teams at that agency can leverage the P-ATO for the
systems they build. Because cloud.gov takes care of a substantial number
of compliance requirements for federal systems, each new system built on
cloud.gov has a radically shortened path to achieving Authority to
Operate from their agency. In other words: teams can develop and deploy
new and updated web applications *much faster,* supporting agile
delivery.

## How cloud.gov helps your team achieve its mission

cloud.gov is for teams that build and deliver websites (and other
web-based applications) as part of their work — for example, an agency
homepage, an open data API, or an internal information management tool.
Your development team sets up the application on cloud.gov, and
cloud.gov handles the security, maintenance, and compliance of the
underlying platform. Here’s what that looks like:

{% image "assets/blog/cloud-gov/intro-diagram.svg" "" %}
<div class="usa-sr-only">
<p>You set up and maintain your web application code.</p>
<p>You can run your application on the programming language stacks that cloud.gov maintains. Or you can run it on a custom programming language stack that you maintain.</p>
<p>Your application can user services cloud.gov provides including storage, databases, and CDN services. You can also create and use your own services to meet any special requirements.</p>
<p>The cloud.gov team maintains the security and availability of the platform. We update the operating systems, monitor the platform, and log everything.</p>
<p>This runs on top of Amazon Web Services (GovCloud), which provisions and maintains the hardware.</p>
</div>

This means your team can focus on your unique code instead of managing
infrastructure, which reduces the amount of technical work you have to
do. And as explained above, cloud.gov substantially reduces the work and
time required to get Authority to Operate from your agency for your
system. You only need to prove compliance for your applications. Out of
the 325 security controls required for Moderate-impact systems,
cloud.gov handles 269 controls, and 41 controls are a shared
responsibility (where cloud.gov provides part of the requirement, and
your applications provide the rest). You only need to provide full
implementations for the remaining 15 controls, such as ensuring you make
data backups and using reliable DNS (Domain Name System) name servers
for your websites.

{% image "assets/blog/cloud-gov/cloud-gov-chart.svg" "A bar chart showing the portion of security controls handled by customers, cloud.gov, and shared between the two." %}

cloud.gov is also a building block for vendors and contractors that
supply services to federal agencies. They can submit proposals to
agencies for services to be built on top of cloud.gov, which benefit
from these reduced technical and compliance burdens.

We hope that successful use of cloud.gov helps agencies grow more
comfortable and familiar with cloud technology, enabling deeper
partnerships with both industry cloud providers as well as vendors and
contractors that prefer to build using cloud platforms.

## A few of the improvements we made along the way

We [first announced cloud.gov in May
2015]({{ "/2015/05/08/layering-innovation/" | url }}) after two
months of adapting the open source [Cloud
Foundry](https://www.cloudfoundry.org/) project for 18F’s needs. Since
then, we’ve been building cloud.gov with FedRAMP Authorization in mind,
while using it under our own agency authorization. We began preparing
for the FedRAMP process in March 2016 (the date we engaged our Third
Party Assessment Organization), and we established FedRAMP Ready status
in May 2016. [We set an ambitious goal of achieving FedRAMP
Authorization in six
months]({{ "/2016/07/18/cloud-gov-full-steam-ahead-fedramp-assessment-process/" | url }}),
using the new [FedRAMP
Accelerated](https://www.fedramp.gov/participate/fedramp-accelerated-process/)
process.

The FedRAMP assessment process is thorough! As part of our work to
precisely document how we fulfilled all the requirements (with the help
of [an accredited Third Party Assessment
Organization](https://www.fedramp.gov/participate/assessors/),
[Veris](https://www.verisgroup.com/), that audited our work), we
needed to further improve technical and operational aspects of
cloud.gov. We added more monitoring and alerting, developed and ran
additional team trainings, wrote checklists and automated scripts to
make processes consistent and repeatable, formalized many team policies
and procedures in writing, and much more.

We officially began our review with the JAB teams in August 2016, and we
achieved the FedRAMP Authorization less than six months after the
reviews began (January 2017), which is in line with [FedRAMP’s
estimates](https://www.fedramp.gov/participate/fedramp-accelerated-process/)
for the FedRAMP Accelerated process. This is a success for the FedRAMP
team, which has been carefully improving their process to help make more
cloud services available to government teams. We appreciate the work of
the FedRAMP Program Management Office, who guided us through each step
of the process.

## Learn more

Over the next few months, we’ll explain more about cloud.gov, give
examples of live federal systems built on cloud.gov, and share lessons
we’ve learned to help other cloud service providers go through the
FedRAMP process. cloud.gov is the first completely [open
source](https://github.com/18F/open-source-policy/blob/master/policy.md)
service with FedRAMP Authorization, and we’ll write more about our open
source work ([you’re invited to reuse and contribute to
it](https://cloud.gov/docs/ops/repos/)). If you’d like to get these
updates, [sign up for the cloud.gov mailing list](https://cloud.gov/#updates).

If you’re interested in using cloud.gov, we invite you to [get in touch
with us](https://cloud.gov/#contact) and [learn more on our website](https://cloud.gov/overview/),
including how agency teams can try out cloud.gov for free. If you’d like
to see our P-ATO documentation package, you can [request it from
FedRAMP](https://www.fedramp.gov/).

If you’re part of a vendor or contractor interested in using cloud.gov,
ask your agency partners to evaluate this option.

For press inquiries, email [press@gsa.gov](mailto:press@gsa.gov).

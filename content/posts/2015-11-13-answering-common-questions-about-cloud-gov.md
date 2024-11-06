---
title: "Answering common questions about cloud.gov"
date: 2015-11-13
authors:
- bret
tags:
- devops
- platforms
- video
- cloud.gov
- best practices
- security

description: "Four weeks ago, we announced cloud.gov, a new platform that will enable small federal teams to rapidly develop and deploy web services with best-practice, production-level security and scalability. Currently, we’re running a small pilot program to prepare to open up cloud.gov to all federal agencies. In the meantime, we’d like to lay out some more details about the project and answer some common questions."
excerpt: "Four weeks ago, we announced cloud.gov, a new platform that will enable small federal teams to rapidly develop and deploy web services with best-practice, production-level security and scalability. Currently, we’re running a small pilot program to prepare to open up cloud.gov to all federal agencies. In the meantime, we’d like to lay out some more details about the project and answer some common questions."
image: /assets/blog/cloud-gov/cloud-gov-homepage.jpg
---

Four weeks ago, we [announced cloud.gov]({{ "/2015/10/09/cloud-gov-launch/" | url }}), a new
platform that will enable small federal teams to rapidly develop and
deploy web services with best-practice, production-level security and
scalability. The platform will also help agencies reduce the work
required to comply with federal security regulations.

Currently, we’re running a small pilot program to prepare to open up
[cloud.gov](https://cloud.gov) to all federal agencies. In the
meantime, we’d like to lay out some more details about the project and
answer some of the most common questions since we announced cloud.gov.

## What is included in cloud.gov?

cloud.gov includes a Platform-as-a-Service (PaaS) specifically built for
government, based on the open source [Cloud
Foundry](https://www.cloudfoundry.org/). It provides a secure, scalable
platform for teams to build and host their application or website. It
can help development teams work faster and cheaper by handling much of
their deployment complexity.

cloud.gov also includes an open source product called [**Compliance
Masonry**](https://github.com/18F/compliance-masonry). Compliance Masonry
assists in assembling the documentation necessary for federal services
to comply with Federal Information Security Management Act (FISMA)
standards and agency-specific Authority to Operate (ATO) requirements.
We’re using Compliance Masonry to gain the ATO for cloud.gov itself, and
will provide our materials in a form that will greatly reduce the staff
time required to prepare the ATO documentation for any app deployed on
cloud.gov. We will expand Compliance Masonry’s role to support continuing
assurance for deployed applications.

## Tell me more about the Platform-as-a-Service concept

Here’s a presentation that explains how cloud.gov’s PaaS can help free
your staff to spend more time conquering problems that are unique to
your agency and less time on regulatory compliance.

{{ "https://www.youtube-nocookie.com/embed/nCycNkxs-rE" | embed: "Cloud.gov: do more with less" }}

## Why would an agency want to use cloud.gov?

Hosting applications in the cloud does not automatically solve all the
infrastructure problems that agencies face. It eliminates a lot of the
concerns around managing data centers, but exposes the need for a new
cloud operations skillset that is not yet widely available in
government. The cloud.gov platform bundles up the skills of 18F’s
operations experts and offers them as a package to federal agencies.
Using cloud.gov will help you **improve your security** and **ease the
federal compliance process**.

## How does cloud.gov improve security?

cloud.gov deploys all apps on a hardened operating system image that is
tightly audited for compliance with federal standards. We regularly scan
and audit the platform itself as well as applications running on it for
vulnerabilities. We apply security updates to the underlying software
stacks on a regular basis without interrupting application availability.
The cloud.gov deployment itself is publicly documented and subject to
scrutiny from all corners. Improvements in cloud.gov result in improved
security for all apps running on top of it.

## How does cloud.gov ease the federal compliance process?

A typical agency process to demonstrate compliance with FISMA and gain
an ATO requires generation of a gigantic, copy-pasted document
enumerating the full design of the system. We document all of the
federally-required controls in every section of the cloud.gov platform
in a **software-friendly way**. This enables us to generate different
documents suitable to different contexts: human-readable, gap analysis,
spreadsheet matrix, web page visualization, etc.

Any app deployed on cloud.gov will be able to leverage these
“parts-included” descriptions to make generating their own documentation
much easier; they only need to supply information about what their
system adds on top of the PaaS. For more information, you can watch the
recent DigitalGov University video on “[Handling FISMA Faster and
Better](https://www.youtube.com/watch?v=T1S52B1-NT4).”

## Is cloud.gov covered under FedRAMP?

cloud.gov itself it not yet covered under FedRAMP, though all of our
activity is aimed at getting it there. However, cloud.gov is riding on
top of Amazon Web Services (AWS) for the infrastructure level, which is
covered by FedRAMP. The actual machine image we deploy onto AWS is based
on the image from the [FISMA-Ready project](https://github.com/fisma-ready),
which captures best-practice hardened configurations of open source
software.

Currently cloud.gov is in the Lightweight ATO stage, and will be
progressing from there to full ATO. We can not currently host FISMA High
applications on cloud.gov, but we will develop that capability if
warranted by our future research.

## What kinds of applications can be deployed on cloud.gov?

cloud.gov provides support for deploying applications written in Go,
Java, Node, PHP, Python, and Ruby, as well as custom binaries and static
websites. In general, any open source or custom-developed software is
suitable for deployment on cloud.gov. When the deployed application
needs a database, cache, message queue, or similar commodity component,
agencies can spin one up in their environment with a single command and
have it ready for their application’s use in seconds.

## How does a team actually use cloud.gov?

cloud.gov can be used via web interface or command-line interface. The
command-line interface is well-suited for scripting repetitive
deployment processes. cloud.gov also exposes the Cloud Foundry API,
which can help you incorporate cloud.gov into custom deployment tools or
pipelines.

## How does 18F charge for these services?

Agencies can pay for cloud.gov through an Inter-Agency Agreement (IAA)
with 18F, either as an offshoot of an active project where 18F is
handling development and design work or via a new IAA explicitly for
supporting their own team’s delivery activities.

There is a flat fee for 12 months which allows us to provide dedicated
resources for onboarding, administration, documentation, and expansion
of the service and tools. In addition, there are consumption-based
service fees that we charge for the resources used by an agency’s
particular application and any services we manage on their behalf.

## Can my agency use cloud.gov as a sandbox for trying new software?

We’ve heard loud and clear that agencies would like to demo new software
or host applications for internal teams with cloud.gov even when they
don’t plan to deploy production applications on it that require a full
ATO or aren’t ready to enter into an IAA with 18F. We’re investigating
models that would make this possible without leaving 18F holding the
bill for everyone’s usage.

## How can I get access to cloud.gov?

Right now, we’re running a small pilot program. If you’re interested in
gaining access, please [provide your email address here](https://cloud.gov/#contact), as we will be expanding access over time.

Please feel welcome to come by our [#devops-public Slack
channel](https://chat.18f.gov/?channel=devops-public) to chat with the cloud.gov team!

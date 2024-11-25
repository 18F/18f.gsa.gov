---
title: "cloud.gov is full steam ahead on its FedRAMP assessment process"
authors:
- bret
- diego
- britta-gustafson
tags:
- cloud.gov
- platforms
- devops
excerpt: "Here at 18F on the cloud.gov team, we’re working toward getting cloud.gov assessed as FedRAMP compliant, with lots of interesting progress — so here’s an update, including our FedRAMP Ready status!"
description: "Here at 18F on the cloud.gov team, we’re working toward getting cloud.gov assessed as FedRAMP compliant, with lots of interesting progress — so here’s an update, including our FedRAMP Ready status!"
image: /assets/blog/cloud-gov/ship-going-fast.jpg
image_figcaption: <a href="https://18f.gsa.gov/2015/10/09/cloud-gov-launch/">To always be shipping, you need a shipyard.</a> Image courtesy of the <a href="https://www.flickr.com/photos/usnavy/8428935049/">U.S. Navy / Public domain</a>
---

Here at 18F on the [cloud.gov](https://cloud.gov/) team, we’re working toward getting cloud.gov assessed as [FedRAMP](https://www.fedramp.gov/) compliant, with lots of interesting progress — so here’s an update, including our [FedRAMP Ready](https://marketplace.fedramp.gov/#/product/18f-cloudgov?sort=productName&productNameSearch=18f) status!

The story so far: We’ve built a government-customized cloud services platform with security at its heart, to help federal agencies ship digital services rapidly and in compliance with federal regulations. Now we’re documenting our security practices by going through the [FedRAMP evaluation process](https://www.fedramp.gov/about-us/about/), which is a government-wide program that assesses cloud service providers in a standardized way. Getting Provisional Authority to Operate (P-ATO) from FedRAMP’s Joint Authorization Board (JAB) will mean that all agencies will be able to confidently authorize use of cloud.gov without each agency needing to put cloud.gov through its own lengthy evaluation process.

cloud.gov recently received [FedRAMP Ready](https://marketplace.fedramp.gov/#/product/18f-cloudgov?sort=productName&productNameSearch=18f) status, which means we passed a preliminary evaluation and are now working on the full FedRAMP evaluation. The full process takes several months of work by all sides, so the preliminary readiness evaluation is an important way to give a provider quick feedback (and an opportunity to step back if it’s not ready yet). We’re continuing with this process, and **we expect to receive FedRAMP Joint Authorization Board Provisional Authority to Operate in November.**

A little more about what cloud.gov does
---------------------------------------

cloud.gov gives teams working for the federal government a secure and compliant foundation on which to build and release products and updates quickly. It’s a “Platform as a Service” that handles shared technical and policy requirements common to all federal government systems. It runs on industry-provided infrastructure (currently Amazon Web Services), where it provides a government-customized middle layer to support agency teams who can focus on running the custom application code that delivers their agency’s services.

18F is building cloud.gov as a cost-recoverable service funded by charging a fee to teams that use it. Teams at 18F use cloud.gov for our work with our agency partners. If you’re curious to learn more, see the [cloud.gov website](https://cloud.gov/), [previous blog posts]({{ "/tags/cloud-gov/" | url }}), and [documentation with technical details](https://docs.cloud.gov/intro/overview/what-is-cloudgov/).

Next steps in our FedRAMP progress
----------------------------------

[Our FedRAMP status page](https://marketplace.fedramp.gov/#/product/18f-cloudgov?sort=productName&productNameSearch=18f) has some notes about our next steps, and here are more details about the two big categories our work falls into right now:

**Improvements:** Some of this is technical work (such as moving our systems to [AWS GovCloud](https://aws.amazon.com/govcloud-us/)), and some of it is articulating our team policies and practices (such as expanding our [security incident response plan](https://docs.cloud.gov/ops/security-ir/)).

**Documentation:** As part of the compliance process, we’re extensively documenting how we satisfy all of the federal requirements for security measures, team member training, and other technical and human aspects of running a platform. We’re using our [Compliance Masonry](https://github.com/opencontrol/compliance-masonry) tool so that we can [collaborate on required documentation in a structured way](https://github.com/18F/cg-compliance) rather than wrangling a multi-hundred-page Word document. This also means that these documentation components are easily reusable as part of compliance documentation for individual agency services running on top of cloud.gov.

We’re using as much automation as possible throughout all of these compliance steps. Automation makes this labor-intensive process more efficient for ourselves, but we also have a second important reason: we’re automating (and open sourcing) our work so that our compliance work is reusable by anyone else who needs to go through this process, including agency teams and industry vendors.

[Watch a recent presentation from part of the cloud.gov team to learn more about some of the work we’ve done to get here.](https://www.youtube-nocookie.com/embed/UwOG3BrdODo)

{% comment %}{{ "https://www.youtube-nocookie.com/embed/UwOG3BrdODo" | embed: "Running Cloud Foundry in a Compliance and Security Focused Environment" }}{% endcomment %}

If you’re interested in cloud.gov
---------------------------------

We built cloud.gov to help 18F teams work faster with fewer barriers, and we want to help many fellow federal digital teams use it too, so that we can all serve the needs of the public better.

If you’d like to get updates about cloud.gov, sign up for [our email newsletter](https://cloud.gov/#contact). This includes news about our FedRAMP progress, so if you’d like to hear when we receive FedRAMP Joint Authorization Board Provisional Authority to Operate (estimated to happen in November), put your email address in!

If you’re part of a federal agency team and you’re curious to get a sandbox account to try out cloud.gov, send us a note at [cloud-gov-inquiries@gsa.gov](mailto:cloud-gov-inquiries@gsa.gov).

You can also help with cloud.gov as a volunteer open source contributor. cloud.gov is made of many open source sub-projects with code, documentation, and design that would benefit from external suggestions and fixes. For example, if you’re interested in working on something, you can comment on issues in any of [our repositories](https://docs.cloud.gov/ops/repos/) to ask if that issue would be a good task to try, or you can open a new issue on any repository if you notice something we should fix.

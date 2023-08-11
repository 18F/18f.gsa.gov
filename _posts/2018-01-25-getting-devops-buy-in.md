---
title: "Getting DevOps buy-in to facilitate agile"
date: 2018-01-25
authors:
- clinton-troxel
- waldo-jaquith
tags:
- devops
- agile
- security
- convincing stakeholders
excerpt: "Agile without DevOps is a bundle of potential energy with no outlet. We’ve found that it’s easier to get agency buy-in for DevOps if automated security audits are part of that work."
---

In our experience working with federal, state, and local governments that practice agile software development, we’ve seen a common problem when those teams go to deploy their code to production. Using agile, government developers and contractors are improving software quickly and incrementally, but crucial questions pop up a couple of sprints in. _How will these software components be assembled into a working system? Where will all of this code run? How will it be deployed?_ These matters usually fit under the umbrella of “operations,” not development, which is often the responsibility of a different department operating under a different budget.
In the private sector, these problems are often overcome by having development and operations teams work together as one DevOps team. For this to be successful in government, we’ve found it important to add in the security team to create a “DevSecOps” team.

## Operations then and now

Historically, operations work has been performed manually, using purpose-built servers that were maintained by specific people, each server fulfilling a planned role. Bound by the limitations of hardware, operations was slower to adopt agile than development was. They might deploy software updates quarterly, after a lengthy evaluation process. New software meant requisitioning and configuring new servers. Development and operations teams weren’t merely siloed in their own departments; they often used entirely different toolsets to manage their work. They might as well have been speaking different languages.

In contrast with operations’ workflow, an agile software development process delivers frequently. Each defined period of work (“sprint”) lasts a week or two. Every commit is deployed to a development environment for testing. This development process requires that changes to software be available for review within seconds — the agile process demands that feedback loop. If the operations team’s processes don’t support near-instant deployments, then all that agile work from developers becomes trapped on their side of the development/operations division. Progress grinds to a halt.

Although this disconnect can occur anywhere, our concern is with how common it is in government agencies. Progressive agencies have started procuring software from agile vendors, but they almost always lack the operations infrastructure to _deploy_ that software. At best, they get only a small portion of the benefits of agile. At worst, the procurement fails, because the agency has no ability to run the software being created for them.

## Bringing DevSecOps to government

The marriage of development and operations is known as “DevOps.” This eliminates the line between development and operations by standardizing the two sides’ toolsets, making developers responsible for understanding the requirements of operations, and automating the processes of testing, security scanning, integration, and deployment. This generally means commoditizing server infrastructure, eliminating the notion of one server that’s designed to do one thing, and replacing it with a stable of virtualized servers. This is known as the “[pets vs. cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)” distinction, for the notion that while heads of cattle are interchangeable, the family dog is not. Over the past decade, DevOps has become a standard practice within the private sector. Not so in government, where it remains standard to maintain suites of dozens or hundreds of purpose-built servers, sometimes duplicatively for redundancy, to which software is deployed manually, by a member of the operations team.

Members of agency IT security teams, made nervous by the prospect of risky-seeming change, can serve as a barrier to adopting DevOps. By being in complete control of their server infrastructure, they feel like that makes it more secure. It’s been our experience that operations teams are much encouraged by the incorporation of security into the DevOps process — it both makes the system security team feel better about automated deployments and automates their existing, manual processes — so we’ve joined the ranks of those who promote the practice of “DevSecOps.”

It’s essential to perform a security review of all software updates, but doing so manually introduces a delay into the deployment process — instead of being completed within a few minutes, the new deploy idles while awaiting review by an operations team member. Every manual review begins with an examination by a vulnerability scanner, so it makes sense to instead include that in the continuous integration pipeline. Scanning for known library vulnerabilities, finding SQL injection vulnerabilities, and running functional security tests can all be done automatically, and there is a competitive market of tools to do so as a part of a integration process. In this way, developers can discover security problems for themselves, the security team can be confident that committed code meets their prescribed baseline, and everybody can save a great deal of time.

We think that DevSecOps is the inroad to the modernization of the operations side of the development/operations divide within government. Bridging that divide starts by empathizing with operations staff and working to understand the pressures and obligations that they’re under. That includes appreciating the specific histories of how their agencies have been burned by modernization efforts in the past. Once we have that foundation, we can help them learn new skills, gradually build up an automated testing suite, and become comfortable joining with developers in using a shared continuous deployment pipeline.

Agile without DevOps is a bundle of potential energy with no outlet. To realize its benefits, it’s necessary to put the software in motion, by deploying it to servers where end-users can test it, completing the feedback loop to allow software to advance. Government is just starting to adopt this approach, but those who advocate for DevOps would be wise to empathize with operations staff, who can be critical allies in pushing for change. When bringing DevOps into government, making it DevSecOps instead may be the difference between failure and success.

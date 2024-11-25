---
title: "Compliance Masonry: Building a risk management platform, brick by brick"
date: 2016-04-15
authors:
- mossadeq-zia
- gramirez
- noah
tags:
- security
- cloud.gov
excerpt: "We’re trying to change how we approach the development of system security plans. Our goal is to create a system that allows system custodians, security operations staff, and executives to actively interact, update, and generate assurance reports with searchable content and testable security controls to satisfy any type of risk management framework. The current prototype is called Compliance Masonry."
description: "We’re trying to change how we approach the development of system security plans. Our goal is to create a system that allows system custodians, security operations staff, and executives to actively interact, update, and generate assurance reports with searchable content and testable security controls to satisfy any type of risk management framework. The current prototype is called Compliance Masonry."
image:
---

Managing risk is critical for government agencies, and the pressure to enhance security has increased after recent intrusions into federal information systems. One of the failures of federal risk management program has been poor governance over these assets. Why? For years we've been producing _system security plans (SSPs)_, comprehensive descriptions of the system's architecture, implemented controls, and general security posture. Unfortunately, [these plans are often incredibly complex]({{ "/2015/11/04/complexity-is-the-adversary/" | url }}), running several hundred pages in length. This makes it incredibly difficult for both engineers and senior executives to manage and accept the inherent risk in operating the system.

Here at 18F, we’re trying to change how we approach the development of this plan. We’re designing a tool that will have the ability to keep the SSP content from stagnating by continually updating it *with code*, as the system changes. A continuously updating SSP will serve as an invaluable resource to our information security teams.

Our goal is to create a system that allows system custodians, security operations staff, and executives to actively interact, update, and generate assurance reports with searchable content and testable security controls to satisfy _any_ type of risk management framework. The current prototype is called **Compliance Masonry**. This is ambitious work and **we need your help to pull it off**.

Compliance Masonry is a content capture and management framework ([CMF](https://en.wikipedia.org/wiki/List_of_content_management_frameworks)) for documenting our SSPs. It’s built on three design philosophies: machine readable data, component models before security controls, and open source.

## Machine readable data

Compliance Masonry data are stored in machine readable [YAML](https://en.wikipedia.org/wiki/YAML)/[JSON](https://en.wikipedia.org/wiki/JSON) format using a specific schema. The predictability of using a set schema allows users to automate their compliance process. We’ve designed automated processes or "pipelines" that convert our YAML/JSON SSPs to [GitBooks](https://www.gitbook.com/) and Microsoft Word.

Even certain complex tests, such as verifying that our systems are using static code analysis tools have been added to pipelines that automatically update our SSP documentation each time our applications are deployed. In essence, using machine readable SSPs has made it possible to start to move compliance at the speed of our continuous deployments.

## Component first approach

Compliance Masonry SSP documentation centers around system [components](https://en.wikipedia.org/wiki/Component-based_software_engineering), not [security controls](https://en.wikipedia.org/wiki/Security_controls). We deliberately chose the component-first philosophy because we believe that the point of compliance is to verify the security of system components, not to statically document a set of controls in a word processor file. The emphasis on components also enables engineers and security officers to communicate with a shared foundation. Additionally, it enables teams to quickly add documentation for new components, amend documentation for components that have updated, and remove documentation for components that have been deprecated.

## Open source software

Here at 18F, we believe that publicly-funded projects should by design be open to the public. Compliance Masonry is no exception. This means that anyone can use or contribute to the project. We went in with the hope that agencies, developers, and service providers would use and build on our solutions. Some of this work has already started taking shape in the [OpenControl community](https://github.com/opencontrol).

## Getting involved

The Compliance Masonry project is still emerging. For 18F, Compliance Masonry is being used to organize SSP documentation for [cloud.gov](https://cloud.gov). In our experience, Compliance Masonry works best for teams who have the capability to write documentation in YAML format and an interest in contributing to an open source project. If that sounds like you, please take a look at the [Compliance Masonry CLI](https://github.com/opencontrol/compliance-masonry) and our [cloud.gov documentation](https://github.com/18F/cg-compliance). Open an issue or make a pull request!

You can see a [sample (work in progress) SSP here](https://compliance.cloud.gov/).
Happy bureaucracy hacking!

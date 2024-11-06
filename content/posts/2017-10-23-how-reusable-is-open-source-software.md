---
title: "How reusable is open source software?"
date: 2017-10-23
authors: 
- laura-gerhardt
tags:
- open source
excerpt: "You can't reuse open source code that was developed to be specific to another org's business process, but we try to make components that will bootstrap development so you can focus on building an application that is tailored to your unique business process."
---

Here at TTS, we’re big fans of [open source](https://github.com/18F/open-source-policy/blob/master/policy.md) software. It’s one of the key ways we hope to provide transparency and cost effectiveness to taxpayers. The [White House Open Source policy](https://sourcecode.cio.gov/AppendixA/) defines open source software as ”software that can be accessed, used, modified, and shared by anyone.” TTS releases all of the code we develop to the public domain in online repositories available to anyone to copy or reuse. In building this software, we incorporate existing open source code libraries to minimize the need for code license management.

Open source software also allows for government, vendors, and outside contributors to work collaboratively. This allows for flexible usage and customization, and for the government to save money on software licenses. It can benefit system security by improving auditability, forcing developers to build software with a strong security posture from the very beginning. Since the code is public domain, it also allows anyone to reuse or redistribute the code and, as [18F’s Open Source Policy](https://github.com/18F/open-source-policy/blob/master/policy.md#maximizing-community-involvement-and-reuse) says, “can be integrated into work that is under a more restrictive license, even those that are not considered open source licenses.”

This post aims to address some misconceptions and clarify certain issues unique to government’s use of open source code in custom software development projects. 

## Limitations to reusability

Just because open source code is reusable, it doesn’t mean that it can be used immediately out of the box.

Behind every government service is a lengthy history of how that service came to be. It involves the technology available at the time, the network of legal requirements, and the people involved. 

The impacts can vary from needing to include a specific disclaimer, only accepting [e-Signatures in a specific format](https://www.epa.gov/cromerr), making it challenging to [update a specific form field](https://www.digitalgov.gov/resources/paperwork-reduction-act-fast-track-process/), or having a [unique approval chain](https://cap.18f.gov/).

These unique situations mean that there’s likely no out-of-the-box software solution that delivers your government service exactly how you want it. If your IT team tries to import an existing codebase wholesale, the product will likely lack features that your users absolutely need, leaving your end users unsatisfied. It may contain bells and whistles that you never use that require additional maintenance costs. In the case of proprietary software, the configuration for your workflow and your users may hit limitations of the software system.

Therefore, some custom development will almost always be required to meet customer needs. The flexibility of open source will help you best meet those needs and incorporate existing modules into your application without incurring costly licensing fees for proprietary software. Some existing frameworks, like Ruby on Rails, or Django (for Python) jumpstart development by providing developers with tools to meet user and agency needs.

For example, 18F helped build a purchase card approval application for the GSA Public Building Service (PBS) called [C2](https://cap.18f.gov/). Our developers leveraged Ruby on Rails to build out the workflow for approval. This allowed them to incorporate the kinds of information approvers would need, and implement the levels of review for each purchase request that matched PBS’s existing and unique business process. 

Going forward, it’s likely that other teams could use this purchase card approval application. Other agencies, however, may have a challenging time using it without heavily adapting the application because it does not meet their internal approval workflows. However, because C2 is open source software, developers building their own system could tweak the code for C2, or at least see how our developers approached the problem.

## Open source is great for bootstrapping

For digital services, open source code is most reusable when the package supports the same business process or can addresses a software problem that is the same regardless of business-process. This is because the open source code allows developers and designers to freely adopt the existing code, adapt it as needed, and then concentrate their development work on how to meet the needs of their users.

For instance, the software built for the [Digital Analytics Program](https://www.digitalgov.gov/services/dap/) has been reused over 15 times by individual [cities](http://analytics.phila.gov/), [states](http://analytics.tdec.tn.gov/), and a [country](http://webanalytics.gov.je). Its success as a reused open source project is in part because many governments monitor their web traffic with Google Analytics. Thus the data source for the software always comes from the same location and in the same format. With the general usage and data pipeline the same, developers can plug in their government’s branding or build upon the existing functionality. The Digital Analytics Program software supports open source reusability by providing software to support a common and specific business case.

Similarly, the [U.S. Web Design Standards](https://standards.usa.gov/) provides an accessible, developer-friendly user interaction library so public and private developers can spend their time building software specific to the business process of their project. Application designers have told us that it sped up development because they didn’t have to make design decisions like button-size for every project. Because the Standards are open source, developers adapt the Standards to meet their agency style guides and freely add additional design assets that were not part of the original code.

Another good place to integrate open source software into your organization is in the deployment process. Since the development process is often separate from a business process, it’s easier to add software developed by another organization, such as an open source continuous deployment tool. These tools help ensure that frequent, small code updates to a project don’t break other parts of the code. They can help standardize the deployment pipeline to reduce the time developers spend on building and provisioning infrastructure and environments. This frees up more time for developers to spend on identifying the functionality that will meet user and customer needs. 

In summary, in government when we’re thinking about maximizing the effectiveness of our IT investments in open source software, it’s helpful to think about isolating code that is business process specific, like data and workflow, from interaction components and database and hosting resources. Software for a business process will almost certainly need to be customized, but interacting components and developer resources benefit from collective investment and reusability.

To see specific 18F projects that are reusable, see [our previous blog post on reusable software]({{ "/2016/04/06/take-our-code-18f-projects-you-can-reuse/" | url }}). If you’d like to learn more, please join our public [Slack channel #opensource-public](https://chat.18f.gov) and checkout our [GitHub profile](http://github.com/18F).

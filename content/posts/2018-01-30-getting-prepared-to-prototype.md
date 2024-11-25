---
title: "Getting prepared to prototype"
date: 2018-01-30
authors:
- mheadd
tags:
- design
- acquisition services
- data act
- state and local practice
- alaska
excerpt: "In product development, we often use prototypes to understand user needs and reduce risk. Prototypes are a great way to test out ideas or approaches before you actually commit to building anything, but governments are not always set up to develop and use prototypes efficiently before building digital services. "
---

> Fortune favors the prepared mind. - Louis Pasteur

In product development, we often use [prototypes](https://methods.18f.gov/#prototyping) — small, lightweight, temporary applications or artifacts — to understand user needs and reduce risk. Prototypes are a great way to test out ideas or approaches **before** you actually commit to building anything.

Although more people are recognizing the value of prototyping, governments are not always set up to develop and use prototypes efficiently before building digital services. Through our work with federal agencies and state governments, we’ve used prototypes to help clarify technical complexity, understand user needs, and to inform software procurements.

Here are a list of factors that governments should consider to become better prepared to build prototypes in designing and improving digital services.

## Deciding what to prototype

You can create prototypes in [many different forms](https://github.com/18F?utf8=%E2%9C%93&q=prototype), and you don’t necessarily have to [write software code]({{ "/2015/01/06/protosketch/" | url }}). You can use prototypes as a way to get feedback from real or anticipated users, or you can use them as a way to test hypotheses or validate technology choices.

<figure>
	{% image_with_class "assets/blog/prototype/design-prototype.png" "image-shadowed" "mock up of a prototype" %}
	<figcaption>A design prototype built for the State of Alaska to demonstrate a new modular product design strategy for the state’s Medicaid Eligibility System modernization project.</figcaption>
</figure>



In our work on [legacy system modernization projects](https://github.com/AlaskaDHSS/EIS-Modernization/blob/master/technical-prototyping.md), we’ve used prototypes to help support the development of software Requests For Proposals (RFP). This approach allows us to reduce risk by demonstrating the feasibility of a specific technical approach and [providing a reference implementation](https://github.com/AlaskaDHSS/ProtoWebApi) of that approach to prospective vendors. This is the approach we took in our work with the State of Alaska to support efforts to modernize their Medicaid Eligibility System. Before the state [issued an RFP](https://github.com/AlaskaDHSS/RFP-Search-Unification) to identify a vendor to build the first module for the project, they developed a technical prototype that helped validate some early technology choices and provided confidence that vendors would be able do the work being described in the RFP.

In our work with federal agencies, we’ve used prototypes to speed the implementation of complex projects and to mitigate the uncertainty around changing policies. The 18F team that worked to [support the implementation of the DATA Act]({{ "/2016/06/14/prototype-early-prototype-often-lesson-from-the-data-act/" | url }}) used prototyping to reduce risk by allowing work to get underway while policy decisions were being finalized.

One early prototype developed as part of this work was a “data broker” that could take in spending data from agencies, validate it, and convert it into a standard format. With this prototype in place, 18F’s partners at the Department of Treasury could refine a developing data standard and start testing data submitted from agencies early to make sure the system worked as expected. The flexibility of this approach enabled the team to iterate on the data standard several times. This ultimately made it more successful because it helped identify a final standard that could be implemented efficiently but that also met the requirements of the law.

Without this approach, the DATA Act implementation team would have spent time waiting for policy decisions to be finalized, and would have had no assurance of the technical feasibility of those decisions. Instead, the team used prototyping to inform the policy decisions around a data standard, which lowered risk and helped to speed the implementation of this important project.

Thinking clearly ahead of time about the reasons for building a prototype, and the format that your prototype will take, will help you find the right people to evaluate your prototype and provide feedback.

## Recruiting participants

Through our work, we’ve learned firsthand that finding users to evaluate a prototype [can sometimes be a challenge]({{ "/2017/11/08/four-lessons-we-learned-while-building-our-own-design-research-recruiting-tool/" | url }}). Identifying users that can provide meaningful feedback and reaching out to recruit them can require multiple steps, and often prior approvals. As a general rule of thumb, the larger the call for feedback, the more hurdles you’ll have to overcome to identify and contact volunteers.

<figure>
	{% image_with_class "assets/blog/prototype/paid-fam-leave.png" "image-shadowed" "A prototype for paid family leave. Top of the screen is light blue with header" %}
	<figcaption>An 18F prototype built to <a href="https://github.com/18F/Paid-Leave-Prototype">provide technical guidance</a> for the Department of Labor with websites for their Paid Family Medical Leave programs.</figcaption>
</figure>


It’s important during this recruitment phase to identify what kinds of users you want in the first place. For any product, there may be a wide variety of users, both inside and outside of government, that you want to obtain feedback from. Which types of users you decide to recruit into prototype testing can be an important factor in determining what you will learn from the process. It’s also worth spending some time thinking about the kinds of feedback you’re looking for from different groups of users, and what kinds of feedback users might be encouraged to provide.  

In our work with federal agencies, we’ve found that the facilitation approach used during the research process can be critical to identifying unexpected insights. If user groups are encouraged, they may sometimes provide feedback about their behavioral logic that you were not originally testing for, but that might be beneficial to your project. Adopting a facilitation strategy that is open to these unplanned learnings can benefit your project.

In addition, we’ve also learned that some user groups (particularly those that are made up of internal users of legacy systems) can approach this process as an opportunity for venting their frustration with existing systems, instead of providing feedback that can be used to make them better. In these cases, it’s important to adopt a facilitation strategy that makes participants feel that their input is heard and that can channel their input into product improvements.

Thinking in advance about potential steps required for recruiting users and [developing strategies](https://methods.18f.gov/fundamentals/) for capturing their input are important parts of the prototyping process. Ultimately, user feedback is the information you will use to deliver a great product. A prototype is one tool that you can use to obtain this data.

## Getting access to test data

If you’re building a code-based prototype, you’ll likely need to use data. It will probably be important to have access to test data that is comparable to production data, both in its format and in its access mechanism. This is particularly true if you’re building a prototype to test different data access methods or if the data will be displayed to end users.

In our work on legacy system modernization in particular, we’ve observed that governments often have not established adequate test environments to support the development of prototypes that need data that is similar to production. Establishing test environments that mirror production systems is important for many reasons, but making test environments available in advance for the development of prototypes can greatly assist this process.

In addition, if the digital service you’re building prototypes for has data in multiple backend systems, creating a comprehensive set of test data across these systems can be important. For example, if a prototype is meant to query information about a specific thing across multiple backend systems (for example, a person or a case), will you have test data available that links relevant data across these systems?

The closer your test environment and data are to actual production data, the more meaningful the insights you’ll be able to draw from your prototype work.

## Deploying prototype applications

In some of our work, we’ve also observed that policies on where application can be deployed, and how they’re reviewed and approved prior to deployment, can significantly impact the prototyping process. Some governments [establish mechanisms for deploying code-based prototypes](https://www.gov.uk/service-manual/design/making-prototypes#sharing-code-prototypes) to environments where they can be accessed by users, but many do not.

The [standard government Authority to Operate](https://before-you-ship.18f.gov/) process for production applications is typically not well suited for prototypes, which are only meant to be temporary and will never be deployed to a production environment.

Before beginning work on your prototype — particularly if it’s a code-based prototype, or one that involves accessing data — determine where it will be deployed so that users can access it. Will your prototype live in an existing environment inside your agency’s network, or will you need to establish a new one? Is the environment accessible to users outside your network?

Resolving these questions is a good way to engage your operations and security teams to ensure that they understand the benefits of prototyping and that you’re following all requirements for deploying software.

When it comes to using prototypes to improve digital services, there is no substitute for being prepared. Considering all of the factors outlined here in advance of your prototype work will help ensure its success, and may even help to institutionalize the practice of using prototypes to develop and improve digital services.

---
layout: post
date: '2014-04-12T12:04:11-04:00'
tumblr_url: http://18fblog.tumblr.com/post/82487787744/how-a-pepperoni-pizza-is-inspiring-open-government
title: "How a pepperoni pizza inspires open government"
excerpt: "Easy access to detailed tracking of processes has become more and more popular. Whether using Amazon.com, UPS, Uber or United Airlines, people expect instant feedback. They want to immediately see the status of a process upon which they depend."
image:
authors:
- memiwhitehead
- robert
tags:
- api
- best practices
- user-centered design
---

Easy access to detailed tracking of processes has become more and more popular. Whether using Amazon.com, UPS, Uber or United Airlines, people expect instant feedback. They want to immediately see the status of a process upon which they depend.

Inspired both by customer questions and the transparency of ordering pizza online, GSA's Memi Whitehead and Navin Vembar wanted to build a “Pizza Tracker” for the [System for Award Management (SAM)](https://www.sam.gov/) to let users quickly see the status of their registration in that system.

Businesses who contract with the federal government can't get paid until they've registered in SAM. Registration is a multi-step process that can take some time, so it's important for businesses to have visibility into where they are in the process.

Although they felt the task was not technically complex, it was only a ‘good idea,’ not a regulatory requirement. That meant they needed to make it cost as little as possible. This forced them to understand their immediate needs and define them very specifically. They then used two best practices to save time and money by removing confusion during the requirement process.

First, Memi and Navin defined the requirements in an API-centric, test-driven way. They wrote the tests in pseudocode allowing the vendor’s technical team to understand the requirements and how to implement them, clarifying and sharpening the API requirements. It also paved the way for the API to become a reusable component that could be transferred or shared with other vendors in the future.

Second, they recruited volunteer effort from two 18F developers to build a functioning prototype of the SAM Tracker. The on-screen prototype brought the idea to life, showing an advancing and retreating progress bar based on test data, aligned to the test-based requirements. Communicating exactly what they wanted this way was clear and efficient, undoubtedly lowering the overall cost[^1] and streamlining the development process.

Now in the early stage of implementing the pilot, Memi and Navin are already seeing dividends of the thoughtful and deliberate expression of requirements in terms of API definitions and test. They believe having the prototype reduced risk and increased the likelihood of the government receiving the desired end product, which will eventually make registration easier for small businesses across America.

And whether it is your pizza or your registration, getting exactly what you ordered is a very good thing.

[^1]: The developers spent about five days of programming time developing the SAM Tracker prototype. The cost savings, while impossible to prove, were judged to have a high return on investment.

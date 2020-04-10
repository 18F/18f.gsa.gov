---
title: "Rapid implementation of policy as code"
date: 2020-04-13
authors:
- alex-soble
- mike-gintz
tags:
- transformation-services
- health-and-human-services
- rules-as-code
excerpt: "No policy or rule stays the same forever. In response to a crisis, policy changes often come much faster, and stakes can be higher."
image: /assets/blog/rapid-implementation-of-policy-as-code/header.jpg
---

No policy or rule stays the same forever. In response to a crisis, policy changes often come much faster, and stakes can be higher. A new rule might change the amount of benefit someone receives as part of a safety net program, or make someone eligible who was previously ineligible.

But these changes are only effective once they are implemented. And in 2020, almost all social service programs use digital systems to manage eligibility and enrollment. Most policies written into legal code will eventually need to be programmed into these digital systems as part of implementation. These digital systems include tools used by caseworkers, front-end portals used by clients, and back-end systems that administer benefits.

**Especially during a crisis, speed and accuracy are critically important.** If you work for a government agency that is creating, revising, or interpreting new rules right now, you may be wondering:

> *“What can I do to speed up the implementation of these new rules? What can I do to make sure that my agency’s updated rules are interpreted and implemented accurately in our digital systems?”*

In the United States, policy staff typically write rules in English and distribute them in PDF form. Technical staff then read the complex policy rules and translate them into computer code to implement the policy in digital systems. Structuring this as a two-step process introduces lag and room for misinterpretation. Bringing technical and policy staff together to [write and publish policy rules as computer code](https://18f.gsa.gov/2018/10/16/exploring-a-new-way-to-make-eligibility-rules-easier-to-implement/) together early on improves both speed and accuracy.

Our team at 18F — the [Eligibility APIs Initiative](https://github.com/18F/eligibility-rules-service/blob/master/README.md), powered by GSA’s [10x](https://10x.gsa.gov/) — has been researching and prototyping techniques for putting these concepts into practice. Back in 2018, we wrote about our early experiments [implementing rules with modern programming languages](https://18f.gsa.gov/2018/10/09/implementing-rules-without-rules-engines/). Today, we want to share an example from our work that shows the potential for rapid, accurate policy implementation as code.

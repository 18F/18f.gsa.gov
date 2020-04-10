---
title: "Rapid implementation of policy as code"
date: 2020-04-13
authors:
- alex-soble
- mike-gintz
tags:
- api
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

## Prototyping SNAP eligibility

Eligibility for SNAP (food stamps) is complex, with many factors playing a role in determining a household’s eligibility and final benefit amount. This complicated logic has been coded and re-coded many times by different states, territories, non-profits, and legal aid organizations. SNAP eligibility is somewhat different in each location, but there is a core of shared federally set rules across all localities.

In collaboration with policy experts at the federal level, we created an experimental prototype model of SNAP eligibility that is:

* **Open and transparent**: Because we are following an open-source approach, anyone can see our [prototyping repo](https://github.com/18F/snap-api-prototype) on GitHub, check our inputs and assumptions, point out bugs, and re-use our work. We used a popular open-source coding language (Python) that many developers are familiar with, and which doesn’t require proprietary tools or licenses.

* **Shareable between systems**: Our program is meant to be used by other programs — it is built as an API, or an Application Programming Interface. For example, another system could call our API, send information about a hypothetical household, and receive information about that household’s SNAP eligibility. This could lay the groundwork for a shared service between states, territories, and even non-profits like legal aid organizations.

* **Verifiable as accurate**: Our prototype includes automated tests that check to make sure outputs stay accurate and predictable, even in a rapidly changing policy environment. We use [Gherkin](https://docs.behat.org/en/v2.5/guides/1.gherkin.html) for our automated tests, so even policy experts unfamiliar with code can take part in confirming that the coded logic is correct.

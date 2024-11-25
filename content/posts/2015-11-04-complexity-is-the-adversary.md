---
title: "Complexity is the adversary"
date: 2015-11-04
authors:
- noah
tags:
- security
- best practices
- https

description: "What if we told you that most catastrophic digital security vulnerabilities had one common denominator? One overriding contributor to root causes? Would you believe that one factor is also the biggest impediment to great design and software? That one thing? Complexity."
excerpt: "What if we told you that most catastrophic digital security vulnerabilities had one common denominator? One overriding contributor to root causes? Would you believe that one factor is also the biggest impediment to great design and software? That one thing? Complexity."
image: /assets/blog/complexity-and-security/security-documentation-1.jpg
hero: false
---

What if we told you that most catastrophic digital security vulnerabilities had one common denominator? One overriding contributor to root causes? Would you believe that *one factor* is *also* the biggest impediment to great design and software?

That one thing? Complexity. **Complexity is the one true adversary.**

Look at [goto fail](https://www.imperialviolet.org/2014/02/22/applebug.html), [Heartbleed](http://heartbleed.com/), [Shellshock](https://en.wikipedia.org/wiki/Shellshock_(software_bug)), or any number of [Flash-based vulnerabilities](http://blog.trendmicro.com/trendlabs-security-intelligence/unpatched-flash-player-flaws-more-pocs-found-in-hacking-team-leak/). Complexity leads to developers not spotting a bug in time, or not realizing they were creating a vulnerability to begin with. Often the *most effective way to make software safe is to keep it as simple as possible*.

It's not just the complexity of the technology itself that's the problem. When our compliance documentation is complex, we’re making ourselves less secure. If it takes a hundred (or several hundred) pages to explain all the security controls you've implemented on a piece of software, that's not a good thing.

{% image "assets/blog/complexity-and-security/security-documentation-1.jpg" "A sample of required security documentation for federal websites." %}
_A sample of required security documentation. It's not uncommon to see 300 pages or more._


Compliance documentation doesn't tell me what the security posture of a system is now. It's a point in time analysis that's useless the moment it's "saved." Worse is the opportunity cost. Every hour spent writing compliance documentation is an hour not invested into engineering. Code can keep our systems safe, whether it's documented correctly or not.

Government has long over-invested in security compliance documentation, and under-invested in security engineering. Thankfully, we're moving in the right direction, but there's still a tremendous amount of work to do. We should be spending 80 percent of our labor and money on engineering, and 20 percent on documentation. All too often, that ratio is reversed.

When we do invest in documentation, we should overwhelmingly focus on a small and simple set of straightforward best practices, which I cite below. Like many systems, cybersecurity follows an 80-20 rule: 80 percent of the benefit comes from 20 percent of the work. Until 100 percent of the government has implemented the security controls that generate **most** of the benefit, we should focus *on little else*, confident that we're spending our time in the most effective fashion possible.

We're moving in the right direction. The U.S. Computer Emergency Readiness Team (US-CERT) has **[put out five new best practices](https://www.us-cert.gov/ncas/current-activity/2015/07/31/Best-Practices-Protect-You-Your-Network-and-Your-Information)** for both the public and private sector. This list was compiled after responding to a significant number of data breaches over the past year, covering incidents both within and outside the government.

> 1. Implement Two-Factor Authentication: Two-factor authentication works to significantly reduce or eliminate unauthorized access to your networks and information.
> 2. Block Malicious Code: Activate application directory whitelisting to prevent non-approved applications from being installed on your network.
> 3. Limit Number of Privileged Users: System administrators have privileged access that gives them the “keys to your kingdom.” Limit system administrator privileges only to those who have a legitimate need as defined by your management directives.
> 4. Segment Your Network: Don’t put all your eggs in one basket by having a “flat network.” Use segmentation techniques so that if one part of your network is breached that the integrity of the rest of the network is protected.
> 5. Lock Your Backdoors: Third parties that share network trust relationships with you may prove to be an Achilles heel by serving as an attack vector into your network. Take action to ensure that all network trust relationships are well-protected using best practices. Have a means to audit the effectiveness of these defenses. Consider terminating or suspending these relationships until sufficient controls are in place to protect your backdoors.

This is a great start! There's nothing new on this list — these are things any organization, either in the public or the private sector, can and should implement ***today***. But that means this is also a summary of what should *already* be true. It doesn't create the roadmap of where we should go from here. All of this is technology that's been available for years.

18F is [dedicated to fighting complexity]({{ "/2014/05/14/hacking-bureaucracy-improving-hiring-and-software/" | url }}) and sharing simplicity. We've already made huge progress around HTTPS, continuous monitoring, and baking security into our platform.

We plan to publish continued guidance on how to implement these current best practices quickly and efficiently, while reducing an agency's overall complexity. We'll also talk about what agencies should focus on after implementing the above, using smart architectures and modern infrastructures.

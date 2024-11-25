---
title: "New pilot aims to streamline notice and comment process"
date: 2016-07-26
authors:
- andre
- willsullivan
tags:
- agency work
- environmental protection agency
- eregulations
- product launch
excerpt: "Today, the Environmental Protection Agency (EPA) began asking the public to comment on a new proposed rule that would affect how the EPA tracks hazardous waste as it moves around the country. This rule is also the pilot of the new notice and comment feature of the eRegulations platform."
description: "Today, the Environmental Protection Agency (EPA) began asking the public to comment on a new proposed rule that would affect how the EPA tracks hazardous waste as it moves around the country. This rule is also the pilot of the new notice and comment feature of the eRegulations platform."
image: /assets/blog/eregs-comments/eregs-comment.gif
hero: false
---
<figure>
	<img src="{{ "/assets/blog/eregs-comments/eregs-comment.gif" | url }}" alt="gif of eRegulations comment page" />
	<figcaption>The new eRegulations commenting interface allows people to share their thoughts down to the paragraph level.</figcaption>
</figure>
<br>

Today, the Environmental Protection Agency (EPA) began asking the public to comment on a [new proposed rule](https://epa-notice.usa.gov/) for establishing the fee methodology for EPA’s electronic hazardous waste manifest system. This rule is also the pilot of the new notice and comment feature of the [eRegulations platform](https://eregs.github.io/).

[eRegulations is an open source platform developed by the Consumer Financial Protection Bureau and 18F]({{ "/2015/12/09/an-open-source-government-is-a-faster-more-efficient-government/" | url }}) to help make government regulations more readable, accessible, and understandable. The new notice and comment feature allows the public to comment down to the paragraph level on proposed regulations and simplifies the sorting and responding process for federal agencies receiving the comments.

## What is notice and comment?

As federal rules make their way from inside agencies into the official rulebook (the Code of Federal Regulations), most of them must go through an official feedback process called “notice and comment.” Changes to the rules are proposed by federal agencies via an official “Notice of Proposed Rulemaking” in the Federal Register. For (usually) 60 days following this notice, the general public can _comment_ with expert opinion, testimonials, etc. to sway agencies to amend their rules.

This step is a critical function in our democracy. Many of the details of governing happen in the rulemaking process, as opposed to the more well-known lawmaking process in Congress. Notice and comment allows the public and interested groups an opportunity to express their opinions and critiques directly to the agency officials responsible for finalizing these rules, who digest and address the public’s input.

## Modernizing the notice and comment process

While many commenters continue to use paper or email, the current digital process for public comment limits the submitter to a single 5,000 character text field, with attachments (like spreadsheets, PDFs, etc.). Unless the submitter explicitly adds it, this format includes no contextual information — regulators won’t know which sections of the proposal are being critiqued. When proposed rules are often hundreds of pages of nuanced language, it can be difficult to provide constructive feedback. These rules can sometimes receive thousands of comments, which must be manually or semi-automatically sorted by federal agencies. Without a clear connection between comments and relevant sections of a proposed rule, agencies have to spend a huge amount of time analyzing, sorting, and responding to comments. This is a costly and error-prone endeavor; we can do better.

<figure>
	{% image "assets/blog/eregs-comments/previous-system.png" "gif of eRegulations comment page" %}
	<figcaption>The output of feedback will be inline to a specific section. This will give agencies a better understanding of what people are responding to.</figcaption>
</figure>
<br>

We hope the eRegulations Notice and Comment tool will simplify and streamline the process for both the public and for agency staff. The public will be able to see the agency’s proposed changes inline with the original document. Further, they can write responses to individual sections (or even paragraphs) of the proposed rule instead of commenting on the whole document. Agencies will be able to see commenters’ thoughts in more context with clear placement in the proposed rule, making it much easier for them to sort and analyze input from the public.

## Small features with big impacts

When looking at the breadth of services that the federal government offers, improving the notice and comment process can seem like a small accomplishment, especially this pilot project. But allowing the public to directly comment on proposed rules and regulations is one of the most direct forms of democracy that we have.

This new feature, and the [many other features](https://eregs.github.io/features/) of the eRegulations platform, have the potential to make public input easier, more useful, and more focused. A better user experience means increased participation and more voices speaking up about the critical rules that govern federal agencies. It will also save agencies substantial time (and therefore money) when analyzing and responding to comments.

We built the eRegulations Notice and Comment process using human-centered design principles. We interviewed everyone from legal experts, agency representatives, regulation writers, and contractors who sort the comments that come in, to political and environmental activists, librarians, and general public commenters. This user-centered approach helped inform our agile design and development process and guided the release that we’re testing live starting today. We’ll continue to do user research and collect feedback on the user experience to improve the platform in the future. (We’d love your feedback on [this new feature](https://epa-notice.usa.gov/).)

While this comment feature is only live for this EPA regulation, we’re interested in expanding it further and finding more partners to join us in this democratic experiment.

Also, the eRegulations platform is [open source](https://eregs.github.io/) so anyone can spin up their own instance or fork and build new features. We believe this platform has the potential to transform the state of rules and regulations across the federal government. We’re excited to work with our amazing partners at the EPA and to learn from the first iteration of this feature so we can continue to improve the eRegulations platform with lessons from real, live users.

If you’d like to contribute to the eRegulations project or explore how your agency can work with us or adapt it for your own use, you can find more information at [eregs.github.io](https://eregs.github.io/).

_Special thanks to Bill Noggle and the EPA eManifest team for their tremendous expertise, support, and feedback on the product development process and Valerie Brecher-Kovacevic and the Regulations.gov team for their support with the API that makes this pilot project possible._

---
title: "Getting partners on board with research findings"
date: 2018-02-06
authors:
- angela-colter
tags:
- user research
- convincing stakeholders
excerpt: "As a consultant who does user research, I’ve found that the way consultants present “findings and recommendations” to clients isn’t always effective: findings immediately followed by recommendations, all at once in a single presentation. A better approach in sharing user research findings with a partner is “findings, consensus, and recommendations.” "
---

As a consultant who does user research, I’ve found that the way consultants present “findings and recommendations” to clients isn’t always effective: findings immediately followed by recommendations, all at once in a single presentation. The findings may be insightful and the advice sounds great, but somehow the client never implements the recommendations.

I get why we do it this way. We want to make efficient use of a client’s time by telling them here’s what we found and here’s what we think you should do about it. However, following up findings with immediate advice on what to do about them without giving the partner a chance to weigh in presents a couple of problems:

- **It doesn’t give your partners a chance to tell you whether they agree with your findings.** If your partner doesn’t agree with your findings, they’re probably not going to buy into whatever recommendations you’re making.
- **It doesn’t give them a chance to tell you which findings they care about.** Every partner and organization has priorities that guide their work. Nobody wants to spend time coming up with a recommendation that’s not going to be implemented because the issue it addresses simply isn’t a priority to the organization.
- **It doesn’t allow your partners to be involved in the recommendations.** A lot of our engagements at 18F are relatively brief. It may give us time to understand stakeholder goals and user needs, but it’s important to understand the technical, cultural, and organizational constraints at play as well. Partners likely know what these are. By collaborating with partners in the recommendations we make, they’re more likely to feel a sense of ownership in whatever solution we put forth.

A better approach in sharing user research findings with a partner is “findings, consensus, and recommendations.” Share your research findings, develop a shared understanding of those findings with your partner, and then develop recommendations that are informed by the partner’s priorities and constraints. We used this approach on a recent project with [ClinicalTrials.gov](https://clinicaltrials.gov/), a database of clinical trials and research results that needed some usability improvements.

## Presenting findings

After spending the first two weeks of a six-week project interviewing various users of the site — patients, patient advocates, and clinical study coordinators — the 18F team had a check-in with our agency partners to review what we’d learned so far and allow them to ask questions.

## Reaching consensus

Once our partners had bought into what we had seen and heard during our research, we asked them to prioritize the findings. This request left them a bit confused. “Aren’t _you_ supposed to tell us what the priorities should be?” they asked. We told them that while we certainly had an opinion on what the highest priority issues were, especially from a user-experience perspective, it was important for us to know what _their_ organizational priorities were.  

<figure>
	{% image_with_class "assets/blog/user-interview/hi-med-low.jpg" "image-reduce right-aligned" "image of a large white butcher paper with three columns.  Each column has a header that relate to level of priority - High, medium, low. Below each header are various post-its" %}
</figure>

We conducted this exercise using a very low-tech approach: writing findings on sticky notes, then asking the partner to put them into low-priority, medium-priority, and high-priority groups.

By identifying the five highest priority issues out of the original 19, we were able to focus our efforts and the limited duration of our engagement on the issues we knew the partner was most concerned about.

## Making recommendations

While some of the team continued talking to users, others on the team started talking to the agency partner’s developers to get a sense for how to best address the prioritized findings in the current context of their work. We decided that instead of building a redesigned site for the partner, it made more sense to work with the partner to figure out how to implement the changes we were recommending. We did this in part by introducing them to the pattern library and style guide of the [U.S. Web Design System](https://designsystem.digital.gov/) so that they felt comfortable enough to make small, incremental changes to the site based on our findings.

The [new 18F mission statement]({{ "/about/" | url }}) mentions that we want “to strengthen government technology practices in ways that last beyond our formal partnerships.” One way of doing that is by giving agency partners the space to fully understand the issues that come up during our research, to identify the issues that are most aligned with their organizational goals, and to ensure recommendations are appropriate for the context in which they work.

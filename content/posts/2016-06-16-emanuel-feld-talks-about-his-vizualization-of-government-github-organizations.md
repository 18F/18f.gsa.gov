---
title: "Emanuel Feld talks about his visualization of government GitHub organizations"
date: 2016-06-16
authors:
- melody
tags:
- open source
- open government
excerpt: "What does the global government open source community look like? That’s the question that Emanuel Feld, a civic technologist in Washington DC, wanted to answer when he created a visualization showing how government repos on GitHub are connected and interrelated."
description: "What does the global government open source community look like? That’s the question that Emanuel Feld, a civic technologist in Washington DC, wanted to answer when he created a visualization showing how government repos on GitHub are connected and interrelated."
image: /assets/blog/emanuel-feld/github-repositories.jpg
---

What does the global government open source community look like? That’s the question that Emanuel Feld, a civic technologist in Washington D.C., wanted to answer when [he created a visualization](https://emanuelfeld.github.io/blog/2016/04/27/government-github-ecosystem.html) showing how government repos on GitHub are connected and interrelated.

[{% image "assets/blog/emanuel-feld/contribution.svg" "A diagram of GitHub contributions by many government agencies" %}](https://emanuelfeld.github.io/assets/images/contribution.svg)

Feld used the GitHub API to create a database of government GitHub
organizations and repositories, and then used that information to
examine how the government repos interact with one another.

[{% image "assets/blog/emanuel-feld/repository.svg" "A diagram of government GitHub repositories" %}](https://emanuelfeld.github.io/assets/images/repository.svg)

The above graph, for instance, shows how government organizations fork
code from other government organizations. This information is
particularly interesting to those of us at 18F who think about how to
organize our projects so that they can easily be found and used by other
organizations. (Related: my colleague Britta Gustafson’s [great
piece]({{ "/2016/04/06/take-our-code-18f-projects-you-can-reuse/" | url }})
on 34 reusable projects from 18F.)

We reached out to Emanuel to learn more about why he analyzed government GitHub repos and what he learned.

**Melody Kramer: You recently created a visualization showing how government repos on GitHub are connected and interrelated. Can you talk a little bit about what inspired you to undertake this project?**

**Emanuel Feld:** When I first started [this
project](https://emanuelfeld.github.io/blog/2016/04/27/government-github-ecosystem.html),
I was curious about government's relationship with the rest of the civic
technology sphere. The latest wave of government technology programs
owes quite a bit to groups like MySociety, the Open Knowledge
Foundation, and the Code for 'X' brigades. I hoped to better
characterize the nature of their relationship, but was not satisfied the
data I had was giving an accurate picture. 'Civic technology' is a
pretty fuzzy term.

Instead, I chose to focus on governments' usage of GitHub. Government
organizations have really taken to it in the past couple of years. I,
myself, recently helped (re)kickstart the [local D.C.
government](https://github.com/dcgov)'s development on the platform.
There is a [GitHub Peer Group](https://github.com/government/welcome)
for government employees. Many of the organizations express a similar
conviction that publicly-funded code should be public. Most of them face
similar issues. It certainly seems like a community of sorts.

But what sort of ecosystem have they created? Do they collaborate, share
members and contributors, and fork one another? Where do you see the
most collaboration? Who are the big players and how important are they?
Are the organizations invested in making their code truly open? These
are some of the questions I was interested in addressing.

**MK: What were the most interesting takeaways? Surprising?**

**EF:** The most interesting finding, I think, is that government is bringing many users to GitHub. In other words, the platform is generally new at an individual level and not just an institutional one. I go into this more below.

I was surprised at the importance of geography. You see really concentrated collaboration and reuse within the U.S. and UK national-level networks, but not much across the UK-U.S. divide. No other strong networks emerge. I write in the blog post that this "may point to the importance of scale, 'real world' interactions (e.g. talks, meet-ups, employees switching between organizations), and the alignment of policy priorities, timelines, licensing, and tech stacks."

That being said, less productive users and organizations are contributing a huge proportion of overall activity. There is, I think, an overwhelming focus on open government's big players, which could be better reflect what is actually going on.

**MK: What do you hope governments do with this data?**

**EF:** I hope that governments try to situate themselves within the
graphs and tables, consider how they relate to others, and explore what
other organizations work on and how they behave. They may find that
their repositories are unlicensed or unusually licensed. They may see
that they could be reusing existing projects or co-developing them. They
may decide that they need to better advertise their own work.

They may also see that their organization is missing, because it was
absent from GitHub's
[listing](https://github.com/github/government.github.com/blob/gh-pages/_data/governments.yml)
or that their memberships were unintentionally kept private. Indeed,
some already have addressed data gaps after reading the blog (e.g.
[here](https://github.com/github/government.github.com/pull/461) and
[here](https://twitter.com/rjw1/status/725972259232436224))!

Beyond that, there are definitely aspects of the data that I did not
explore. It would be great if organizations contributed their own
analyses, perhaps diving deeper into their particular organization's
behaviors.

**MK: You mentioned that most of the graph’s forks go unreciprocated. I’m really interested in how we better surface our projects so that they’re more easily discoverable. I would love to hear your thoughts on ways to do this better.**

**ER:** There is definitely a discoverability challenge. Most
organizations release only a couple repositories, but have few
connections to leverage and get little coverage. Although 18F is well
known, it has over 400 repositories on GitHub and produces new work
daily. It can be hard to keep up if you're not actively paying
attention. Blog posts like Britta Gustafson's "[Take our code: 34
reusable projects from
18F]({{ "/2016/04/06/take-our-code-18f-projects-you-can-reuse/" | url }})"
are a helpful start. I appreciate how it presents completed work as
products.

Overall, however, I think the root challenge is one of alignment. It's
about aligning timelines, technology stacks, skills, cultures, policies,
licenses, etc. That's why almost all the most starred and forked
repositories (including many of 18F's) are standards and frameworks.
They stand alone and get people using the same vocabulary, approaches,
and tools. In my ideal world there would be room for co-development
across governments (especially municipalities) and not just reuse.

**MK: How could other groups like civic tech groups or journalists access and use this data?**

**EF:** The code I used to compile the data is all [on
GitHub](https://github.com/emanuelfeld/government-github) (under an MIT
License). The database I used for the post's analysis is there as well.
It's in SQLite format, so others can dig into it with a free tool like
[SQLite Browser](http://sqlitebrowser.org/).

All the data was gathered using [GitHub's
API](https://developer.github.com/v3/), which is free and has thorough
documentation (it's best to get an [API
token](https://developer.github.com/v3/#authentication) using your
GitHub account). I started off with GitHub's
[list](https://github.com/github/government.github.com/blob/gh-pages/_data/governments.yml)
of government organizations. Then I pulled in the API's data about each
of these [organizations](https://developer.github.com/v3/orgs/), their
public [members](https://developer.github.com/v3/orgs/members/), their
[repositories](https://developer.github.com/v3/repos/#list-organization-repositories),
and the repository
[contributors](https://developer.github.com/v3/repos/#list-contributors).

The network graphs in the blog post were generated using an application
called [Gephi](https://gephi.org/). All other graphs were done in
[R](https://en.wikipedia.org/wiki/R_(programming_language)).

**MK: Could you talk a little bit about what you discovered regarding user join date vs. organization creation date? I think it speaks to the need for git training for folks who may not be used to working on GitHub.**

**EF:** I had an impression that most of these organization's
contributors were of the Code for America sort — people trained
elsewhere in modern development tools and practices, who were now
bringing their skillset to the public sector. There is certainly a bit
of that going on, particularly among national-level groups like 18F, the
U.S. Digital Service, and the UK's Government Digital Service.

However, in exploring the data, I realized this was not the overwhelming
case. At least half of the users were not on GitHub before they joined
or contributed to a government GitHub organization.

Git and GitHub are of course not the sum total of modern development.
Yet, the two are interesting because they facilitate many ideals of
government technology's new wave (e.g. openness, collaboration, sharing,
reuse), while being so flexible that appropriate practices are not a
given. The challenge is training people in the mechanics of the tools,
as well as the culture to make the tools worthwhile.

**MK: I love one of your other projects,** [**Get DC trees**](http://getdctrees.org/)**. You created an easy way for people to request new tree plantings in their neighborhoods. How do you come up with the ideas for your projects?**

**EF:** Ideas come to me in a variety of ways: they solve a problem I
have, they address something I read about on one of the channels listed
before, they are a way to apply a newly learned skill. Most, I would
say, end up sharing a unifying theme: contextualizing experiences and
behaviors within the larger environment and in a way that's actionable.

**MK: What are you working on next in this space?**

**EF:** I plan on sprucing up this project's code and turning it into a
regularly updating dashboard in the near term.

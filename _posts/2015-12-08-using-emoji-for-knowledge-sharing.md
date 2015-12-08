---
title: "Using emoji for knowledge sharing"
date: 2015-12-08 10:00
authors:
- melody
tags:
- onboarding
- how we work
excerpt: "Our coworkers are very, very good at documenting the things they learn
in Slack, our chat program, because it’s part of their daily workflow. So I tried an experiment: I asked my 18F coworkers to tag messages that every new 18F employee should know with the
:evergreen_tree: emoji."
description: "Our coworkers are very, very good at documenting the things they learn
in Slack, our chat program, because it’s part of their daily workflow. So I tried an experiment: I asked my 18F coworkers to tag messages that every new 18F employee should know with the
:evergreen_tree: emoji."
image: /assets/blog/onboarding/evergreen-tree.png
---

In the process of [rethinking
onboarding](https://18f.gsa.gov/2015/12/01/how-we-dramatically-improved-18fs-onboarding-process-in-3-months/) at 18F, Andrew Maier and
I have been thinking a lot about documentation.

Our coworkers are very, very good at documenting the things they learn
in Slack, our chat program, because it’s part of their daily workflow.
But this information isn’t necessarily documented elsewhere, like our
internal handbook.

This meant that information in our handbook was sometimes outdated,
compared to what was being shared in Slack. This made it difficult for
new employees to find the most up-to-date information.

So I tried an experiment: I asked my 18F coworkers to tag
messages *that every new 18F employee should know* with the
:evergreen_tree: emoji.

![Melody Kramer explaining how to tag messages on Slack](/assets/blog/onboarding/evergreen-tree.png)

This allowed me to search Slack using this command:
"has::evergreen_tree:" to surface all of the tips and tricks my
coworkers thought were important.

My coworker Micah Saul then wrote a little [command line
utility](https://github.com/18F/emoji_search) to make it even easier to search for a
certain emoji within Slack.

This allows our entire team to document information for future hires
_without_ requiring employees to do _yet another documentation
task._

So far, it’s been very successful. We’ve received over 100 messages
tagged with the :evergreen_tree:, and have cataloged that information
into the Handbook our new hires receive.

We next plan to further extend functionality by eventually linking
Micah’s emoji finder to GitHub issues, so that new messages are
automatically queued in a repo for inclusion in the handbook.

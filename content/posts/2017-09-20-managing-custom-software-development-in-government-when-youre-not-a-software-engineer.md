---
title: "Managing custom software development in government when you're not a software engineer"
date: 2017-09-20
authors:
- kaitlin
tags:
- agile
- user-centered design
- guides
- modern practices
excerpt: "As custom software development becomes integral to accomplishing any program’s mission, many managers in government find themselves faced with handling the unfamiliar: overseeing the design and implementation of a digital product that is functional and user-friendly."
---

As custom software development becomes integral to accomplishing any program’s mission, many managers in government find themselves faced with handling the unfamiliar: overseeing the design and implementation of a digital product that is functional, user-friendly, and necessary for realizing your program’s mission. 

Running a program in government is already tough; taking on software development to the pile of responsibilities can make the day-to-day chaotic. Adding to the complexity, all program-specific software must be aligned with the other program and policy work being done to accomplish your goals. **Leadership and management for that alignment cannot be outsourced.** 

This post is part of a series that will introduce you to the things you need to think about to manage software development effectively, even if you don’t have a background in software engineering. Future posts will cover issues such as: how to convince your peers in government to use agile methods; getting through the security and assessment process with your product; battling procurement constraints; melding agile with other government processes; and building a high-functioning development team. 

You might think to yourself, “My job is policy, not software. I can outsource this technology stuff.” Or, “I don’t need to spend a lot of time and attention on developing a great software product to enable my mission.” Every failed project I've seen has started with such attitudes. Focusing your attention on building a great product lets the software get out of the way of your team’s work. 

This series is designed to guide you in managing your necessary IT needs as a product, rather than as a physical item you buy off the shelf. Software development is more like creative writing: You start with an outline, a rough draft, a first draft, many more drafts, and then you have a draft that’s not embarrassing to publish — not because it’s perfect, but because you’ve run out of time and need to get a working version out there. For most civil servants, the shift from buying software as a commodity to an iterative service may require a significant change in your mental model, but one that can be achieved in small steps, and with practice (for a guide on what not to do, please read Dan Sheldon’s [The Government IT Self-Harm Playbook](https://medium.com/@sheldonline/the-government-it-self-harm-playbook-6537d3920f65#.ab2mvocaz)).

There are two implementation strategies that will serve you well when embarking on a new project as a new product owner: agile development and user-centered design. Both of these terms can mean different things to different people, but ultimately every flavor of these methodologies should rely on just a few fundamental principles that are more common sense than anyone cares to admit.

## Agile development

Agile development really just means continuous and incremental improvement. Don’t try to plot the three-year path of your product in one sitting. Instead, focus on steady and demonstrable progress on individual features rather than detailing every possible requirement up front. This refers not just to the product itself, but also to the team working on it. You need to regularly and honestly assess what is and isn’t working in your team, and continuously improve it (referred to as a “retro” in agile speak). Honest retros are so important that, in fact, I would hire someone with no discernible skills beyond active and constructive participation in retros over a “superstar coder” any day. 

If you can, start off targeting the simplest possible version of your product that works [end to end]({{ "/2017/01/11/the-best-way-to-build-big-is-to-start-small/" | url }}), even if that just means a site that displays the text “Hello” but is actually functioning live on the internet somewhere. Deploying software is almost always the most difficult part of the whole process. By deploying something basic at the beginning, you not only save yourself a lot of future pain, but you’ve already got a live, demo-able product! This will come in handy very soon, when you inevitably need to convince your peers that this is an acceptable way of working in government. 

There are a [million](https://modularcontracting.18f.gov/agile-development/) [resources](https://youtu.be/FpBjClJTVQ0) [out]({{ "/2015/02/11/a-story-of-an-agile-workshop/" | url }}) [there]({{ "/2015/08/31/how-playing-with-legos-taught-executives-agile/" | url }}) to understand agile software development, and there are many different ways to do it. But I often see projects in government missing the very basics, while still having a very elaborate and self-described agile process. At a minimum, you must:

1. Have frequent (measured in weeks not months) demos of working software. Showing documents and spreadsheets to the team is not a demo.
2. Have regular retrospectives. A dedicated time on a regular basis (usually right after the demos) for your team to think critically about how to improve your team and product going forward.
3. Prioritize features _ruthlessly_. If everything is a priority, then nothing is. 

One thing you _don’t_ need is an agile certification — to quote my colleague Robert Read, “You can’t learn [agile software development](http://agilemanifesto.org/) from a book any more than you can learn to perform a one-handed jump shot without repeatedly tossing a basketball in the hoop.” Since agile development is more a mindset of continuous improvement and not a rote process that can be disseminated as step-by-step instructions, you have to practice at it. Even better, find a high-functioning team where you can observe actual practitioners. 

## User-centered design

### Or: Am I building something that anybody even wants to use?

Many people in charge of a software product make the mistake of thinking they’re a good proxy for what their users want. Don’t make this mistake! Especially when usability testing with actual users is relatively cheap when compared to the cost of the added software development time you’ll spend on a feature. That cost is only compounded when you find out nobody wants the feature or can figure out how to use it.

What is usability testing? Simply put: You put something (a sketch, a wireframe, a prototype) in front of people who will actually be using your product at some point in the future and collect feedback, as soon as possible. Don’t be afraid to show users something that seems unfinished. You don’t need to act on every piece of feedback, but look for common themes, and if the theme repeats enough times, turn it into a feature. Add this feature into the next versions of your sketches or wireframes, or into the product itself. 

If you can, avoid building things that are completely untested. It’s fine to stand in as a proxy for your users when building a cheap [wireframe](https://www.usability.gov/how-to-and-tools/methods/wireframing.html) or first sketch of the page, but make sure you test the wireframe with actual users before building out the software version. As a product owner, you’ll need to help surface real users that your team can talk to, and not just other stakeholders or “proxy” users. The [18F Method Cards]({{ "/2015/08/10/18f-design-methods/" | url }}) are a good place to start if you’re looking for actual testing techniques.  

You’ll also need to learn to let go of what you think are “must-haves” (and convince your higher-ups to do the same). It doesn’t do any good to do usability testing if you’re going to ignore the results. Think long and hard about what makes these desired features or content so critical. If it’s just confusing your users, it’s doing more harm than doing nothing at all. If another stakeholder is demanding a feature, present the evidence to them. Incorporate their feature into a wireframe and test both versions. You can even invite them to the test, if they agree not to interfere. In my experience this is very effective at quelling the problem of “design by committee.” You might call it “evidence-based designing.” 

## What’s next?

Watch for the next post to learn about how to demonstrate the value of these practices to other stakeholders and executives in your organization and how to get their buy-in for working differently. 


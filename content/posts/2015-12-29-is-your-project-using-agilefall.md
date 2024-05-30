---
title: "Is your project using &ldquo;agilefall&rdquo;?"
date: 2015-12-29
authors:
- christopher-goranson
- alan-brouilette
- alan-atlas
tags:
- agile
- best practices
- how we work
excerpt: "At 18F, we’ve spent a lot of time working with federal agencies and coaching them through the transition to agile, but on first blush it’s not always easy to tell who’s really adopted agile versus those who just say they’re agile because they know they’re supposed to."
image:
---

Knowing when (or if) your organization has successfully transitioned fully into an agile methodology can be tricky. Becoming an agile organization is harder than it looks, and it’s helpful to be able to identify traditional development practices that can slow down or derail your quest for agility. At 18F, we’ve spent a lot of time working with federal agencies and coaching them through the transition to agile, but on first blush it’s not always easy to tell who’s really adopted agile versus those who just *say* they’re agile because they know they’re supposed to.

This is a critical concern as more and more of our government partners invest significant time into rethinking their investments in information technology and the methodology that they and their contracting partners apply in meeting project goals. It’s not that the goal is to be agile, it’s that there are improvements in productivity, quality, customer satisfaction, and time-to-market that we want to achieve by becoming agile, and to the extent that we fail to become agile, we will fail to reap those benefits.

## Understanding agilefall

Certainly [not a new concept](http://redmonk.com/cote/2006/05/31/agile-rebellion/), “agilefall” is the methodology that emerges when managers and stakeholders attempt to adopt agile practices they understand or feel they can tolerate, but still prefer that nice, top-down management approach that a waterfall methodology affords them. (Extreme simplification: “Waterfall” is about having the predictability of advance plans and internal processes, “agile” is about having the flexibility to adapt, learn, and change. For more on the differences between the two, see [here for agile](https://en.wikipedia.org/wiki/Agile_software_development) and [here for waterfall](https://en.wikipedia.org/wiki/Waterfall_model).)

A waterfall methodology relies on defining requirements upfront and then completing subsequent phases in order. Generally, this approach doesn’t work well for software development, since it’s incredibly difficult to understand what the best solution will be if you’ve never built it before. Agile, on the other hand, focuses on an iterative approach, placing working code above process. The result is that as the team learns what kind of product will be most beneficial to users, the team can rapidly adjust requirements to build a better solution. Iterative development of software may mean that what was initially envisioned as a solution and what is developed in the end may look quite different — but that’s a good thing when it equates to a truly useful, useable product and happier customers.

Agilefall is a natural conflation of the two approaches, and can result in poor outcomes since the structure of it introduces competing concepts. It’s hard to develop and design iteratively if managers are expecting to review progress as they always have. (This problem is often unfairly characterized as micro-managing behavior, but is more fairly recognized as a natural outcome of traditional business practices.) This doesn’t mean that a project is necessarily doomed, but it has the double-whammy effect of neutralizing agile's greatest advantage while retaining the most frustrating features of waterfall. Some people describe agile as an attitude and waterfall as a methodology. To highlight the difference, let’s explore a few examples.

## Clues your project may follow agilefall

You may find yourself wondering how far along that agilefall path your project or organization has wandered. Here are some clues that your project or organization has adopted agilefall:

### 1. Has nothing changed except the terminology?

*Your new Scrummaster (who was called your Project Manager until you “adopted” agile) continues to run the same every-three-months all-hands meeting that previously consisted of executives showing slide decks and talking about their personal goals, but now calls them “retrospectives” instead of “quarterlies”.*

This is a clear sign of agilefall. The project momentum and structure is unchanged, many of the same productivity and quality challenges exist, and team members quickly fall into — or never had to change — old routines. **Simply calling something “agile” or “iterative” does not make it so**. Agility is more a philosophy than a method anyway. Elements of agile, like sprint cycles, shouldn’t be co-opted simply as the new descriptions for the way you achieve your waterfall objectives. If you find yourself in this position, read on. Help is coming.

### 2. Is the first “sprint” devoted to writing immutable project requirements?

*Your product owner tells you they want a new iOS app for a new initiative. They want you to “use agile” because they’ve heard it helps developers build better things quicker and with fewer problems than waterfall. During your first meeting you begin by documenting all the things managers in the room tell you they want, and then everyone begins building out a schedule (probably called a “sprint cycle”) to build the new app.*

If, during the first meeting, managers in the room are already enforcing a product roadmap by determining which piece of the product will be built during Sprint 6 then you’re doing agilefall. Since your users should be helping you set your product vision and requirements, the idea that you can infer this with upper management on day one is 100 percent counter to that notion. In agile, management tells you they think they need an iOS app for their new initiative. The rest is up to the prospective users and the team.

### 3. Speaking of sprints, does everybody assume QA testing happens in the last two?

*Quality Assurance testing, user experience testing, and stakeholder review meetings are all scheduled to happen in the final weeks before your launch. When things fail, features are cut in order to make the launch deadline. When user research indicates that features should be added, changed, or eliminated, you make a note of it and tell them it will be in the next iteration if management approves.*

If you don’t test regularly, how will you know what to build? Successful iterative development relies on testing of the product (both the user kind and the black-box/white-box kind) throughout the development process, not just at the end. Testing at the end to ensure the product that management instructed you to build six months ago doesn’t crash is neither user testing nor agile, and why do user testing at all if you can’t change the product before launch?

The largest failure of agile teams worldwide is the failure to produce working software every iteration or on a regular, short cadence (kanban). Working software means tested, potentially shippable software. This drives the testing regimen. The agilefall sin is to not produce tested, working software regularly.

---

**“One of the unfortunate outcomes of this [waterfall] method is the common belief that testing should come near the end of the process, and should only be performed by those with no insight into the code and an adversarial perspective. While black-box testing can prove valuable, the concept that testing should *only* be a black-box process at the very end of development is a wasteful perspective. Why wait for a manual tester to catch a defect days, weeks, or months after it was introduced, when a unit test could have caught it before the original developer submitted the code?” — Mike Bland, 18F**

---

## Help! What should I do?

If the clues above sound like your organization, it’s probably well worth your time to invest in an agile coach and training session for your project managers and company leadership to help them fully adopt an agile methodology. (You can contact us at [inquiries18F@gsa.gov](mailto:inquiries18F@gsa.gov) if you’d like our consulting team to lead workshop for your organization.)

We’re aware that upper management is often cast as a pointy-haired villain in methodology examples. We tend to find this unfair, and believe rather that the waterfall issues you may encounter in senior leadership are more the result of old habits than control issues. Upper management often responds with great enthusiasm to the agile philosophy once they understand it properly.

Here are some simple approaches you can use in the meantime to get your project back on track:

1. **Identify barriers and pain points accurately.** Take some time with your team to visually draw out your project dependencies, goals, deadlines and major barriers. Are you missing opportunities in your process to adapt to user feedback? Are certain stakeholders only seeing progress at defined intervals, especially at the beginning and end of your project? Identify blockers and pain points like this and raise them with your team. If these areas are further complicating your development process and sidelining the user’s voice, try to involve key stakeholders throughout the process, and make sure they’re seeing the user feedback throughout the iteration process. Remember that your users are your customers, and if they’re unhappy, your project is unlikely to succeed. Such adjustments should be seen as a rational business decision.

2. **Dedicate regular intervals to conduct project-wide retrospectives.** Adopt the agile practice of team retrospection either after every iteration, or on a regular cadence. Ask yourselves, "How can we do better?" Ask some other agile teams without first-hand knowledge of your project to assess your current state and provide recommendations on how to further improve your processes. Ask for an honest assessment — does what you’re doing look like agile to them? Processes are difficult to improve unless you’re willing to ask the difficult questions and make improvements — and that’s part of what agile is all about!

3. **Get some professional help!** Still stuck? Call in support! 18F has an agile workshop that can be customized for your organization and is suitable for all levels. Getting outside support removes some of the burden from you and provides a more impartial outlet to discuss current implementation challenges. There are many government partners working through similar challenges — connect with them and figure out how they can help you advocate for change. Remember that even government agencies can benefit from a bit of healthy competition — after all, who doesn’t want to be on top of their game?

For further reading, check out [18F’s Agile Guide](https://pages.18f.gov/agile/).

We’ll discuss some other ways you can get your project back on the agile path in a future blog post. Have some techniques you’ve used in your organization to get things back on track? Let us know and we’ll include some examples from the community.

---
title: Catching up with the TANF Data Portal project
date: 2023-09-07
authors: 
  - lauren-frohlich
  - alex-pennington
  - christine-bath
  - alex-soble
  - selena-juneau-vogel
  - laura-gerhardt
tags:
  - agency work
  - interview
  - public benefits
  - hhs
  - 18f checks in
excerpt: >
  Around 800,000 low-income American families receive cash assistance through Temporary Assistance for Needy Families (TANF) each month. 18F and the Administration for Children & Families’ Office of Family Assistance partnered on building a new data portal for TANF. We caught up with Office of Family Assistance leaders to see how their agency is continuing with the work.

image: /assets/blog/tanf-data-portal-catchup/TDP-checkin--banner.png
image_alt: >
  Three potted plans in a row. The first is a seedling, followed by one with two leaves, and a larger plant that looks like a tree."
---

Around 800,000 low-income American families receive cash assistance through Temporary Assistance for Needy Families (TANF) each month. States, tribes, and territories use federal block grant funds to administer the program, and they must report data back to the federal government on a quarterly basis. 

18F and the [Administration for Children & Families’ Office of Family Assistance](https://www.acf.hhs.gov/ofa) partnered on building a new data portal for TANF to replace one over 20 years old. This new portal would upgrade the data reporting experience, improve data quality, inform better policy and programs, and ultimately help the low-income families that receive TANF. [We last blogged about this work in 2020.]({{ "/2020/12/17/18f-and-tts-office-of-acquisition-award-first-assisted-acquisition/" | url }})

We caught up with Office of Family Assistance leaders Lauren Frohlich (product owner), and Alex Pennington (technical lead) to see how their agency is continuing with the work.

### _What's been going on with the project since 18F rolled off in 2021?_

**Lauren Frohlich**:  A lot has happened. I think we were just getting our Authority to Operate (ATO) right as 18F was rolling off — so, we've had our ATO for two years now. We are in production and bringing in users; over 85% of our users have created accounts in the system, and we're getting great feedback. We're finally into the exciting parts of development with our vendor, and I think we see the end in sight for our old system.

**Alex Pennington**: The system is in use; that’s huge! Not only do we have the system up, but OFA is operating and maintaining the system, and [regularly pushing new updates to the code.](https://github.com/HHS/TANF-app) 

> Designing the contract and the system the way we did — for OFA to have control and input and be so involved in the development — I think it facilitates the ability to be responsive. It’s just 180 degrees from our past experience. It's so refreshing.
> <span>–Lauren Frohlich, Product Owner for the TANF Data Portal</span>

### _Yeah, that's a huge deal! We know there were certain things about the legacy system that were challenging. Can you talk a little bit about what's changing with the new system?_

**Alex Pennington**: The biggest thing is that our TANF partners immediately know that their data has been submitted. There is no question of, “do you have our data?” They can see it. And not only are they seeing those notifications in-app, but they're getting email notifications from us saying, “Hey, we have your data.” They can also see the history of all of their data submissions. Our engagement has really improved because the new system has enabled us to communicate more fluidly with our partners, and I’m so excited about that.

**Lauren Frohlich**: For our Tribal TANF program, that’s the biggest change. It went from them sending email to a black box resource mailbox, never really getting feedback unless something was wrong, and then it was months and months later until partners heard from us. Already in the new system, there’s that immediate confirmation that we got it, and being able to see the history. And, then there’s the promise of what’s next: to see the parsing and data validation errors in the app; it helps build trust with our users. 

### _What are the recent challenges or interesting problems that the team’s been working on?_

**Alex Pennington**: It’s definitely the parsing. The new app currently stores the data files, but it also will need to parse and extract data from the files.  We’re coming to terms with the fact that it’s not just the system that’s old and broken. It’s also how we organize our data that’s also old and broken. And our developers are seeing that. It’s making the parsing and validation process pretty complicated, understandably so.

**Lauren Frohlich**: Another thing is we’ve been onboarding more and more users. Naturally, the most excited, eager ones come on first. And now, we’re getting to more reluctant users who were happy with how things had been working. So that’s been a challenge. 

### _It sounds like you might have trade-offs between introducing new features and getting more partners on board. How has the team been balancing that?_

**Lauren Frohlich**: We’ve been laser-focused on what we've been calling parity, which is the set of minimum features needed to be able to decommission the old system and switch people over to the new one. After we get to that point, we will have to think a little bit more about future trade-offs and priorities. 

**Alex Pennington**: I would agree, and just to add onto that: Sometimes there are bugs, right? We prioritize fixing them if it prevents users from doing the minimum of what they need to do, submitting data. If there's a problem, like maybe the files are too large or something, and we catch that, then that's a hotfix. But other things, we put off until we're beyond parity.

### _We charted the emotional ups and downs as the product owner for this project back in 2021. Can we add emotional touchpoints to the chart after 2021?_

**Lauren Frohlich**: Yeah, there are some milestones we can definitely put on there.

{% image "assets/blog/tanf-data-portal-catchup/TDP-checkin--emotion-chart.jpg" "A line graph showing the TANF product owner’s emotional journey over 5 years. The line starts in the middle of the scale with 18F joining, and moves upward with an RFQ and contract being awarded. Things drop to an all-time low with plans for 18F to roll off in late 2020. The line trends upward when 18F adds post-award support and the project gets an ATO. Things drop again when 18F rolls off and the project has integration challenges. Emotions are consistently high after refocusing on parity, launching a production site, having 10 partners use the system, and onboarding more partners." %}

**Lauren Frohlich**: Getting to ATO, that was like a 7 out of 10. And, not to be too negative but there were definitely some low points. It started to turn up again after the integration challenges. Some high points were getting focused on feature parity with the old system and launching production. 

**Alex Pennington**: I rated v2.0 with real users off the charts because it was a great day! There were 10 users; 5 of them were states and 5 of them were tribes.

**Lauren Frohlich**: We’re now doing onboarding in full swing. I feel like we’re at a pretty steady pace. It’s leveling out a bit.

### _As you've been onboarding more partners into the system, have there been any good examples where someone has spotted an issue that the team was able to resolve or turn into a feature improvement?_ 

**Lauren Frohlich**: To select what state and tribe you are from, we have one combo-box. When users started using it, some tribes assumed that they had to select the state where their tribe is located. It wasn’t intuitive, a lot of forms don’t do it that way. It’s in our backlog to split it up so that you first select: “state, tribe, or territory.”

### _Can you tell me what makes you most proud about this project in the work that's been done?_

**Lauren Frohlich**: I'll say I'm most proud of Alex, just watching her master and navigate everything to find bugs and improve processes. I think of how far we've come as an office, in terms of our autonomy and control of our system. She is an empowered tech lead, and together with Thomas, our other system admin, they know the new system so well and it completely changes our ability to serve our TANF partners.

**Alex Pennington**: Thank you! I'm just thrilled that we can actually be responsive now to our partners. It used to be: “Oh, just wait a couple of days. Wait a week. We'll get back to you.” And now we can say: “Hey, start using it today.” It's been such a pain point, not just for them but for our team that works with the data every day. That changes the nature of the conversation, which is what OFA has been trying to do around our data — getting closer to the point where we can actually have conversations about, “what is this telling us about the families being served?” and not just about, “do you have your data?” I love that!

**Lauren Frohlich**: Designing the contract and the system the way we did — for OFA to have control and input and be so involved in the development — I think it facilitates the ability to be responsive. It’s just 180 degrees from our past experience. It's so refreshing.

Shout-out and kudos to the many, many team members at Administration for Children and Families, 18F, and industry partners who’ve supported this project and brought the TANF Data Portal to where it is today! ❤️

_Interested in how 18F can help your agency with legacy tech transformation, user research, and acquisition? We’d love to hear from you at [inquiries18F@gsa.gov](mailto:inquiries18F@gsa.gov)_



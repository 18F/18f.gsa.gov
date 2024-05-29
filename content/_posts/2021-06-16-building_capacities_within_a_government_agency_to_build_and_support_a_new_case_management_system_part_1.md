---
title: "Building capacities within a government agency to build and support a
  new case management system: part 1"
date: June 16, 2021
authors:
  - jessica-marine
  - vicki-mcfadden
tags:
  - product
  - open source
  - agency work
  - how we work
  - tax court
excerpt: This is part one in a two-part series with our partner team at the U.S.
  Tax Court about their experiences building their new, open source case
  management system, DAWSON. For this post, we chatted with Jessica Marine,
  Product Owner and Deputy Clerk of the Court, Case Services Officer.
---
*This is part one in a two-part series with our partner team at the U.S. Tax Court about their experiences building their new, [open source](https://github.com/ustaxcourt/ef-cms) case management system, [DAWSON](https://dawson.ustaxcourt.gov/). For this post, we chatted with Jessica Marine, Product Owner and Deputy Clerk of the Court, Case Services Officer. Jessica is the epitome of what makes a good product owner in government – strong ability to define success with clear objectives and execute against those objectives, excellent communication skills to build alignment, and a strong sense of mission. Bravo, Jessica, on all that you’ve accomplished. These are Jessica’s opinions and are not the official views of the U.S. Tax Court.*

*Quick plug: The Court is hiring for a remote position: DevSecOps Engineer. If you’re interested, please consider [applying](https://www.ustaxcourt.gov/vacancy_announcements.html)!*



## So thanks for taking the time to chat with us, Jessica. Let's just jump right in. Let's start with your background, and how did you find yourself in the role of Product Owner at the Court to lead this modernization effort?

I'm a tax attorney. I had no IT experience. I've worked in various positions over my tax career. I started out in law school at a low-income taxpayer clinic, and then I was in private practice representing taxpayers for several years. I've also been in various positions at the Court: I've been a law clerk to a judge, an Assistant Deputy Counsel, the Assistant General Counsel, and now the Deputy Clerk over Case Services. 

When the Court decided to move away from its legacy case management system and was looking for someone to oversee this project, I think my unique and varied background made me a natural choice. Because I had been in these various roles, I was able to understand the needs of our users and bring a unique perspective to the modernization effort.



## Let's zoom back to the start of the project. What were some of your initial reactions to building an open source product using user-centered design and agile development?

I thought using an agile development approach was very interesting, and I could immediately see the benefits of it. But I also was skeptical of whether or not it would really work in practice. 

We were used to thinking through and planning everything in advance – doing waterfall development – where you have a list of requirements, and you've dotted all your I's and crossed all your T's at the very beginning. 

So this notion of “you only need to plan for the next two weeks” is the complete opposite of how we usually worked. 

With respect to open source, that was a completely novel and foreign concept to me. Having a code base that anyone could use or contribute to seemed scary. There was an initial misconception that open source must mean less secure. And I think once we understood that, no, it didn't mean less secure, the pros outweighed the cons, if there were any cons at that point.



## How did those decisions work out for you?

It worked out great! We have built our new case management system and the only off-the-shelf product that we've incorporated was a scanning tool. So besides that one product, our project has been exclusively open source. And taking an agile approach has allowed us to reprioritize the work as we're going, making sure we were getting exactly what we needed for our minimally viable product (MVP). Ultimately, we launched in December of 2020, and have a great product to show for it.



## This was your first time acting as a Product Owner. What was your experience like?

It was a little scary because I didn't know exactly what a product owner should or shouldn't do. I had a steep learning curve because I didn't have any prior experience. But I took the role very seriously. 

I really owned the product. And I took ownership of the success or failure of the project. So I was willing to do and learn whatever was needed to make sure that the project was a success. And, I’ve learned a ton!



## How would you describe the role of the Court, 18F, and your industry partner in the field?

The Court was definitely leading the charge from day 1, but we relied on the experience of 18F and our industry partner to help make decisions along the way. While I felt very empowered to lead this project,18F was there for sense checks, as needed. If I had an idea or a question about something, I knew I could go to 18F. If you think about bowling, 18F was like the bumpers on the lane, making sure I didn't go off-track. 

And with our industry partner – they've been phenomenal. I think that going through the procurement process and making sure that we were getting a team that had the same vision for the product and was aligned with agile principles was very beneficial. They've been a stellar partner. 



## To launch the new system relatively quickly, I know you had to protect project scope. What can you say about some of your tactics when doing that?

Given that this was the Court’s first IT project of this size, and it was my first time serving in this role, I was really conservative. One thing I tried to do, maybe unconsciously, was under-promise and over-deliver. This helped manage expectations. 

We started very early on explaining what MVP was, and how the development process would work to our stakeholders so that they would understand they’re not going to get everything on day one. That also took a lot of change management and communication. 

I also made sure that stakeholders were involved in the process through recurring interviews and usability studies. Stakeholders were also involved in the sprint reviews, so they could see the progress that we were making and were able to give feedback. 



## One thing that I really liked that you did that I haven't seen a lot of agencies do is the “good, better, best” when defining MVP. Can you talk a little bit about that?

Actually, that was our industry partner’s suggestion in helping us develop the roadmap; especially knowing we had limited time to deliver MVP.  

The way we decided whether something was going to be part of MVP or not was: what is the minimum that someone needs to do their job? If something was required to do their job, it was part of MVP.  If there was some reasonable manual work around, or if the feature was a convenience, those were being held for after the launch of the MVP. 

Even with the features that we needed for MVP, there were degrees of difficulty in implementing each of those features. So we looked at each one, and did a “good, better, best” analysis. 

We then talked with the engineering team about the level of effort with each option. If there wasn't much additional lift to get from good to better or better to best, we tried to get as much as we could for users without expending an unnecessary amount of engineering resources.



## What has been your most rewarding experience on the project?

Actually bringing the product into production. We were told when we started out about how many IT projects fail, especially projects of this scope. We were also told that because we were doing big-bang cutover launch, it increased our chances of failure. So the likelihood of success was stacked against us. Actually being able to launch, and to be on the other side of that launch, in production and continuing to deploy new features, is a huge accomplishment and a testament to the team we had working on this project.  



## What new skills have you developed as a result of being Product Owner on this project?

I think what stands out to me is getting to the “why.” Why does somebody need something versus taking them at face value that they say they want something. It’s really opened my eyes to the fact that there's more than one way to do things. 

That investigation as to the “why” allowed me to really focus on what the users needed when defining MVP.  It also gave users a more sophisticated or more streamlined solution to their problem. Maybe they thought they needed X, but when it really came down to it, they needed Y and we gave them Y. It's actually working better for them.



## What was the largest roadblock or hurdle that you're proud that the team was able to overcome?

The Court had a 35-year-old, proprietary case management system, and had several decades’s worth of data that we had to migrate over to the new system. I’m proud we were able to accomplish that. 



## At some point in the project, you recognized the need for a Court employee to serve in the role of Technical Lead. How did you advocate for that at the Court?

The Court had never undertaken a project of this scope and size, and we didn't know what we really needed on day one. We relied heavily on 18F and our vendor. 

But as we became more experienced in this project, it became obvious that we shouldn't completely outsource ownership of the project, whether that be product ownership or technical ownership. We knew pretty quickly that we needed a Tech Lead to be a Court employee and not a contractor. We were very deliberate in our search, and it took a little bit longer than we would have liked, but we ultimately ended up with a great person in that role.



## What has been the reaction to the product? 

In general, we have gotten extremely positive feedback on the product. And most people understand that what we deployed in December 2020 is not the final product, and we'll continue to add new features. 

Overwhelmingly I have heard, “this is so much easier to use;” “it's so much more intuitive;” “I can get to what I need to get to.” 



## Do you think this project helped the Court with being prepared for remote work with COVID?

I do think that there were aspects of this project that helped. 

When we had to pivot to remote proceedings, one of the very first things we had to deal with was having remote communication tools. I'd been using a video teleconferencing product daily, so I was able to help advocate for that, and teach people how to use it. 

I was used to working with a distributed team. So moving all our employees off-site and having them work remotely was just like another day for me.

And I think the fact that the Court had been talking about agile, and how you don't have to know everything up front, and we can try something and if it's not working, we can pivot. We actually took that mentality when it came to implementing remote proceeding procedures. I think the mentality shift that was embraced by the Court as we progressed through this project helped with reacting to the COVID-19 pandemic.



## Can you offer any advice to someone new in government who is stepping into the role of Product Owner perhaps for the first time?

I think, first and foremost, it has to be a full-time position. You have to be empowered to act in the role. A Product Owner can't work by committee. 

I think someone who has deep domain knowledge would be preferable, because it's easier to learn product ownership skills than domain knowledge. 

Once you’re empowered, you have to keep that trust and support from your higher-ups. So making sure that you're managing up and keeping that confidence. That involves communicating, setting benchmarks and meeting them, showing you that you're making progress, and knowing when things need greater buy-in or approval. Being a good filter and being able to raise issues up when it's appropriate are key.



## What have you learned since launching the product in December that you'd like to share with future Product Owners?

That there will be a period of time, immediately after launch, where everything is in chaos. People will have a lot of questions about the system and a lot of bugs will be discovered. You have to be realistic about how many additional improvements or enhancements can happen during that time. 

We spent two years in development where we were adding new features nearly every day. And then we went into production and had to dedicate resources to bug fixes that weren't necessarily a daily part of our prior development cycle. We knew that, with launching a product of this size all at once, bugs would be inevitable. I’m really proud of the way we were able to prioritize and address them, but it wasn't obvious or clear to us that we should have expected about a three-month period of just trying to address bugs to get the system into a stable state before we continued making additional enhancements.

## Lightning round!

### So, how did you get prepared for taking on this role?

I read a lot. And I attended a scrum product owner training. 

### What's the number one trait you think it's important for a Product Owner to have?

Communication skills.

### When’s the last time you had to tell someone “No”?

Yesterday – but I did it nicely! I don't think I actually ever say “no.” I just explained to them how prioritization works and where whatever they want falls in relative priority.

### How did it feel completing the burndown chart?

You know, it was sort of anticlimactic in a way because I knew we just had another one coming right behind it. But I did feel a measure of success; to get over the finish line. But the race wasn't done yet (laughs). You got through — you won the race. But then it's like, oh, you have to start a new one all over again. We weren't done.

### How did you feel the first time that you discovered a bug in production?

It was expected. The way we reacted to it was exactly how we had planned, so it seemed like a well-oiled machine.

### What have you gotten spectacularly wrong recently?

The expectation that we would be able to continue to deploy new features right after going live.

### How were you feeling when the system went live?

I felt extremely calm – we had prepared as well as we could. We had tried to identify any risks and mitigate them. So at that point, there was nothing more we could do, but basically launch and then react if and when something happened.
---
title: "Building capacities within a government agency to build and support a
  new case management system: part 2"
date: June 17, 2021
authors:
  - mike-marcotte
  - mark-meyer
tags:
  - agency work
  - open source
  - how we work
  - agile
  - tax court
excerpt: This is part two in a two-part series with our partner team at the U.S.
  Tax Court about their experiences building their new, open source case
  management system, DAWSON. For this post, we talked to Mike Marcotte,
  Technical Lead on the project.
---
*This is part two in a two-part series with our partner team at the U.S. Tax Court about their experiences building their new, [open source](https://github.com/ustaxcourt/ef-cms) case management system, [DAWSON](https://dawson.ustaxcourt.gov/). For this post, we talked to Mike Marcotte, Technical Lead on the project. Mike joined the Court a few months before launch and hit the ground running to scale the product up to production and expertly steer it through a successful launch. These are Mike’s opinions and are not the official views of the U.S. Tax Court.*

*Quick plug: The Court is hiring for a remote position: DevSecOps Engineer. If you’re interested, please consider [applying](https://www.ustaxcourt.gov/vacancy_announcements.html)!*



## What is your background and how did you arrive at the Tax Court?

I got started in web development doing my own tutorials on JavaScript to land a job as a web developer at a small startup building radio station websites. This was the early 2000s when PHP was becoming really popular. I took it upon myself to learn PHP and MySQL, and I built a new CMS for our company. Over the next 15 years, this product kept growing and the company went through several rounds of buyouts. Eventually, after another venture capitalist buyout, the team contracted significantly and it was just me as the only developer on the team. 

It was my cue: I'd already been looking for different jobs in the area, and I just wasn't finding the right one. Then a friend I knew through swing dancing (I've been swing dancing for as long as I've been coding) mentioned I should check out USAJobs. It didn't take long to find this job. It felt like a little bit of a reach, but I was familiar with a lot of the tech stack so I thought it would be a great step in the right direction. It just felt like a really good fit, so I went for it with everything I had.



## What are the different parts of the team developing this product and how does a Technical Lead fit in?

There's a lot of different ways to fit into the various parts of this project. When I came aboard, the project was already moving at some speed. My initial goal was to just continue that momentum, especially as we approached launch. 18F had been on the project for a long time and had a lot of input into the process. The vendor team was working at full speed to build the features that were promised for MVP (the minimum viable product needed to launch). And the UX designer was doing user testing and tweaking some designs. 

I joined the vendor’s code development co-working sessions to see how they were working. At first, my goal was to continue that momentum, learn how this team functions, just get a sense for how I should fit in. 

I also had to answer questions that had been waiting for answers since before I joined. The team had queued up a lot of things for me to figure that they felt the Technical Lead at the Court should be deciding. 

At the same time, I am a translator and advocate for the Product Owner. Even though she has become very technical, having someone who can explain what's really going on underneath the hood helps us all work better as a team.



## What is the relationship between the Tech Lead and the Product Owner, and how do you collaborate?

It's about trying to maintain alignment, to sync often, and to make sure that you're on the same page. 

I handle a number of tasks that the Product Owner just can’t do. For example, I have access to all the application data; so at times, I'm just somebody who answers the questions she has and figures out how to present those answers with data. I weigh in on technical matters, especially when it comes to security concerns. 

But the project definitely follows the vision of the Product Owner. You can't really have a committee doing that. I’ve learned from her the differences between “good, better, best” as a development strategy. We are aiming for “best” but we might only land on “good” for now. But we'll get there. We have a good relationship — I think it's my strongest one at the Court. I fly underneath her wing, trying to keep her vision, while looking out for potential pitfalls and security issues.



## How is being a technical lead on a project like DAWSON different from being a developer or project lead in the private sector? Was there anything surprising about working on a project for a government agency?

Right off the bat, there's more sensitive information. Also, the way the government handles acquisitions means a lot of processes are different than in the private sector. 

The role of Tech Lead has been a little surprising, too, because my instinct is to jump in and solve problems. But with a vendor team, I’m often instead trying to describe problems rather than solve them. Trying to craft technical tasks, such that the vendor can knock them out of the park, can be challenging.

One thing I really had no idea of getting into government was the role of 18F and how invested you all are in setting me, the Court, and to some extent the vendor, up for success. There were a lot of deliberate steps taken to make sure that everything is working – because it really has to succeed. 



## You joined this product team about a year into development. Do you have any advice for folks joining an in-flight product team?

Sync as often as you can, even if it's brief. Sync with your Product Owner, with the lead of the vendor team, with the developers; daily if possible. You're going to have to put many coats of paint on your understanding of how everything and everyone works together. It's one thing to dive into the code, or to read everything, but really syncing with people was key.



## What were some of the biggest challenges leading up to the launch of DAWSON?

Migration was certainly tricky. It’s a lot of data to move from one place to another and a lot of work to look for issues or errors. There were a lot of big pieces moving around before launch, migration being only one of them. Practicing was vital. In the end, it felt like it became automatic. You know what that free-throw is gonna look like when you chuck it.

Scaling from proof of concept to production has a lot of challenges. Many things, like database changes, new features, and deployments that seem manageable with a proof-of-concept product and a small dataset became a huge challenge with a realistic production dataset and real users. The product needed to stay functional as we moved into launch. And you know, it did, largely because of how our cloud infrastructure scales. 



## What has been the most rewarding part about working on this project?

How much I'm learning about the cloud infrastructure and technologies that I didn't know about. This forced my hand to really get it — to be able to speak about these things from a place of understanding and competence. I feel like more than twice the developer than I was just a year ago. Even though I had been doing some good work before, part of me felt like I wasn't really operating at full capacity. This has really let me go in deep and see what I am capable of. With this kind of project, it feels like there are endless possibilities for learning and growing.



## Now that DAWSON is live, what are some of the challenges and important details to know about working on a project post-launch?

You had to start watching and listening. Watching the server logs and alerts and configuring them so you can accurately monitor the state of the application. Now that we're live, we are asking questions like, how can you still solve bugs in a day, while work continues on some heavy construction? Some big refactors within the system might take weeks, but you can't hold up bug fixes for those sorts of things.

We have worked to get to a place of stability such that you are not just reacting to things, but  are actually able to start moving in the direction where you want to be going.

We have finally — what is it four or five months in? — really arrived at what feels like a new comfort zone. The vendor team was able to start building the rest of the features that the product owner has prioritized. We have a handle on a lot of the high-severity and medium-severity bugs that cropped up immediately after launch. The errors in our server logs have largely dwindled, and it's becoming easier to tackle issues. We've been able to get to a place where we're comfortable deploying fixes on a daily basis. Now that we're here, we can consider continual deployments, and have that feel safe. I feel like that's within reach.



## Do you have any advice for someone interested in becoming or just starting out as a technical lead on a government project?

I think it's a really exciting time. I found it surprising that this project, for example, can use open source, modern tools like NoSQL databases and serverless infrastructure and be successful. And with help from 18F, we can find really cutting-edge solutions to moving gigs of complicated data for testing purposes predictably and consistently. 

You can really make a difference in any organization and be impactful. It feels like a really exciting time where technology has reached the point that you can stand up an API quickly and safely, and you can really start doing some great, impactful work. The government seems to need that right now. It’s a great time to make a huge difference and build some great infrastructure for your country. 

My dad worked for a federal agency decades ago. He told me not to work in government, that it would suck your soul away. But it feels different now. Maybe it's just because I'm in this small little bubble, on a project with the Court. But the fact that this project can be built in such a way, that it is open source, and can be built upon. I had no idea. 



## The Tax Court is planning on expanding its technical staff to support continued development on DAWSON. Can you talk a little bit about the planned technology team that will support DAWSON?

It's a team that's going to grow over time as we take full ownership of this product to maintain it and build upon it. Right now, we're looking for somebody to back me up, be a sounding board, and bring ideas to make this product more dynamic, more performant, easier to maintain, easier to deploy, and easier to work with. There's so many ways that technology can support our users and provide the public with a good experience when working with the Court. We are looking for people who are excited about automating, reporting, deploying code to production, and testing. We're looking for a bit more muscle to take on tasks like making features that improve user experience, integrating with internal systems and our helpdesk, and working toward zero-downtime deployments.



## Lightning round!

### What were you thinking when you saw your first bug in production? 

What the heck is that doing there? You build this huge thing and it does so many amazing things. How could you get this one little thing wrong? In this case, it was a practitioner's inability to update their firm name when they're changing their address. No matter what they changed their address to, they were still at the same firm. It was just an easy oversight. There's so many things and so many layers of complexity here. 

### How did you feel when the system went down for the first time?

The first notable one was the day before Thanksgiving because it affected our Thanksgiving plans. It was a huge cloud provider outage. The Court was scheduled to do a big manual test of the migration data and everything just went down. It just felt like it was at the worst possible time. And we were wondering: oh my gosh, is this going to happen all the time? Is this going to be the new reality? There were lots of strange fears about how viable this was. But this does happen – it's outside of your hands.

I think it was a good fire drill because we hadn't gone live to the public yet. It was really only Court users that were experiencing it. Having that dry run hurt a bit at the time because of its timing, but it also felt good to practice it.

### Biggest compliment from a user (internal, external) you’ve heard about the new system?

“Everything is so much faster.”
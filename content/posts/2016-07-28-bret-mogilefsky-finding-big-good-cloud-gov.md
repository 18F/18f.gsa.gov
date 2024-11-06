---
title: "Bret Mogilefsky: Finding the big good in cloud.gov"
authors:
- melody
tags:
- staff profiles
- how we work
- cloud.gov
excerpt: "Bret Mogilefsky spent most of his career working in the game development industry. He came to the government seeking the best way he could have a big impact and do big good."
description: "Bret Mogilefsky spent most of his career working in the game development industry. He came to the government seeking the best way he could have a big impact and do big good."
image: /assets/img/team/bret.jpg
hero: false
---
*All throughout the summer, we’ll be profiling members across the 18F
team. Bret Mogilefsky joined 18F in July of 2015 after a long and
illustrious career at the game development firms LucasArts and
PlayStation. He serves as the Product Lead for [cloud.gov](https://cloud.gov/),
a new platform that enables small federal teams to rapidly develop and
deploy web services with best-practice, production-level security and
scalability.*


<aside class="pquote pquote-single">
	<img class="pquote-img" src="{{ image }}" alt="Bret Mogilefsky">
	<blockquote>
		<p>"It was the best way I could have an impact and do big good. I mean that in caps, DO BIG GOOD — I wanted to have the biggest possible impact in a good way."</p>
	</blockquote>
</aside>


**Melody Kramer: Tell me about a bit about your path to 18F.**

**Bret Mogilefsky:** I have a degree in Computer Science and Applied
Mathematics from the University of California at Berkeley.

I spent most of my career working in the game development industry. I
first worked at LucasArts, where I was the lead programmer and assistant
designer of Grim Fandango, a beloved 1998 LucasArts adventure game,
before migrating to the PlayStation team at Sony.

At PlayStation, I managed the developer services group and helped
pioneer the use of web-based support for pro game developers. I also
spent time in PlayStation's R&D group, where I worked on
non-photorealistic rendering techniques for the PlayStation 2.

I spent over 15 years working on the PlayStation team in senior-level
positions. I’ve held roles including product manager, system architect,
product owner, development manager, program manager, mentor, and
customer-facing tackle-dummy.

I worked at the platform level, which means I worked on software,
libraries, conferences, and support channels, but not on specific games.
While there, my greatest achievement was putting developer experience at
the top of the priority list for PlayStation 3. When it launched,
developers really disliked it, and I started an advisory panel process
to do user research about what it was like to develop on the platform,
and brought that firsthand to the top of the company in Japan. Had we
not done that, I think PlayStation 3 might have been a failed platform.

**MK: That’s very different from the federal government. I’m wondering
how you found out about 18F?**

**BM:** I did pretty well at PlayStation. But I reached a point where I
wasn’t necessarily learning. I had a career path moment where I hit my
ceiling there, and had to decide whether to stay or leave, and what I
wanted to do with the rest of my life.

During that time, I thought a lot about what was the most impact I could
potentially have by staying. And fundamentally, it boiled down to making
it easier and cheaper to make console games. And I thought maybe it was
better to take the skills I had learned at PlayStation — I acquired an
incredibly deep set of skills around practicing and scaling agile
development while navigating and negotiating my way around a giant
company — and use them in a place where it would have a bigger impact on
the world.

I have always advocated for greater government transparency and action
on major issues affecting U.S. citizens, but I always had to do this in
the margins of my professional and personal life, and as just one person
in a crowd. I started to think “What if my day job scratched the itch
for impact?”

I started asking around and talking to people and looking at places
where I thought I would be a good fit — and eventually ended up talking
to two friends, one of whom had worked at Sony and later the Office of
Science and Technology Policy, another who worked in game development
before founding Code for America. And they told me about 18F.

I had never thought about working for the government, but after I
learned about 18F, I couldn’t get it out of my head. I looked at all of
the various offers I had and things I could do, and I kept coming back
to 18F. It was the best way I could have an impact and do big good. I
mean that in caps, DO BIG GOOD — I wanted to have the biggest possible
impact in a good way.

18F enables me to apply my experience and natural love of agile methods
to root causes that directly impact the effectiveness of government...
as my day job! That is a unique and special thing. And I get to be home
before my kids are asleep. They’re young, and it was very hard when I
was a game developer to carve out time to see them. Now, I cook dinner
most nights, and I see them, I can pick them up from school, I have a
flexible schedule, and I have a job that mainly fits into normal hours.
I’m ambitious, so sometimes it stretches, but I am dealing with fewer
time zones in my work, and that makes it much nicer for me.

**MK: You work on cloud.gov, a platform that will consolidate multiple
government agencies' IT operations activities in a single system that
will improve the resiliency and security of agency applications. Can you
tell me a little bit about that platform and what you do?**

**BM:** I work on cloud.gov. It is a very good project for me because it
fits my background around platforms and devops and supporting
communities of technical people.

My ambition for cloud.gov is for it to act as a "force-multiplier" for
the entire set of people working to improve government services, leaving
them happier and more effective!

I [use a metaphor of ships and
shipyards]({{ "/2015/10/09/cloud-gov-launch/" | url }}) to explain
what cloud.gov is. Boat-builders don't launch ships by backing a trailer
down a boat ramp. Every boat they make is going to get launched, so they
use a shipyard to make it as easy as possible to build right near the
water and get it launched quickly and easily, even at battleship scale.
[cloud.gov](https://cloud.gov/) is the shipyard.

There are over 4,000 pages of compliance policies you need to understand
to be an expert on all of the requirements for launching a government
service. There are new publications all of the time to stay on top of,
to monitor changes — and all of this is provided as documentation, not
tools.

Getting familiar with the entire checklist of compliance policies takes
a lot of time, and there’s a lot of back-and-forth needed between
developers, operations, and compliance experts to make stuff happen and
get it shipped. The magic happens when an infrastructure team
encapsulates their expertise, and then exposes that expertise as a
service which can be used directly by developers. This is what's known
as "Platform-as-a-Service" (PaaS), and it's a force-multiplier that
bridges that gap between small service teams and advanced infrastructure
skillsets, while keeping your headcount under control. 18F has built on
the open source project [Cloud Foundry](http://www.cloudfoundry.org/)
to create our own PaaS, cloud.gov.

**MK: What have been some of the challenges that you’ve faced while
working at 18F?**

**BM:** I had to learn how government approaches technology in
traditional ways in order to think about how to best build cloud.gov. I’m constantly
thinking “What does the product have to be in order to be appropriate
for government? Why is it different?”

**MK: Have you overcome any obstacles during the cloud.gov build?**

**BM:** A few months ago, we were informed that the version of cloud.gov
we had, which was running on AWS East/West, would not be considered for
FedRAMP authorization unless it was on AWS GovCloud.

We developed for a long time without that key piece of info. Obtaining
FedRAMP authorization is critical because agencies won’t adopt a new
product without that key social proof. So we had to scramble to redeploy
the entire platform, which involved automating everything about the
deployment, and we did it in record time. We rallied and we managed a
huge amount of complexity to get it done, and get it done on time.

**MK: What has been most surprising to you about joining 18F and the
federal government?**

**BM:** I felt like I found my tribe. My whole life, I had been an open
source advocate and user and a secret policy wonk. I found out I'm an
impact junkie, and I found that 18F was filled with people like that.
It’s really nice to be in a community of people who share things and are
constantly learning and are really passionate about their work.

**MK: I think a lot of people would envy your previous position in game
development. What would you tell a former colleague at PlayStation who
was interested in coming to 18F?**

**BM:** Games are cool, and games are fun, but if you look at the arc of
game history, games fundamentally fill the same role in society. Once
you’ve been exposed to enough of that, you realize the actual impact of
any individual game is less than what you could do by improving the
government. Also, having kids made me think a lot more about the future
and what comes after me and what will change. The world will get better
or worse depending on what we do now, but games will mostly remain the
same: entertainment.

**MK: Post 18F, what do you hope to take with you?**

**BM:** The experience of going from startup to enterprise mode, in
terms of the size of the organization. And also some of the
organizational elements that emphasize learning and sharing. I want
wherever I go next to focus on that as a core.

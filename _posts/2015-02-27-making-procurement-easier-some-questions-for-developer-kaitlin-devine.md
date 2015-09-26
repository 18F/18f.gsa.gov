---
title: "Making procurement easier: questions for developer Kaitlin Devine"
layout: post
image: /assets/blog/discovery-launch/discovery-dashboard.png
date: 2015-03-05
tags:
- procurement
- discovery
- kaitlin devine
- user research
- interview
authors:
- boone
- elaine
- melody

excerpt: "We recently sat down with Developer Kaitlin Devine and asked her a few questions about Discovery, a new product designed to make government procurement more efficient."
description: "We recently sat down with developer Kaitlin Devine and asked her a few questions about Discovery, a new product designed to make government procurement more efficient."
---


We recently sat down with Developer Kaitlin Devine and asked her a few
questions about 18F and government procurement. Not familiar with the term
procurement? It basically means buying stuff. A self-described
“procurement nerd,” Kaitlin has been working on a project to make the
procurement process a lot more efficient within GSA. It’s called [Discovery](https://discovery.gsa.gov/) and [launched in March 2015](https://18f.gsa.gov/2015/03/04/annoucing-oasis-discovery-making-market-research-easier/).

**What do you do at 18F and why did you want to work here?**

My name is Kaitlin Devine and I’m the director of engineering. I’m also
a Python developer working on a few projects here. What I love most
about working at 18F is that it’s very new and exciting and there’s a
lot of opportunity to craft it in your own image if you can or are
willing to.

**What are you working on these days?**

I’m working on a project called Discovery for a client called OASIS.
(Learn more about OASIS
[*here*](http://www.gsa.gov/portal/content/161367).)

**How would you describe Discovery to someone who doesn’t work in the
government?**

Probably my elevator pitch would be that it’s an Angie’s List for
government contractors.

![Screen: Discovery Homepage](/assets/blog/discovery-launch/discovery-intro.gif)

**So it’s a way for government contractors to find out information?**

Discovery is a way for contracting officers to look for qualified
vendors. In government, it’s important to see how many vendors there are
with specific designations (such as being a small or veteran-owned
business), who can perform the work that you need, and to make sure you
have the minimum level of competition. If you don’t have three bids on a
project, then you don’t have enough competition for it to be a
competitive procurement.

**So I’m working at GSA and I need to order pencils. Let’s say I need to
order a whole slew of pencils for a project. So I would say “I need
pencils” and would I put that on Discovery?**

Discovery is actually specific to professional services.

**Oh okay, so let’s say I need accountants.**

Exactly. If you needed accountants, you would say “I need accountants.”
And then you can restrict it even further, to different classifications.
For example, you can restrict your search to small businesses or
veteran-owned businesses. You can also easily see the number of
contracts each vendor has formed in each business area.

**Are there ways to review people?**

That’s actually planned for one of our future releases of Discovery. So
right now, there is a database called PPIRS (Past Performance
Information Retrieval System) where contracting officers review and rate
contractors who have done business with them before, and then the
contractors have an avenue to dispute that, if they don’t think it was
an accurate rating.

Contracting officers are supposed to look in that database before they
award contracts. However, after speaking with contracting officials,
they said that the performance review data was both difficult to view
and use. Discovery will incorporate that data and the historical
contract information that we have now to make this kind of cohesive
picture of who this contractor is, what their past experience is, what
things they might be good at and what things they might not be so good
at, all based on their past performance reviews.

**So five years ago, if I were somebody going through this process, how
would I have done it then?**

Something totally manual, not automated at all -- very time consuming.
It’s referred to as the market research process: you basically Google
around for contractors or you call up contractors who had done some work
for a fellow contracting officer and say, “Here’s what I need to
contract out. Have you worked on this before?” It’s a very manual
process and it’s one of the most time consuming parts of the procurement
process.

The idea is to also potentially reduce the need to issue an RFI, or
request for information. That’s basically a broad call to all vendors
which says ‘This is what we’re thinking of buying. What do you think?
Are you capable of delivering on this? Would you consider bidding?’ --
that kind of thing. And that process itself takes two months or so, at
least. So the idea is to turn this manual process into a five minute
process using Discovery.

**What about the project do you think shows off what 18F does, or a part
of 18F?**

I think it’s a great showcase for our user research and user experience
designers. The client originally had one thing in mind to build, but
especially since no one on the team except for myself was familiar with
procurement, we ended up interviewing users about the procurement
process in general and about the entire lifecycle of procurement. We
then tried to zero in on what their main pain points were. And then we
winnowed down on this market research aspect of procurement and did more
interviews just on that. And every sprint, we’ve tried to interview
someone testing the current product at the end of the sprint and get
feedback and incorporate that, and consistently question previous
assumptions that we had made about what the user needs. So I think it’s
a really great example of this whole discovery phase before you even
write one line of code.

**And what did the client want initially? You said you were able to
pivot the project? What did they come in asking for?**

They originally wanted something called a task order authoring system. A
task order is just another word for contract and task order authoring
refers to the drafting of what will become the final contract. But that
step comes after the whole market research phase. But when we
interviewed users, they said “Hmmm.” That wasn’t their biggest problem
by a longshot.

The market research is what really takes a long time and we needed the
client to know that. We said ‘We’ve talked to a lot of users and this is
what they need’ and added that when we talked to users, nobody was
really that excited [about the task order authoring system]. Some people
already have tools and said ‘We already have something for that.’ And
luckily, we have a really great client who trusted us and saw the
research and said ‘Alright, let’s do the [market research product].”

**So you’ve mentioned the word discovery. I know you’ve touched upon it
a little bit, but would you mind explaining what discovery means in this
context and how it was applied to this project?**

Basically we had this whole process that we did before starting on the
project or coding it up. Research into procurement was our broad area of
focus. First, we tried to interview a lot of people to get a snapshot of
what the whole process was like, and then we did research into this
particular vehicle, which caters to professional services. So we did
even more discovery and more finetuning on that topic. In gaining both
an understanding of the space and of user needs, we were able to say
‘This is what we need to build. And not this other thing.”

**What has the feedback been from the client? What have you heard since
this has been released?**

We actually did a demo day for 18F and this was one of the projects we
demoed and people were really, really enthusiastic about it. One of
GSA’s main business lines is procurement - we procure things for other
agencies - so people were really excited about it, because even in it’s
initial release, it takes something that takes several hours to do and
you can do it in about four minutes. So people were like ‘Oh my gosh,
this is amazing.” And we got a lot of feedback and people were really
interested in it, and asking for different features. It was great
because the well was going dry in terms of finding users to interview,
so that helped us expand the pool to find people who could give us more
feedback on it. The user feedback is the linchpin of this whole process.

**How many people will use this tool once it’s out in the wild?**

A lot? I don’t know. Probably thousands. It’s a procurement vehicle that
is accessible to anyone in government, not just the GSA.

**It sounds like it can also make it easier to find potential
contractors that you didn’t know about.**

Right. And you get to see a lot more information about them. In the
Discovery search results, we order vendors by the number of contracts
completed in the industrial category the user is searching in, so their
level of experience in that particular area of work is obvious at first
glance.

**Oh okay. Can people sort in other ways too?**

Yeah, so there’s the set-aside factors -- which are like veteran-owned
businesses or women-owned businesses or service-disabled veteran-owned
businesses. You can also see if various contractors have been suspended
or debarred from doing business with the government. Contracting
officials will see a big warning message in Discovery if the contractor
they are looking at has been suspended or disbarred. We pull that
information from another government database nightly so there’s no lag
time between when their suspension is reported and when the contracting
officer finds out.

**Have you estimated how much money or time this will save people over a
certain time span? What are your metrics for success and are those tied
to revenue or savings?**

We haven’t really estimated that. It would be estimating reduced labor
hours contracting officers spend on this process more than anything
else. But my guess is that our best metric will be adoption. In
procurement, people do things in a lot of different ways and a lot of
the time, it’s just based on what your mentor taught you when you came
into government procurement. So I think if we can get more people to
adopt it and we see increased usage over time, then that will be a
really good metric.

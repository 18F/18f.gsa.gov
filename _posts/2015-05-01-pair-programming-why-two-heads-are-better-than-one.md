---
title: "Pair programming: Why two heads are better than one"
date: 2015-05-04
layout: post
authors:
- melody
tags:
- developer
- coding
- how we work
excerpt: "At 18F, we frequently use pair programming, a technique where two developers work together on one screen. We asked two developers at 18F how they pair program and why they find it useful."
description: "At 18F, we frequently use pair programming, a technique where two developers work together on one screen. We asked two developers at 18F how they pair program and why they find it useful."
image: /assets/blog/pair-programming/annalee.jpg
---

<div class="align-center" ><img style="margin-left: 30px;" alt="Annalee Flower Horne" src="/assets/blog/pair-programming/annalee.png" class="align-left" />
<img style="margin-right: 30px;" alt="Catherine Devlin" src="/assets/blog/pair-programming/catherine.jpg" class="align-right" /></div>

Developers Annalee Flower Horne and Catherine Devlin worked together on
[a project](https://github.com/18F/afsbirez) to make it easier for
small businesses to participate in the Department of Defense’s Small
Business Innovation Research Program (SBIR-EZ.)

Annalee and Catherine frequently pair program when writing their code.
When developers pair program, they work together on one screen. One
developer writes the code, while the other reviews each line of code as
as it’s written and offers helpful suggestions while checking the code
for errors.

We asked Annalee and Catherine to talk about how they pair program and
why they find it useful. Naturally, they did the interview together.

**Melody Kramer: Could both of you talk about what pair programming is, and what
benefits you get from pairing with each other?**

**Catherine:** "Two brains, one keyboard." We spend a portion of the
workday programming as a pilot and co-pilot, occasionally switching
roles. It sounds counterintuitive — **won’t you get half as much done
that way?** — but programming is always limited by our understanding,
not speed of typing. A second perspective can cut through problems that
could frustrate a single programmer for hours.

Also, pair programming is naturally a communication activity. We need to
explain each suggestion and each choice to each other as we go, which
helps us clarify our thoughts and clarify the code that we’re writing.

We live in different places, so we’ve needed to put some special effort
into the mechanics of remote pairing. I’m not sure we’ve settled on our
perfect environment yet, but we’ve found a few systems that allow us to
work well together, despite our geographic distance.

**Annalee:** Developers have a joke about "rubber ducking" code, which
comes from a story about a teacher’s aide who made students explain
their problem to a rubber duck before they could ask the aide for help.
Usually, in the course of explaining the problem to the duck, they’d
figure out the solution.

A lot of programming problems are like that — the hardest part is
defining the problem. When pairing with someone, you and your partner
are each others’ rubber ducks. As Catherine says, it really helps
clarify our thinking, which in turn clarifies our code.

The other advantage for me is that pairing really helps keep me on task.
It’s easy to get distracted when you’re coding, because in the course of
solving one problem, you’ll run across other things that can be fixed.
When you’re with a partner, it’s a lot easier to say "Okay, we agreed we
were going to work on X, so we should stay on that, and take a look at Y
and Z later."

**MK: What do you use to make the distance easier?**

**Annalee:** We have a few tools we use. Remote pairing software helps
keep us on the same digital page while we’re working. Video calling
software with screen-sharing also comes in handy. Our usual setup is a
phone call (with a headset) and remote pairing software.

**MK: Was there a learning curve when you decided to try this?**

**Annalee:** I mostly learned to code by pairing. When you’re learning
programming, there’s a big gap between finishing up a programming class
and actually being ready to dive in on a real project, so I was always
looking for people to pair with. I tend to think of pairing as a process
that helped flatten out the learning curve on programming, rather than
it being a learning curve of its own.

With distance pairing, I wouldn’t say it was a learning curve, but we
definitely had to figure out a technical setup that’d work for us. The
first few times, it took us quite a while to get set up before we could
get to work.

**Catherine:** Aside from the remote logistics problems, my only real
learning curve was an ego one — learning to stop worrying about what
somebody would think if they saw the stop-and-go, blunder-rich path my
coding actually follows! Once I got the courage to actually sit down and
do it, it turned out to be a very natural way to work.

**MK: Does it ever make it harder because you pair program?**

**Annalee:** I can’t think of a time when pairing has made a task more
difficult. For me, it almost always makes tasks easier and faster.
That’s surprising to me, because I’m a huge introvert. If someone had
told me before I started coding that I’d be at my most productive when
working line-by-line with someone else, I’d have laughed.

Part of that is probably learning how to pick good tasks for pairing.
It’s not the right choice for every task.

**MK: Are there certain tasks where it doesn’t make sense to pair?**

**Annalee:** For tasks where the problem is very well mapped out, it can
be easier for one of us to just fix it rather than waiting for the other
person to be available to pair. If you already know the solution and the
other person’s not going to learn anything from being walked through it,
there’s no reason to schedule it for pairing.

The other end of the spectrum often isn’t good for pairing, either —
where a problem is way too undefined to start work yet. Sometimes it can
help to refine the problem together, but sometimes it’s just that
someone needs to do some research. It doesn’t take two people to read a
manual, and reading it out loud to each other isn’t going to make it go
any quicker.

There’s a goldilocks zone in the middle, where a problem is ready to be
worked on but not yet solved. We usually hit it after one of us has
tackled the problem and gotten stuck.

**MK: If someone wanted to try this, how would you recommend getting
started?**

**Catherine:** If none of your coworkers are interested, ask at your
local programmers’ user group — they should have heard the buzz and be
curious to try. If there’s a large experience difference between the two
of you, the least experienced programmer should be the one on the
keyboard — at least until you both appreciate the process enough to
resist the temptation for the veteran to zoom along while the newbie
tunes out.

**MK: Do you have any rules that govern the rules of the pair programming
relationship that you follow? For instance, Greg sits on his hands when
he’s in the co-piloting position.**

**Catherine:** We noticed that we burn mental energy faster while we
pair, so we semi-formalized an expectation not to do more than an hour
or two at a time before returning to solo mode for a while.

We also keep talking about what we’re doing, and why, while we’re doing
it. That’s part of what brings the benefit — it makes reasoning explicit, putting
everything to a real-time ["Zen of
Python"](https://www.python.org/dev/peps/pep-0020/) test ("If the
implementation is hard to explain, it’s a bad idea").

There’s a pattern here — we haven’t really needed to make our practices
into rules. Talking about what you’re doing, saying goodbye when you’re
exhausted — these unspoken expectations of social interaction are
actually good rules for pairing, too. Perhaps more adventuresome
cross-cultural pairing would call for more explicit rules.

--

Pair programming is not for everyone. The sharing and teaching involved
in pair programming helps us describe what we’re coding to agencies
throughout the government in addition to improving the skills of our
team members.

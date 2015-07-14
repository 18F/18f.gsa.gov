---
title: "Agile Development’s Secret Weapon: Transparency"
layout: post
authors:
- vdavez
- chrisc
tags:
- agile
- how we work
- transparency
excerpt: "18F Consulting recommends Agile development for several reasons, including Agile’s emphasis on user needs, continuous integration, and rapid adaptation to changed circumstances. But there is another important reason we recommend Agile: its focus on transparency."
description: "18F Consulting recommends Agile development for several reasons, including Agile’s emphasis on user needs, continuous integration, and rapid adaptation to changed circumstances. But there is another important reason we recommend Agile: its focus on transparency."
image: /assets/blog/how-to-github/image.jpg
---
[18F Consulting](https://18f.gsa.gov/consulting) recommends Agile
development for several reasons, including Agile’s emphasis on user
needs, continuous integration, and rapid adaptation to changed
circumstances. But there is another important reason we recommend Agile:
its focus on **transparency**.

Two of the 12 principles of the [Agile
Manifesto](http://agilemanifesto.org/principles.html) are: *“Deliver
working software frequently, from a couple of weeks to a couple of
months, with a preference to the shorter timescale*” and “*Working
software is the primary measure of progress*.”

Embedded in these principles is primacy of working software as a
**measure of performance**, which is **highly visible**. After each
iteration or sprint (usually every two weeks), an Agile team’s success
can be measured by whether the software works, or whether it doesn’t.
This frequency of inspection creates a powerful transparency tool for
product owners (agencies) who want to ensure that their Agile teams
(often vendors) deliver a high-quality service, and to hold them
accountable when they don’t.

How do you distinguish working from non-working software at the end of
every iteration? This is where the concept of “done done” in Agile comes
into play. When a unit of work, which is normally expressed as a [user
story](http://guide.agilealliance.org/guide/user-stories.html), can
potentially be released into a production environment at the end of the
iteration, it’s considered “done done.” To be “done done,” a user story
must satisfy both the product owner’s [user acceptance
criteria](http://www.leadingagile.com/2014/09/acceptance-criteria/) (or
functional criteria) and [definition of
done](https://www.scrumalliance.org/community/articles/2008/september/what-is-definition-of-done-(dod))
(or quality criteria). Simply being coded isn’t enough.

Your definition of done should include everything required to make the
user story **completely done**. Creating (and maintaining) a checklist
of user-story-completion criteria is a great way to ensure your Agile
team understands what “done done” means. Here’s a sample checklist that
we’ve modified from the book [*The Art of Agile
Development*](http://www.jamesshore.com/Agile-Book/) by James Shore:

1.  **Tested:** all unit, integration, and customer tests are finished
2.  **Coded:** all code is written
3.  **Designed:** code has been refactored to the team’s satisfaction
4.  **Integrated:** the story works from end to end — typically, user interface to database — and fits into the rest of the software
5.  **Builds:** the build script includes any new modules
6.  **Deploys:** deploys to the target environments (e.g., staging) successfully
7.  **Migrates:** the build script updates the database schema if necessary; the install migrates data, when appropriate
8.  **Reviewed:** customers have reviewed the story and confirmed that it meets their expectations
9.  **Fixed:** all known bugs have been fixed or scheduled as their own stories
10. **Accepted:** customers agree that the story is finished
11. **Documented:** when appropriate, documentation such as a training guide is created or updated

Unless you know when user stories are truly done, you’ll have little —
if any — insight into the performance of your Agile team. As you assess
your team’s performance, use both *user acceptance criteria* and the
*definition of done* to inform your assessment. Doing so explicitly
ensures that you can measure your Agile Team’s performance in a highly
visible way, and focus on what counts: working software.

If you’re interested in learning more about how Agile can provide
greater transparency in your new or existing projects, [email us at 18F
Consulting](mailto:Inquiries18F@gsa.gov). We’d also love to hear your
perspectives and learn from your experiences; if you have used Agile in
government to help promote transparency, drop us a line.

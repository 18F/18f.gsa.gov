---
title: "The life-changing magic of writing release notes"
authors:
- manger
tags:
- best practices
- product
- fec.gov
- convincing stakeholders
excerpt: "A key part of agile development is constantly shipping new features. With so many changes happening to the product, it can be hard to keep track of how the product is growing and improving. Release notes help keep everyone on the team in the know about what’s shipping, give a clear list of features to check, and help always frame our work in terms of the value it delivers to users."
---
A key part of agile development is constantly shipping new features. The
team behind the Federal Election Commission’s (FEC) beta website ships
new features at least once every two weeks. Sometimes the features are
big, noticeable changes, such as the [new home
page](https://beta.fec.gov/) we recently launched. And other times
they’re small (a copy edit, an adjustment to a button) or under-the-hood
(changing the way a database works).

With so many changes happening to the product every two weeks, it can be
hard to keep track of how the product is growing and improving. After
several months of regularly shipping new features, we found our 18F team
and our partners at the FEC needed a better way to keep track of what
improvements are in each release. Sure, we would have dozens of
completed user stories and squished bugs, but with a complex application
it was hard to turn a set of closed GitHub issues into a human-readable
narrative.

So several months ago, we started keeping a running log of [release
notes](https://github.com/18F/FEC/blob/master/release_notes/release_notes.md)
in order to tell a clear story of each iteration. These notes help keep
everyone on our team in the know about what’s shipping, give us a clear
list of features to check on staging, and help us always frame our work
in terms of the value it delivers to our users.

## How we write release notes

Our process for writing release notes is simple. On the Friday before a
release (we deploy a new release every other Wednesday), I will draft a
document of bullet points covering the new features we’re shipping. This
will then serve as the outline for the demo to our partners the next
Monday. After the demo, I’ll share the document with everyone on the
team and invite edits and additions. Once we agree on the content, I’ll
move it to our Markdown file in GitHub and push the change when we
deploy the release. All-in-all, it probably takes less than an hour of
collective time to craft a concise set of bullet points.

There are different approaches you can take to writing release notes.
These are some of the tips that we’ve tried to abide by:

-   **Write for humans:** Step back from the language of software development and describe features in plain language. It helps to have a non-technical person proofread everything, with bonus points for somebody who’s not even on the project.

-   **Focus on the value:** When describing features always talk about the value of these features. This is both useful to the reader and keeps your team oriented towards providing value for users.

-   **Organize:** There are different ways to organize notes. Previously, we structured them by the main areas of the site, with bullet points for each. More recently, we’ve switched to organizing points under “Added”, “Changed”, and “Fixed” headings suggested by [Keep a Changelog](http://keepachangelog.com/en/0.3.0/) (other suggestions include “Deprecated”, “Removed”, or “Security.”)

-   **Don’t include everything:** Don’t stress out about including every change that was made to the product if those changes don’t have bearing on your users.

-   **Provide links:** If the feature lives on a page, provide a link right in the notes. This makes it easy for the team to review features and for readers to know what you’re talking about.

-   **Share it with the team:** Remember, release notes aren’t just for users. Make sure your team sees them, and give them a chance to collaborate.

-   **Make them easy to access:** Last, of course, make them easy to get to from your product. On [beta.fec.gov](https://beta.fec.gov), we link to them from the navigation in the footer of the site. The notes themselves can live anywhere — we store ours in GitHub for the ease of editing — but they should always be accessible from the place where users actually are.

## Why we love release notes

Writing release notes has helped improve our team communication,
provides an easy-to-reference narrative for stakeholders (and
ourselves), and draws attention to new features of a constantly evolving
product.

### Improved communication

The steady practice of collaboratively writing these release notes has
helped improve our team communication in a few ways. Every sprint we
have some features that will be released and others that may span
multiple sprints. It can be tough to keep track of what will be released
and what won’t be, as well as just remember all of the things that have
been completed. Providing a common list of changes to our team of
designers, developers, and agency partners keeps everyone on the same
page. We also use the list to easily check through everything on our
staging environment before we launch and on our production environment
after we launch. We’ve found this to be equally useful on project for
our partners as well as 18F-owned projects like
[cloud.gov](https://cloud.gov/updates/). When you spend your days in
the weeds of the code or design of parts of features, it’s easy to lose
sight of the forest for the trees. Release notes give an easy way to
package up all the various bits of work.

### Help users keep track of what’s new

Developing a product iteratively in the open yields several benefits for
users, but it also poses some challenges. If a user visits early and
sees a feature isn’t available, how will they know when it is? If a
feature changes that they had previously used, how do they know that it
changed and why? Release notes are one way that we can improve the user
experience of continuous delivery by giving our users an
easy-to-reference source for all the ways that the product is changing.
They’re not a complete answer by any means, but they’re a start.

### A record of progress

Last, release notes provide an easy retrospective record of progress.
After working on a project for months or years, it can be hard to
remember all the significant ways your product has grown and improved.
We have to be able to tell the story of our progress to our users and
our stakeholders, and keeping release notes makes it super easy.
Recently, we needed to give a progress report to executive stakeholders
on what we accomplished over the last six months. Naturally, I started
by re-reading the release notes for the period to remember all of the
features we added and changed. And of course, because the notes are
already readable, they can also suffice as something that you just send
to someone as-is.

## Telling the story of your ever-changing product

Working on an agile software project is exhilarating (if a little
chaotic at times). But moving fast and constantly improving requires
that we also tell the story of our product in a way that resonates with
our teams, our stakeholders, and our users. Release notes have become a
helpful focal point for my team working on [beta.fec.gov](https://beta.fec.gov).

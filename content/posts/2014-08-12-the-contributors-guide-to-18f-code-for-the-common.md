---
layout: post
date: '2014-08-12T12:31:00-04:00'
tumblr_url: http://18fblog.tumblr.com/post/94543290971/the-contributors-guide-to-18f-code-for-the-common

title: "The contributor's guide to 18F: code for the common good"

description: "Transparency in coding makes code more secure. Open source development is development in the light, sometimes a harsh light, that shows every blemish. At 18F we strongly believe this improves the rapidity of our coding and the quality and security of the code."
excerpt: "Transparency in coding makes code more secure. Open source development is development in the light, sometimes a harsh light, that shows every blemish. At 18F we strongly believe this improves the rapidity of our coding and the quality and security of the code."

image: 
authors:
- robert

tags:
- open source
- how we work
- evangelism

---


Introduction
------------

Transparency in coding makes code more secure. Open source development
is development in the light, sometimes a harsh light, that shows every
blemish. At [18F]({{ "/" | url }}) we strongly believe this
improves the rapidity of our coding and the quality and security of the
code.

We keep the code [open to each other](https://github.com/18F), which
allows us to quickly scrub in on projects and to dexterously apply the
most talented resources to a problem without too much concern for who is
formally working on or in charge of a given project. The code is also
open to Federal employees from outside 18F and from other agencies. This
means that they may both review the code, offers suggestions, and, in
some cases, learn from and reuse the code. Just as we reuse open source
code developed outside the government to save money for the US taxpayer,
so too do we offer our code to be reused by our teammates, other
agencies, other governmental bodies, or citizens and businesses.

The purpose of this guide is to provide some advice on that reuse and
sharing, in hopes of fostering it.

Basic reuse
-----------

All our our code is published and released at GitHub.com under the
[organization 18F](https://github.com/18F/). There you can see all our
public repositories (or “repos”). Using only a browser, you can look at
any of the code in these repositories, or simply read about the
projects. If you wish, you can “follow” a project from beginning to end.
Since source code revision systems let you look back in time, you can
see the complete history of changes leading up to the current state.
Imagine being able to see every draft and edit of Shakespeare’s plays
leading up to the publication of the [First
Folio](https://en.wikipedia.org/wiki/First_Folio).

One of the projects we are most proud of and which is highly reusable is
[FBOpen](https://github.com/18F/fbopen).
[FBOpen](https://fbopen.gsa.gov/) is a set of open source tools to help
small businesses search for opportunities to work with the U.S.
government. FBOpen presents an Application Programming Interface (API)
to published Federal contracting opportunities, as well as implementing
a beautiful graphical user interface to the same opportunities.

Anyone who wishes to may reuse this code to create their own website,
free of charge and unencumbered by obligations. For example, a State
could promote economic development within its borders by taking this
code, making a slight modification to limit searches to their own State
(you would have to be a software engineer to do this, but it is very
easy) and then host “Federal Business Opportunities for the Lone Star
State.” A business could also build a website using the FBOpen software
and API, perhaps even making money by selling advertisements related to
the content. The basic idea is that since the software is open source,
anyone can use it to build a tool that suits their needs.

Sharing enhancements
--------------------

Let us imagine that a business has installed
[FBOpen](https://github.com/18F/fbopen), changed the name and branding,
and is making some money from ad revenue by target marketing to
businesses interested in a particular kind of Federal contract, for
example cement and concrete masonry. They’ve made some “masonry
specific” changes to the code. In doing so, they realize that they have
made the code more modular in some way, an improvement that can be
shared back to the Federal Government.

Why would they take the time to share this back to the government, when
they won’t get paid for it, and it costs them a small amount of time to
do so? Beyond altruism, by doing so they keep their codebase as similar
to the official Federal codebase as possible. In this way, when
improvements to FBOpen are made by 18F, their software engineers can
accept these changes with minimal effort. They may decide that they want
to stay up-to-date with the FBOpen codebase, and manage only
masonry-specific code extensions.

The mechanism for sharing this code back has been worked out and it is
relatively simple, as software engineering goes. It is called a [pull
request](https://help.github.com/articles/using-pull-requests), because
it is a request or suggestion to the owner of the codebase to accept or
“pull” the code change. It is a formal mechanism which makes crystal
clear how the code is changing, which is of course critical. 18F will
perform strict code review of all such pull requests, and may simply not
accept them at all—not every idea is aligned with the codebase owner’s
intentions. In general, however, we welcome such pull requests and
enhancements. Just as we hope to create opportunities for American
business, we can benefit from the creative output of the entrepreneurs
and non-commercial software developers. The taxpayers deserve the least
expensive, highest-quality software that we can deliver for their tax
dollars.

Some legal issues
-----------------

18F is committed to making our code permissively reusable wherever
possible. Work performed by Federal employees, such as the staff of 18F,
is not subject to copyright and is in the public domain within the US.
However, we use a copyright waiver for other jurisdictions to clarify
matters and ensure unrestricted public use outside of the US.

Even though it is our
[intention]({{ "/2014/07/29/18f-an-open-source-team/" | url }}) to
release all code permissively, you may find a derived work of someone
else’s code in our repositories. In order to save the taxpayer money, we
reuse work that others have created when possible. An example of such a
file is
[pycas.py](https://github.com/18F/PriceHistoryAuth/blob/master/pycas.py)
which is part of the
[PriceHistory](https://github.com/18F/PriceHistoryInstall) project which
was begun by Presidential Innovation Fellows and is now maintained by
18F. This individual file is Copyright Jon Rifkin, 2011, and it was
reused and modified as allowed by the [Apache License
2.0](https://www.apache.org/licenses/LICENSE-2.0) under which Mr. Rifkin
released it. This file remains copyrighted by Jon Rifkin and covered by
the Apache License 2.0.

Since similar situations may arise in any repository, check the
individual README and LICENSE files for each project on GitHub for
details specific to that project in order to reuse our code
legally—which we strongly encourage!

Making contributions
--------------------

GSA is not permitted to accept voluntary services or ask people to
perform work on open source projects free of charge. However, since our
open source software projects are available in public repositories for
anyone to learn from or reuse, individuals may decide to improve the
software for the benefit of others or offer suggestions to improve the
code.

In general, individuals who choose to contribute to an open source
project do so without the expectation of payment. There are a variety of
reasons why software developers elect to contribute to any open source
software project. The reasons include:

-   Desire to make an improvement to software that a programmer is using
-   Demonstrating one’s commitment, talent, and experience
-   Altruism

In the case of our repositories, there are several kinds of
contributions:

-   Report bugs, ideas, requests for features by creating “Issues” at
    GitHub in our project repositories. An issue that begins “Have you
    thought of…” could save a project months of labor
-   Fork our code and play with it, whether you later choose to make a
    pull request or not
-   Create pull requests of changes that you think are laudatory. From
    typos to major design flaws, you will find a target-rich environment
    for improvements

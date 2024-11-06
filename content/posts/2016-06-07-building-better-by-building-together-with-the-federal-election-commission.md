---
title: "Building better by building together with the Federal Election Commission"
authors:
- leah
- manger
tags:
- agency work
- fec.gov
- how we work
- communication tools and practices
- collaboration tools
excerpt: "How do you work iteratively and in the open in government? How do you transform an agency’s digital presence with agile and user-centered design? We’ve learned a lot about this as we’ve worked alongside our partners at the Federal Election Commission (FEC) on beta.fec.gov, and we want to share some of those lessons here."
image: /assets/blog/fec/fec-meeting.jpg
image_alt: A group of approximately 20 people sit and stand around white boards and notes on a wall.
image_caption: The FEC and 18F teams meet to review user research and prioritize upcoming work.
---

How do you work iteratively and in the open in government? How do you transform an agency’s digital presence with [agile](https://pages.18f.gov/partnership-playbook/4-agile/) and [user-centered design](https://pages.18f.gov/partnership-playbook/5-user-centered-design/)? We’ve learned a lot about this as we’ve worked alongside our partners at the Federal Election Commission (FEC) on [beta.fec.gov](https://beta.fec.gov/), and we want to share some of those lessons here.

## Background

FEC is the agency responsible for regulating campaign finance activity in federal elections. Their legacy website, [fec.gov](http://www.fec.gov/), is dense with a tremendous amount of complex campaign finance data, legal resources, and information about the rules on raising and spending money in elections. And when 18F started talking to stakeholders and users, we learned that users were often worried they hadn’t found the right information, all the information, or the most up-to-date information when navigating the site.

In addition, the FEC had never worked with user-centered or agile methods. And on top of that, public scrutiny and the need for legal precision made most changes to the site a significant challenge. The content was sensitive and needed to serve both the public and the experts who used it as legal precedent.

So what seemed at first to be a simple redesign of fec.gov quickly turned out to be a much larger challenge. Not only did we need to make the thing, we had to work with FEC to transform its whole approach to making things.

Strategies that work
--------------------

### Build together to build it better

We have closely partnered with a small team of knowledgeable, dedicated folks from across the FEC. They understand the agency’s history and priorities, and they have been invaluable in helping us navigate the bureaucracy and hone the product vision. To collaborate across agencies, as well as across the country (our 18F team is in D.C., New York, San Francisco, and Chicago), we use a few tools and tricks:

Communication and collaboration:

-   Hold frequent video calls for [sprint](https://en.wikipedia.org/wiki/Sprint_(software_development)) planning, [retros](https://www.scrumalliance.org/community/articles/2014/april/key-elements-of-sprint-retrospective), and for gathering feedback on evolving designs and content
-   Quickly troubleshoot problems and answer questions using shared Slack channels
-   Sketch and organize ideas using a digital sticky-note tool and video calls
-   Hold regular training sessions in which both 18F and the FEC teach each other something, such as how to run [usability testing](https://methods.18f.gov/usability-testing/) or an intro to political action committees

Product management and design:

-   Develop our shared product vision using the [story mapping](https://vimeo.com/70214001) technique. This helps us stay agile while still planning for the future, and it empowers our partners to communicate our strategy to their leadership.
-   Track upcoming work and feedback from the site using GitHub issues, which are organized into [Kanban](https://en.wikipedia.org/wiki/Kanban_(development)) boards
-   Conduct weekly usability testing with video-calling and screen-sharing services so that anyone from across the teams can observe

Most importantly, these tools and methods have helped us build a better product by forging deeper bonds and a greater shared understanding.

### Build trust by starting small

Early in the project, the FEC expressed concern about releasing betaFEC before we finished key features; they hoped to launch a more polished first version. We were sympathetic to these concerns, so [we released our API first]({{ "/2015/07/15/openfec-api-update/" | url }}).

An early release of data tools for heavy users is often a good step. This was still a leap of faith for our partners, but it paid off. The open data and campaign finance communities were thrilled. The Sunlight Foundation [said](http://sunlightfoundation.com/blog/2015/07/08/openfec-makes-campaign-finance-data-more-accessible-with-new-api-heres-how-to-get-started/), “The FEC is taking a huge step forward.”

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I&#39;m completely won over. The new FEC API is awesome. <a href="https://t.co/N6EeKq6HZp">https://t.co/N6EeKq6HZp</a></p>&mdash; Andrew McGill (@andrewmcgill) <a href="https://twitter.com/andrewmcgill/status/619237229504937984">July 9, 2015</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

This positive response helped build trust that was instrumental in the [early release of beta.fec.gov]({{ "/2015/10/29/welcome-to-betafec/" | url }}). This site was obviously incomplete — the home page had huge areas marked “Coming soon” and navigation items listed as “TBD” — but it allowed us to get something real in the hands of our users, which has led to invaluable input.

### Build in the face of uncertainty. And then rebuild.

Designing and releasing features and interaction patterns quickly means building in the face of uncertainty. Design is about building a system, and we’re constantly building small parts of what will ultimately be a much larger system.

Our design process has benefited significantly from continuous user feedback — from our weekly usability testing and a widget that allows visitors to submit observations or questions directly from the site — and from the perspective we’ve gained from watching the system grow over time. This helped us design and redesign key parts of the calendar interaction, major aspects of the site’s color scheme, and countless micro-interactions and design patterns.

What we delivered
-----------------

In the months since our first release of beta.fec.gov, we shipped big new features:

-   A [calendar](https://beta.fec.gov/calendar) of election dates, filing deadlines, and commission activity
-   A [suite of guides](https://beta.fec.gov/registration-and-reporting) to help people register their candidacy, create new groups, and get started reporting to the FEC
-   The ability to download custom CSV files of search results from the website
-   More datasets for independent expenditures and other forms of outside spending
-   A new site-wide menu system to help users find more features
-   Countless improvements to the interface based on usability testing and user feedback

And we’re not done. In the months to come, we plan to add more features:

-   Tools to help users find and understand FEC legal resources, including regulations, advisory opinions, and other documents
-   Interactive charts and graphics to help new users understand and explore campaign finance data
-   Plain-language content that’s easy to explore. We’re simplifying the site’s architecture so users can find what they’re looking for faster, whether that’s contribution limits or archived press releases. We’re also deduplicating content, streamlining the 40,000 pages currently on fec.gov, so content is easier to maintain.
-   More and more campaign finance data, of course

<br/>
<hr/>
<p style="text-align: center; font-size: 18px;"><strong>“We didn’t know where to start, but
in the end, we got so much more than a website. We had a complete
culture change about how to do user-centered design and agile.”</strong></p>
<hr/>

Delivery is the strategy
------------------------

By building together, building trust, and building in the face of uncertainty, we’ve shown why 18F’s motto is “delivery is the strategy.” Our product owner at the FEC has said, "We didn’t know where to start, but in the end, we got so much more than a website. We had a complete culture change about how to do user-centered design and agile."

This culture change is already reverberating in the way the FEC is approaching its upcoming round of projects. But it never would have been possible if our partners at the FEC weren’t so open minded and dedicated to improving the way they serve the American people.

*Interested in helping out? Want to learn more about something? Let us know or check out our* [*GitHub repos*](https://github.com/18F/openfec#about-this-project)*.*

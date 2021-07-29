---
title: "The TTS Handbook: A 21st-century approach to internal documentation"
date: July 27, 2021
authors:
  - dylan-irlbeck
tags:
  - technology transformation services
  - onboarding
  - open government
  - how we work
excerpt: "In this post, we introduce the Technology Transformation Services
  Handbook: an open, crowd-sourced, accessible, and living resource that aims to
  provide the information our team needs to do their work."
---
*This summer TTS welcomed Dylan Irlbeck as a Coding it Forward Civic Digital fellow. Dylan worked with the TTS Technology Portfolio and Outreach teams to improve the TTS Handbook. Dylan has offered to share with us a bit of history about the Handbook and how he’s been tackling this project. Take it away Dylan!*

Nearly five years after its inception, we realized there haven’t been any blog posts about the primary home for documentation in 18F: the [Technology Transformation Services (TTS) Handbook](https://handbook.tts.gsa.gov/) (known affectionately as “the Handbook”). [TTS](https://www.gsa.gov/about-us/organization/federal-acquisition-service/technology-transformation-services), if you weren’t already aware, is the umbrella organization for 18F and a number of other federal technology programs like the [Presidential Innovation Fellows](https://pif.gov/) and [Centers of Excellence](https://coe.gsa.gov/) and services like [usa.gov](https://www.usa.gov/) and [search.gov](https://search.gov/). The Handbook services all TTS staff, which of course includes 18F. 

In a nutshell, the Handbook is our take on internal government documentation. It is an open, crowd-sourced, accessible, and living resource that aims to provide the information our team needs to do their work.

![Screen capture of scrolling through the Handbook homepage, then clicking into the “TTS mission, history, and values]({{ site.baseurl }}/assets/blog/image4.gif "Screen capture of scrolling through the Handbook homepage")

In this post, we’ll unpack the Handbook’s core values -- and how they’re implemented in practice. We’ll dive into our experience with the Handbook and even highlight some other organizations who’ve adopted it. Finally, we’ll touch on what’s in store for the project going forward. If you’re a federal employee, civic technologist, or member of the public, we hope to leave you with a sense of what 21st-century transparency in your government looks like.

## Values and implementation

As an organization, the Technology Transformation Services (TTS) is [committed to transparency](https://handbook.tts.gsa.gov/tts-history/) -- for the public and for itself. We prefer plain language over jargon, open- over closed-source, and public over private information. The Handbook aims to reflect these overarching values, and therefore implements the following principles: 

* **Open**: _To build trust among TTS staff members, with the public, and to make the information as easy-to-access as possible, content should be open to all._ The Handbook is available on a [public website](https://handbook.tts.gsa.gov/), its code is [open-source](https://github.com/18F/handbook), and we instruct employees that “TTS-wide information should be public by default.” Another benefit of keeping the Handbook open is re-usability. We’d love for other federal and civic organizations to adopt the Handbook, and by keeping the code open-source we encourage just that. (And indeed some civic tech companies have [already forked](#forks) the Handbook!)
* **Crowd-sourced**: _Anyone should be able to contribute. Contributors should not need to know web development or version control, and they should not have to be affiliated with TTS._ There has never been an individual team or person responsible for maintaining it, and this is by design: Content is entirely crowd-sourced. To that end, our policy is that anyone can contribute to the Handbook, whether or not they work for TTS. This collaborative culture has resulted in nearly [200 formal contributors](https://github.com/18F/handbook/graphs/contributors) -- and hundreds more informal ones -- over the years. 
* **Accessible**: _Handbook content ought to be written in plain language and be searchable._ We do that by reminding contributors of the [18F plain language guide](https://content-guide.18f.gov/our-approach/plain-language/), and using [search.gov](https://search.gov/) on every page. In order to check that proposed changes don’t break accessibility, we use [preview branches](https://federalist.18f.gov/documentation/previews/) to give contributors a live website for demoing their changes. As a contributor, this relieves the burden of knowing [Jekyll](https://jekyllrb.com/), our static site generator, and having to run the Handbook locally to test new changes.
* **Living**: _Content is expected to change over time. Specifically, it should be kept up-to-date with TTS’s processes and policies._ At present, TTS staff members are encouraged to submit fixes for inaccurate or outdated content. These fixes are generally reviewed and [accepted optimistically](https://alexschroeder.ch/wiki/Optimistic_Merging). They are then immediately deployed to the live site via [cloud.gov Pages](https://federalist.18f.gov/). This tight loop ensures that content is updated as seamlessly as possible.

## Our experience

Overall, the Handbook has been incredibly successful for TTS. It reduces a lot of headache with onboarding new employees, results in fewer duplicative questions via email or Slack, and, more generally, demonstrates our commitment to transparency as an organization. The default to using plain language has also been a breath of fresh air for staff. One of our colleagues put it best when they said:

<div class="testimonial-blockquote">
[The] TTS handbook is really, really awesome.  I can't think of another organization I've been with that has such comprehensive, easy to use documentation… the handbook empowers a culture of openness, collaboration, and transparency, like we're all working together towards a common good.
<span>- TTS Contractor </span>
</div>

That said, there have been some challenges. We will briefly touch on three of these, along with the solutions we’ve planned or are currently building (with links to relevant GitHub issues and pull requests -- another benefit of working in the open.)

### Challenging contribution process

The actual mechanism to make contributions was overly complicated. Some contributors expressed frustration with Markdown and the lack of tooling for non-technical users. Historically, the Handbook’s content has been edited via Git: contributors would fork the repository, modify some Markdown content, and open a pull request for review. GitHub has a decent interface for accomplishing this, but some basic knowledge of Git and Markdown -- and, to some extent, Jekyll -- was required. This posed a barrier to non-technical people who wanted to contribute. 

**Solution:** To remedy the overly-technical contribution process, we are adding support for [NetlifyCMS](https://www.netlifycms.org/) ([via cloud.gov Pages](https://federalist.18f.gov/documentation/getting-started-with-netlify-cms/)): an open-source content management system that will give our contributors a friendly UI and Git-free publishing workflow.

![Demoing the contribution workflow in NetlifyCMS]({{ site.baseurl }}/assets/blog/netlify-workflow.gif "NetlifyCMS")

### Reviewer ambiguity

Tethered to unclear ownership is an issue that crops up in the review process: reviewer ambiguity. In order to make content changes, contributors must receive at least one approval from another contributor. But who should that approval come from? Without ownership, answering this question, especially as a new contributor, was difficult. This ambiguity eroded the “liveness” of the Handbook since it caused friction in keeping things up-to-date.

**Solution:** To address the reviewer ambiguity, we made use of [GitHub’s “code owners” feature](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-code-owners). Our ownership assignments, from a content and code perspective, are maintained in a [CODEOWNERS file](https://github.com/18F/handbook/blob/main/CODEOWNERS). In this file, GitHub teams are assigned as “owners” of certain folders. Later, they are automatically added as reviewers to pull requests affecting their content.

![By writing a CODOWNERS file, reviewers are automatically added to pull requests]({{ site.baseurl }}/assets/blog/code-owners-file.png "CODOWNERS file")

### Unclear governance

Under the Handbook’s fully crowd-sourced model, there aren’t always clear content owners -- be they individuals or teams. This troubled contributors because they usually didn’t know who to ask for approval. And it made regular review impossible because no one was accountable for outdated content.

**Solution:** We are devising a [governance structure](https://github.com/18F/handbook/issues?q=governance) that will clarify the contribution process, create clear ownership assignments, and enforce regular content review. Our goal is to find a degree of governance that doesn’t endanger our open, collaborative contribution culture.  

Other challenges we’ve run into while building the Handbook include: 

* Whether content acts as [requirements or guidance](https://github.com/18F/handbook/issues/2197): We’re a federal organization, and we need to be clearer about distinguishing between the two (and hyperlink to actual policy where applicable).
* Information overload: the homepage has a lot of sections and links, so we’ve been thinking about how to better organize things. Moreover, important information -- such as the Handbook’s values -- are not currently present.
* Inconsistent page structure: there are pages with similar themes (for example, our [Software and Tools pages](https://handbook.tts.gsa.gov/#software-and-tools)), but they each have unique sections and formatting. We want to [create templates](https://github.com/18F/handbook/issues/2266) to ensure that page structures are consistent.

## Forks

Several other digital service organizations have forked the Handbook for their own needs (abiding by the project’s [open-source license](https://github.com/18F/handbook/blob/main/LICENSE.md)):

* [Civic Actions](https://handbook.civicactions.com/en/latest/README/) 
* [Bixal](https://techbook.bixal.com/en/latest/)
* [Bloom Works](https://bloom-handbook.readthedocs.io/en/latest/)

We also know of other parts of GSA and federal agencies referencing the TTS Handbook in the documentation of their own practices. This passive influence is, in our view, a direct result of content being widely accessible.

We always love to hear how people outside of TTS are using the Handbook. Maybe you’ve forked it, read a few pages and had a good experience, or see areas for improvement. If so, [please let us know](https://github.com/18F/handbook/issues/new)!

## Looking forward

TTS envisions a government that provides trusted, modern experiences for all. We’d love to see the Handbook and its values -- open, crowd-sourced, accessible, and living -- be implemented across federal agencies and other civic organizations. As civil servants, we owe it to all our stakeholders to be transparent. The Handbook represents our commitment to openness, and we’re excited to continue iterating on it in the months and years ahead.

- - -

*If you’re curious about the specific work we have planned, or if you have feedback on the Handbook itself, do check out our [issues page](https://github.com/18F/handbook/issues). And if you see something that needs fixing, don’t hesitate to open a [pull request](https://github.com/18F/handbook/pulls)!*

*I’d like to close by giving a few words of thanks. To Coding it Forward for allowing me to participate in their Civic Digital Fellowship. To the Tech Portfolio and Outreach teams, and TTS as an organization, for being so welcoming and encouraging throughout my fellowship. To John Jediny and Aaron Borden for providing invaluable technical guidance and words of encouragement. Finally, to the mentors that have made my summer in government an overwhelmingly positive experience: Aidan Feldman, Star Vanamali, and Andrea Sigritz.*

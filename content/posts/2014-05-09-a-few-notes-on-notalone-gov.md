---
layout: post
date: '2014-05-09T13:49:34-04:00'
tumblr_url: http://18fblog.tumblr.com/post/85232393363/a-few-notes-on-notalone-gov

title: "A few notes on NotAlone.gov"

description: "At the end of April, Vice President Biden, while rolling out the final report of the White House's 90-day Task Force to Protect Students from Sexual Assault, announced the launch of NotAlone.gov, a website built by 18F and the Presidential Innovation Fellows."

excerpt: "At the end of April, Vice President Biden, while rolling out the final report of the White House's 90-day Task Force to Protect Students from Sexual Assault, announced the launch of NotAlone.gov, a website built by 18F and the Presidential Innovation Fellows."
image:
authors:
- aaron
- mollieruskin
- sean
- noah

tags:
- presidential innovation fellows
- 18f
- culture
- how we work
- agency work

---

At the end of April, Vice President Biden, while [rolling out the final
report of the White House's 90-day Task Force to Protect Students from
Sexual
Assault](https://obamawhitehouse.archives.gov/photos-and-video/video/2014/04/29/vice-president-biden-speaks-preventing-campus-sexual-assault),
announced the launch of [NotAlone.gov](https://www.notalone.gov/), a
website built by [18F]({{ "/" | url }}) and the [Presidential
Innovation Fellows](https://obamawhitehouse.archives.gov/innovationfellows).

\* \* \*

#### Changing how we think about task force deliverables

Often, the final product of a government task force is a lengthy report,
a new committee or commission, or proposals for legislation or executive
action. But as Mike Bracken says, "[in a digital world, delivery informs
policy](http://mikebracken.com/blog/the-strategy-is-delivery-again/)."

This task force found that both students and school administrators have
difficulty finding help dealing with and understanding this issue, and
that campus sexual assault victims often feel unfathomably isolated from
everyone around them. So about one month before the release of their
90-day report, the White House came to us to talk about tackling those
problems head-on with a new online resource.

We think this is part of the future of digital government: For the first
time, the work product of even a short-lived, narrowly focused task
force can be a new public resource, instantly available, and useful not
just to policy makers and subject matter experts but to everyone
affected by or interested in the issue.
[NotAlone](https://www.notalone.gov/) pulls together disparate and
sometimes difficult-to-find resources, including a crisis services
locator, an interactive map of colleges and universities where federal
sexual assault enforcement activities have occurred, extensive
easy-to-read legal guidance for students and schools, and a searchable
compendium of reports and other documents related to sexual assault on
campuses – all in response to requests from the students across the
country who have lived through the need for these resources.

#### User-centered iterative design

The task force came to us at the end of March, and asked us to deliver a
site before the end of April. Notwithstanding the tight deadline, we did
[what we always
do]({{ "/2014/03/19/hello-world-we-are-18f/" | url }}):
begin by [learning what our primary users were
seeking](https://en.wikipedia.org/wiki/User-centered_design). Mollie led
a design thinking workshop with student advocates and survivors, asking
them to co-design their ideal online experience. That session exposed
the painful journey survivors endure before finally turning to federal
resources, and helped us understand which information would be most
important to them when they do.

The insights from that session informed all our design choices: a simple
information architecture, a prominent document search feature, a warm
color palette, gender-neutral language and tone. It also inspired the
site’s name, chosen to help survivors feel they had come to a place that
could truly support them—to help them feel a little bit less alone.

Then we [iterated](https://en.wikipedia.org/wiki/Iterative_design).
Fortunately, the compressed timeline was counterbalanced by an invested
team of project owners who were dedicated to providing fast,
comprehensive feedback.

#### About the code

18F is committed to transparency. [NotAlone](https://www.notalone.gov/)
is open-source. All the code for the site is available at
<https://github.com/18f/notalone>. As we state in the README, content
and feature suggestions are welcome via GitHub Issues, and code
contributions are welcome via pull request (although of course we can't
guarantee your request will be merged).

[NotAlone](https://www.notalone.gov/) is built on a technology stack
very similar to the one we used for [FBOpen](https://fbopen.gsa.gov/):
static front-end content, JavaScript components using Ajax to pull from
various data resources, and a [thin search
API](https://github.com/18f/beckley) fronted by the indispensable
[api.data.gov](https://api.data.gov/) and backed by a [search indexing
server](http://elasticsearch.org/). As with all 18F websites, and
especially given the nature of the content, we built
[NotAlone](https://www.notalone.gov/) to use SSL by default and to be
fully responsive, so students can easily access its important resources
on mobile phones. And because the search API is open access, anyone can
use the data collected by the task force to build other products and
services – or even a better version of
[NotAlone](https://www.notalone.gov/).

Unlike FBOpen, this site needs to be amenable to frequent content
updates by non-coders. Rather than building the site using an
out-of-the-box content management system, we decided to experiment with
using GitHub as [NotAlone](https://www.notalone.gov/)'s CMS. So far,
we’re pleased with the results.

We use [Jekyll](http://jekyllrb.com/) to generate the site content from
simple
[Markdown](https://help.github.com/articles/github-flavored-markdown),
which allows basic formatting while keeping the content simpler and more
structured than a full-featured rich-text editor. Various lists – the
site navigation, the list of available student services and resources,
and the list of search-indexed documents – are maintained in
easy-to-read, easy-to-edit [YAML](https://en.wikipedia.org/wiki/YAML)
files. [NotAlone](https://www.notalone.gov/)’s (decidedly non-techie)
content editors signed up for GitHub accounts and edit the Markdown and
YAML files themselves in GitHub’s built-in, Markdown-friendly editor.
Thanks to [GitHub Pages](https://pages.github.com/), they can preview
their work at <https://18f.github.io/notalone/> before code is pushed to
the live site.

\* \* \*

We’re honored to have been involved in delivering this site in
cooperation with [the task force](https://obamawhitehouse.archives.gov/1is2many/),
[the White House Office of Science and Technology
Policy](https://obamawhitehouse.archives.gov/administration/eop/ostp), [the Office
of the Vice
President](https://obamawhitehouse.archives.gov/administration/vice-president-biden/),
and our outstanding support team in [GSA's Office of the
CIO](http://www.gsa.gov/portal/category/21404). We're grateful for such
an exceptional array of partners for this important project.

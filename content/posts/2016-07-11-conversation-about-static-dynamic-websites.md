---
title: "A conversation about static and dynamic websites"
authors:
- boone
- will
tags:
- communication tools and practices
- jekyll
- federalist
excerpt: "Our blog uses Jekyll, a static file generator with a basic templating system, as the backend software. Deploying our blog posts this way has simplified our publishing process."
description: "Our blog uses Jekyll, a static file generator with a basic templating system, as the backend software. Deploying our blog posts this way has simplified our publishing process."
image: /assets/blog/new-jekyll-site/header.png
---

Our blog uses [Jekyll](http://jekyllrb.com/), a static file
generator with a basic templating system, as the backend software for
our site. A few months ago we wrote about [our decision to host the site on Federalist]({{ "/2016/05/18/why-were-moving-18f-gsa-gov-to-federalist/" | url }}). This post is about static site generators and the advantages and disadvantages of using one over a more traditional content management system (CMS).

Not everyone on our team was familiar with static website generators
before joining 18F. Soon after joining 18F, Will Slack sat down with
Greg Boone, a member of 18F’s Outreach Team with a background as a
WordPress developer, to learn more about the differences between static
and dynamic websites.

We’ve published excerpts from their conversation below.

**Will:** Hi Greg! Thanks for explaining static sites to me. Where
should we start?

**Greg:** I'll start by explaining basically what Jekyll is. Jekyll is a
piece of software that generates web pages. Do you remember Geocities or
Angelfire from the 1998 era internet?

**Will:** Yeah! I remember how you could make and customize different
pieces of a website.

**Greg:** So all those sites back in the day were made up of static
pages.

**Will:** I think I know what a static page is. That's a bunch of HTML
code that a programmer writes with images and text and formatting,
right?

**Greg:** That’s right. Every page in a website is a full HTML file.
Back in the day, if you wanted to create a new page, it meant copying
and pasting all the elements common across every page in the site, and
then going around editing the handful of lines that needed to be
slightly different from page to page.

And there is a *lot* of HTML that exists on nearly every page on a
site. Here’s an example: If you want a banner at the top of every page
with your logo in it, you have to put that HTML at the top of every
page.

Content management systems (CMS) were designed to solve that problem.
What a CMS does is let you write your content and store it in a database
where it can be retrieved later. And then your HTML pages become little
templates with swappable pieces — like Lego blocks — based on what
content *should* be at a given URL.

**Will:** Ok. Do you have an example?

**Greg:** Sure! When you visit a site powered by a CMS, your browser
asks the web server for a certain webpage. The web server, which is the
computer that serves up the content, then runs a program every time a
page loads to figure out what content should be on that page. And it
might run a few dozen queries or a few hundred depending on what that
content should be.

So the web server makes the page anew, and sends some HTML over the
internet to your computer. Finally, your browser figures out how to make
sense of and render all that HTML. This happens every time someone asks
for that page.

*So to recap, a CMS stores all the content a website has in a database
and then jams it into a template when you ask for a specific page.*

A static site like Jekyll takes a very different approach. Instead of
using a database, though, it stores the *content* in one kind of
file and uses Jekyll to convert them into *other kinds* of files.
In Jekyll's case, the content is written in a language called Markdown
with a standard bit of information at the top of the file written in a
language called YAML.

**Will:** So anyone can easily edit the content in a Jekyll site without
needing to know code, except how to do formatting in Markdown?

**Greg:** Yup, and without having to be a “user” of any database.

**Will:** And how to do the YAML instructions at the top work?

**Greg:** Good question. Before anybody actually visits a Jekyll
website, it has to be generated. You could write blog posts until you're
blue in the face and it won't matter if you never generate them into a
website. In Jekyll, you run a command called `build` to make that
happen.

Whereas a CMS is always running, waiting to send a visitor whatever page
they ask for, Jekyll does nothing by itself. It needs someone or a
program to run a ‘build’ command to generate files. Jekyll is almost
always *not* running.

**Will:** So if I update a blog post in a CMS, that will get pulled into
a live website immediately, but if I update a post in Jekyll, someone
has to "build" the page before people can see it.

**Greg:** Yup. The result of running `jekyll build` is a boat load of
HTML files organized into directories, or folders, based on how you have
configured the program, and you can put *those* files on a web
server and then they're just sitting there, statically waiting for
someone to ask for them — just like in 1998.

**Will:** Why would you want to use a static site generator over a
dynamic webpage?

**Greg:** There's a lot of *work* done by these programs when you
build those pages. A CMS has a database that all the content is stored
in, and every page needs to query that database at least once to figure
out what to show you.

Let’s say you want one blog post, so you go to
website.com/single-blog-post. If all you get is the text of that blog
post, you probably only made one query. But the cool thing about a CMS
is it gives you everything else like header images, related posts, tags,
categories, detailed author bios, ​plugins, and whatever the heck
else content you put in your CMS.

But let’s say that single blog post page has a header image, tags,
categories, an author, and maybe some related posts connected to it —
each of those things has at least one query to the database (and usually
quite a few more). You can mitigate that work by using cache
technologies that essentially save a version of the page as a static
file, but you then have to invalidate that cache, tell it to make a new
version of the page, every time you make a change to it.

If you’re curious, WordPress has an excellent page in their
documentation showing [what is going on behind the scenes when it
processes a request](https://codex.wordpress.org/Query_Overview).
Drupal, Joomla, name your CMS, they all have something similar, even if it's not published.

**Will:** I think I understand how it works; why someone would want to
use a CMS over a static site generator?

**Greg:** It really depends on your needs. Most non-technical bloggers,
I think, would say editing in a CMS is easier because you can use a
"what you see is what you get" (WYSIWYG) type editor that abstracts away
the HTML *code*. As a writer, you just have to think about what to
write — and not *how* to write in a markup language that then translates
your writing.

With a CMS you also get a lot built in that you have to do yourself on a
static site generator. Jekyll, at least, has support for tags, but our
ability to list all the tags on a blog post, for example, we had to
invent ourselves. WordPress has a handy template function called
[`get_the_tag_list`](https://codex.wordpress.org/Function_Reference/get_the_tag_list) that gets a formatted list of tags on the current
post. When you put it in a template, each tag is automatically linked to
its archive page. [We had to build this feature ourselves](https://github.com/18F/18f.gsa.gov/blob/staging/_layouts/post.html#L22-L29).

**Will:** What are some of the benefits of using a static site over a
CMS?

**Greg:** While CMSs come with all those extra features packed in,
static site generators tend to optimize for simplicity. Some people see
that as a strong advantage. On 18f.gsa.gov, for example, we have that
tagging feature but on [useiti.doi.gov](https://useiti.doi.gov) — also a Jekyll site hosted on
[Federalist](https://federalist.18f.gov) — they don’t because they don’t need it, and if they ever do,
they have the freedom to design the feature as it best suits their
problem, use ours, or someone else’s solution. With most CMSs, you opt into
those features the way they were designed by the CMS team.

They’re also easier because the content is visible and portable. All the
content for 18f.gsa.gov lives in a Git repository. We host it on GitHub
right now, but we don’t need to and if GitHub ever goes away we can
easily move the content elsewhere or recover it from any clone of the
site that exists (like on a team member’s laptop). This makes it easy
for us to accept pull requests from the public to fix our typos and be
very public and transparent about how our site works.

The portability is also important for when we decide to move the site
somewhere else. We did this with 18f.gsa.gov when we moved it to
Federalist and it was relatively painless. Migrating a CMS-driven site
is a bit more work because there are many more things to think about:
backing up databases, database passwords, sensitive configuration
details like administrator passwords and firewalls. This can be a
difficult and time-consuming process.

It’s not just when moving the site that you have to worry about all those
things. Security of the database is a constant concern with dynamic
sites. Databases require work to ensure their security. If your database
goes away, you have nothing. This means you want to have regular
backups, your database server firewalled off from anything that could
attack it, strong permissions around who can access it and by what
means. You need technical people on hand a lot more frequently to
maintain a CMS. Static sites don’t have a database. There are still some
basic security concerns, but many fewer of them.

Another advantage can be responsiveness. Because the server isn’t doing
all that work every time someone visits, it can respond to a lot more
queries a lot faster. You could host hundreds or even thousands of
high-traffic static websites on an average server because the files are
so lightweight it takes almost nothing from the server to return them.
Ultimately these three reasons are why we chose to use a static site for
18f.gsa.gov. It’s a relatively small site, mostly simple content that
doesn’t change very often or require much interaction beyond reading. We
have a technical enough team to keep it maintained and it’s simple
enough that transferring that knowledge to other people on the team is
not hard.

**Will:** What about commenting?

**Greg:** When you make a comment on a CMS you're writing to the
database and your comment shows up on the next page load. There aren’t
great ways to do commenting on a static site right now because the
website a visitors sees is static HTML without an easy way for a website
visitor to add a comment. There's no database, so there's no easy way to
store the comment attached to a specific post, and there's no
application running in the background to validate and process a form
submission.

If we wanted comments on [18f.gsa.gov](http://18f.gsa.gov/) we'd either
have to build something that would immediately save to a file and
rebuild the site or use a third-party service. Going down the second
road forces us to think about questions like: What are the terms of
service? How does this company handle our users’ data? Will they
arbitrarily decide to start injecting ads into our site? How do built-in
moderation features work? These are all kinds of things you don't
necessarily have to think about if you want comments in a CMS.

We think people should know exactly what they're getting when they load
[18f.gsa.gov](http://18f.gsa.gov/) and where it's coming from: us.

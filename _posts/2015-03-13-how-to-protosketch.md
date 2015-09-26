---
title: How to protosketch
date: '2015-03-13'
layout: post
image: /assets/images/2014/12/protosketch.jpg
tags:
- protosketching
- 18f consulting
- how we work
- agile

authors:
- alan
- robert
description: "If you are a leading a project, ask for a protosketch. If you are a developer, learn to protosketch. Create imagination-sparking moments, in the meeting. Give your team the freedom to play — with ideas, code and data. Minimize risk to your project and the American taxpayer by quickly testing ideas with the end-user in a vivid, clickable form. Develop and evaluate hypotheses on the fly. Protosketch to delight your team, your boss, and your customers."
excerpt: "If you are a leading a project, ask for a protosketch. If you are a developer, learn to protosketch. Create imagination-sparking moments, in the meeting."
---
This post is a follow-on to the 18F blog post:[
](https://18f.gsa.gov/2015/01/06/protosketch/)[*"Sketching with Code:
Protosketching"*](https://18f.gsa.gov/2015/01/06/protosketch/), which
concludes:

> If you are a leading a project, ask for a protosketch. If you are a
developer, learn to protosketch. Create imagination-sparking moments, in
the meeting. Give your team the freedom to play — with ideas, code and
data. Minimize risk to your project and the American taxpayer by quickly
testing ideas with the end-user in a vivid, clickable form. Develop and
evaluate hypotheses on the fly. Protosketch to delight your team, your
boss, and your customers.

Although not difficult, protosketching demands a definite "bag of
tricks" that one should understand to rapidly create web-enabled spike
solutions. Let's dive a little deeper in.

## Publicize your work with GitHub Pages

Your basic goal is to demonstrate possibilities rapidly. You can do this
on your personal computer and have people crowd around it---but it is
far more compelling to create an internet-accessible URL that your
participants can view on their own devices. A durable URL that survives
the meeting allows your work to be shown to others conveniently after
the meeting.

GitHub Pages is a great way to to host static HTML pages. It costs $0
and has no bureaucratic overhead. This gives you a stable, publishable
URL for your deliverable. As we will discuss below, by using JSON files
to simulate a database, you can do a surprising amount of protosketching
with static pages.

Incidental benefits to using GitHub Pages include the adoption of "open
source process constraints". It makes it easy to follow, for example,
the[
](https://github.com/18F/open-source-policy/blob/master/policy.md)[*18F
Open Source
Policy*](https://github.com/18F/open-source-policy/blob/master/policy.md),
"from the first line."

## Leverage design for free using a framework

HTML is the basis of most web-enabled protosktetching. You probably need
to understand HTML and CSS to protosketch rapidly. However, frameworks,
such as Bootstrap and its many analogs, make it easy to look good
quickly without deep knowledge of HTML design. In particular, such
frameworks are responsive, meaning that sites using them work well on
devices of different sizes and aspect ratios.

Although you may someday want to build a native mobile app, you will
generally want to start with a mobile-friendly website instead.

## jQuery API for mocking APIs quickly but dependably

One common thread in the projects being considered for 18F Consulting is
a desire to integrate disparate data sources into a single application
or dashboard-like interface. If feasible, a protosketch could and should
connect to these data sources via an API to provide a near real-world
demonstration of the desired product. Feasible within a protosketching
meeting might mean "accomplishable in 30 minutes."

You don't need a working API if you can mock one out with static JSON.
You can use jQuery to access the file or files to create a design that
will be structurally similar to one that actually accessed an API or
database. JavaScript allows you to tie any number of simulated
datasources together into one HTML page.

As a program manager describes the data types of each source, just add
samples to the JSON files. Soon enough, ask the program manager to
refresh the page on their laptop or smartphone, and like magic they will
see their product needs come to life. In many cases, it will be
worthwhile to optimize JavaScript code to nicely render arbitrary JSON.
In other words, the less your JavaScript knows about your data, the more
flexibly you can sketch in sample data.

## Making data malleable

The protosketcher should feel comfortable enough modifying sample data
so that it feels "malleable". Paul Graham, in an essay titled[
](http://www.paulgraham.com/hp.html)[*"Hackers and
Painters"*](http://www.paulgraham.com/hp.html), wrote:

> You should figure out programs as you're writing them, just as writers
and painters and architects do.

Realizing this has real implications for protosketching and software
design in general. It means that programs and data should be plastic, by
which we mean easily moldable and formable. As a programmer, you need to
select tools that make this easy.

Although Graham was extolling the benefits of LISP in that essay, the
same lesson applies to protosketching tools. Select tools and design
code so that you feel comfortable not just expressing your own ideas
about what should be built, but being an instrument for the program
manager's or end-user's vision. JavaScript and mock APIs give us this
freedom.

## Render rapidly by using public or fake data

It is convenient to work publicly in open-source to avoid security
issues, which means that we must use public or fake data, instead of
private or secure data. For the purpose of making a compelling demo in a
1-3 hour time span, it is usually easy to find public data that gets the
idea across, even if the final application will contain sensitive data.
An example of fake text is the famous Lorem Ipsum text. Wikimedia
Commons is a great source of photographs and visual designs that have
clearly expressed, open licenses (or lack of licenses).

Running a server

Given the power of JavaScript, you can quickly build impressive demos
with "fake" data using the JSON and jQuery API trick mentioned above.
However, you may decide you need to implement a durable, changing data
store. Such a data store cannot be easily realized with GitHub Pages. If
you must run a small web server to have a changable data store, such as
somenthing as simple as Ruby's Sinatra or Python's Flask, then[
](https://localtunnel.me/)[*localtunnel*](https://localtunnel.me/) makes
it very easy to provide a temporary public URL that points to your
computer's localhost.

You need not immediately abandon your JavaScript just because you have
chosen to have a durable data store on a server. Merely use Flask or
Sinatra only to implement the API that you have already mocked to
provide basic create-read-update-delete functionality. If you have used
Flask before, for example, this might take 20 minutes.

Heroku and similar application hosting platforms provides a more
permanent and robust solution.

## Theatrical devices

Protosketching is a form of coding athleticism--a performance art as a
well as a compositional art. Don't be ashamed to use a little
showmanship.

Here are some of the techniques we have used:

-   For the Navy Reserve, our use of a durable URL let the Captain see
    the working prototype on his phone in the meeting.

-   A logo is easy to copy and cheap to add. A logo quickens simple
    content into a living application.

-   Utilize frameworks like Bootstrap that make it easy to look good
    quickly in a fully responsive way by leveraging other people's
    design work.

-   Add just enough realistic data that the demo connotes exciting
    possibilities. We did this for GSA Human Resources department, and
    the result allowed them to think more clearly about what they
    wanted in the future.

-   Reuse wherever possible. In a one-hour challenge set by the
    Administrator of the GSA, we re-used our own[
    ](https://github.com/18F/answers)[*Answers*](https://github.com/18F/answers)
    open-source project, which itself was forked from a Code for
    America's Honolulu project. And it worked.

**Motivation: Remember, you're protosketching for the success of your project**
===============================================================================

Remember, the reason you are using a bag-of-tricks and theater is not to
flim-flam anyone or prove how smart you are. Fundamentally we seek to
de-risk a project by trying out ideas quickly, and that requires
effective communication of those ideas to all stakeholders. It is our
duty in any Agile, User-centered Design process to use any tool in our
kit to accomplish this. Protosketching is a valuable kind of spike
solution that lets you quickly get feedback from the user.

**Appendix: A technical example**
=================================

We exemplify some of the basic techniques mentioned in this article with
an online, functioning[
](https://18f.github.io/protosketch-demo/)[*prototype*](https://18f.github.io/protosketch-demo/)
hosted completely free-of-charge with GitHub Pages. An open-source
GitHub repo publicizes the code that implements it:[
](https://github.com/18F/protosketch-demo)[*protosketch-demo*](https://github.com/18F/protosketch-demo).
The README.md file explains a technique for running this site locally.
Feel free to fork this repository if it seems like a good starting point
for your own protosketching.

At the GitHub repository, you can find[
](https://github.com/18F/protosketch-demo/blob/master/app.js)[*app.js*](https://github.com/18F/protosketch-demo/blob/master/app.js),
which is the heart of the application. At the end of this file you find
an example of using JQuery to to read from a JSON file, which is
analogous to a an API call:

```javascript
$(document).ready(function() {
  $.getJSON("orders.json", function(data) {
    console.log(data);
    drawTable(data, "#current_order");
  });
});
```

The file[
](https://github.com/18F/protosketch-demo/blob/master/orders.json)[*orders.json*](https://github.com/18F/protosketch-demo/blob/master/orders.json)
is remarkably simple, and clearly malleable enough to support any basic
"database-backed website" situation.

```json
[
  {
    "id": 1,
    "date": "01\/12\/2015",
    "cost": "$15.54",
    "description": "Animal crackers and jelly beans"
  },
  {
    "id": 2,
    "date": "12\/01\/2014",
    "cost": "$12.34",
    "description": "Popcorn"
  },
  {
    "id": 3,
    "date": "11\/01\/2014",
    "cost": "$27.46",
    "description": "Pretzels, chips, and gummy bears"
  },
  {
    "id": 4,
    "date": "10\/01\/2014",
    "cost": "$15.20",
    "description": "Animal crackers and jelly beans"
  }
]
```

The running demo is lightly styled using bootstrap, as you can see from
the actual[
](https://github.com/18F/protosketch-demo/blob/master/index.html)[*HTML
file*](https://github.com/18F/protosketch-demo/blob/master/index.html).

`<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />`

Bootstrap does require you to set up your DOM with certain conventions, which you can see in the full file.

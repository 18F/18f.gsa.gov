---
title: "Developing the Draft U.S. Web Design Standards’ UI components"
date: 2016-04-01 09:00:00 -4
authors:
- maya
- marco
tags:
- web design system
- best practices
excerpt: "We’ve received many questions about the UI components that are in the
Draft U.S. Web Design Standards. In this post,
we’ll talk about how we built the components to be accessible so anyone
can use them, the structure of our CSS and JavaScript stacks, and how
it’s being adapted to work with other frameworks, like WordPress and
Drupal."
description: "We’ve received many questions about the UI components that are in the
Draft U.S. Web Design Standards. In this post,
we’ll talk about how we built the components to be accessible so anyone
can use them, the structure of our CSS and JavaScript stacks, and how
it’s being adapted to work with other frameworks, like WordPress and
Drupal."
image: /assets/blog/web-design-standards/home.png
---

We’ve received many questions about the UI components that are in the
Draft U.S. Web Design Standards. The library includes HTML, CSS,
JavaScript, images, and fonts that are packaged up and can be imported
into any project to create usable, accessible websites. In this post,
we’ll talk about how we built the components to be accessible so anyone
can use them, the structure of our CSS and JavaScript stacks, and how
it’s being adapted to work with other frameworks, like WordPress and
Drupal.

Accessible and inclusive
------------------------

One of our primary goals in developing the Draft Standards was to make
sites usable by everyone. This meant our UI components were built
prioritizing accessibility and compatibility with different devices and
environments.

The components are built on a solid HTML foundation and progressively
enhanced to provide core experiences across browsers and devices. This
means users will receive important information and be able to interact
with critical aspects of the site. While new browsers will showcase a
polished experience, older browsers will always have a usable
experience.

All components are built mobile first and will respond to different
screen sizes by modifying their layout and design. This, combined with a
purposefully small asset file size means the Draft Standards are
functional on different screen sizes and network speeds, including
mobile phones. Most of the components even function without JavaScript.

CSS stack
---------

The CSS foundation of this site is built with the
Sass preprocessor language and organized in
a modular structure. Sass improves the CSS syntax in order to provide
extra features and handy tools. It was built to fill in CSS’s
shortcomings, has a wide community of support, and is the most popular
preprocessor language.

The Draft Standards also uses two Sass libraries; Bourbon and Neat. It
uses [Bourbon](http://bourbon.io/) for its simple and lightweight Sass
mixin library, and the [Neat](http://neat.bourbon.io/) library for its
grid framework. Bourbon and Neat are open-source products from
[thoughtbot](https://thoughtbot.com/). None of these tools are
required to use the Draft Standards, if you prefer to not use Sass at
all, a compiled CSS stylesheet is available.

JavaScript stack
----------------

In order to have a small file footprint, and to allow the Draft
Standards to be used in any type of project, we kept our JavaScript
stack very small. The only framework we use is jQuery. jQuery allows us
to apply complex transformations to the browser's Document Object Model
or DOM in a way that works across different browsers and browser
versions. Without jQuery, we’d have to write specific code for older
browsers such as Internet Explorer 9. jQuery allows us to focus on the
interface we’re creating and less on differences between browsers.

WordPress, Drupal, and other frameworks
---------------------------------------

We want to make it easy for web administrators to adopt the Draft
Standards with minimal hassle. This means the Draft Standards should be
able to plug into sites written in different programming languages and
build with different frameworks. In order to support a wide range of
different stacks, the Draft Standards were built to not favor any over
the other, but focuses on plain HTML, CSS, and JavaScript that can be
incorporated into any framework or programming language. The core Draft
Standards team is focusing on the framework and letting outside teams
and the open source community develop plugins for other stacks. There
are already separate government and public teams working on developing
their own CMS themes for
[Drupal](https://github.com/18F/web-design-standards-drupal) and
[Wordpress](https://github.com/bbertucc/us-web-design-standards-wp).
Additionally, 18F’s static CMS
[Federalist](https://federalist.18f.gov/), which helps agencies deploy
static, secure, and scalable websites, uses the Draft Standards.

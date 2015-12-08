---
title: Introducing the U.S. Web Design Standards
date: 2015-09-28
authors:
- mollieruskin
- carolyn
- maya
- colinmacarthur
tags:
- proactive federal partner
- our projects
- design
- usds
- open source
excerpt: The U.S. Web Design Standards is the U.S. government’s very own set of common UI components and visual styles for websites. It’s a resource designed to make things easier for government designers and developers, while raising the bar on what the American people can expect from their digital experiences.
description: The U.S. Web Design Standards is the U.S. government’s very own set of common UI components and visual styles for websites. It’s a resource designed to make things easier for government designers and developers, while raising the bar on what the American people can expect from their digital experiences.
image: /assets/blog/web-design-standards/home.png
---

*This project was a collaboration between 18F and the U.S. Digital
Service (USDS). The team was led by Mollie Ruskin (USDS) and Julia Elman (18F) and made up of
designers and developers in both groups, including Maya Benari (18F),
Carolyn Dew (18F), Victor Garcia (USDS), Angel
Kittiyachavalit (USDS), Colin MacArthur (18F), and Marco Segreto (18F).*

Joanne is a young Army Veteran who is looking to make use of her GI Bill
Benefits and apply for federal student loans to attend college.

In trying to access the federal programs which will allow her to afford
college, Joanne must navigate the websites of multiple agencies. She
finds dozens of government websites which all seem relevant to what
she’s looking for. Joanne is confused. Are these programs related to
each other? Are they even all a part of the federal government? Are any
of these a scam? When she tries to access the sites on the bus on her
commute to work, she finds half of them are impossible to use on her
phone. She’s overwhelmed by how hard these tools are to use, misses
opportunities she’s eligible for, and feels frustrated and isolated.

Joanne is not alone. When the American people go online to access
government services, they’re often met with confusing navigation
systems, a cacophony of visual brands, and inconsistent interaction
patterns.

![A collection of buttons from government websites with many different colors and styles.](/assets/blog/web-design-standards/buttons.png)
*Each button, a special snowflake. A snapshot of a quick survey of buttons across government websites.*

Dedicated federal workers are striving to build helpful digital tools
for people like Joanne. But our work happens in silos, under unique
brands and programs. As a result, we spend a lot of time “reinventing
the wheel” — recreating common patterns such as buttons, forms, and
search bars — over and over again. At the end of the day, we’re creating
poor user experiences, and wasting American taxpayer dollars in solving
the same problems again and again.

Taking after a growing trend in the private sector, several federal
agencies have begun creating design patterns and user interface (UI)
toolkits to build unity within their own digital brand. Some shining
examples include those of the [Consumer Financial Protection
Bureau](https://cfpb.github.io/design-manual/) (CFPB), [US Patent and
Trademark Office](http://uspto.github.io/designpatterns/) (USPTO), and
[Healthcare.gov](http://styleguide.healthcare.gov/).

This is a time-intensive endeavor, and not all agencies have the
resources to support it. To best serve users like Joanne, we need to set
a new bar for simplicity and consistency **across** government services,
not just within a given agency or program.

The question in front of us became: Is it possible to create a shared
set of tools to provide consistent, beautiful, and easy-to-use
government websites?

## What we built

![A screenshot of the U.S. Web Design Standards on a desktop, tablet,
and mobile device.](/assets/blog/web-design-standards/home.png)
*The U.S. Web Design Standards are designed to be viewed on any
device.*

The [U.S. Web Design
Standards](https://playbook.cio.gov/designstandards)
are the U.S. government’s very own set of common UI components and visual
styles for websites. It’s a resource designed to make things easier for
government designers and developers, while raising the bar on what the
American people can expect from their digital experiences.

In the Web Design Standards, you will find:

-   **A visual style guide**: Typography and color recommendations that are 508 compliant, flexible, and designed for readability and impact.

-   **Common UI components and patterns**: A collection of foundational interface elements for government sites and the code that powers them.

In creating these tools, we set out to accomplish four goals:

1.  **Make the best thing, the easiest thing.** We believe that making tools that align with the values and needs of digital workers in the federal government will drive adoption.

2.  **Be accessible out of the box.** We created tools that seamlessly meet the standards of 508 accessibility, from colors to code.

1.  **Design for flexibility.** We aim to give the American people a sense of familiarity when using government services, while allowing agencies to customize these tools to fit their unique needs.

1.  **Reuse, reuse, reuse.** We reviewed, tested, evaluated, and repurposed existing patterns, code, and designs from dozens of government and private sector style guides to make use of tried-and-true best practices.

## The process

What began as an idea turned into four months of rapid
development and iteration by a collaborative team at 18F and the U.S.
Digital Service, under the guidance of an advisory board of talented,
experienced government workers in the CFPB, the Food and Drug
Administration, the Department of Veterans Affairs, the Social Security
Administration, the Department of Education, the Internal Revenue
Service, and the GSA.

As with all 18F and U.S. Digital Service projects, we’re working in the
open to create a resource that everyone can own and contribute to. We’ve
taken an iterative, user-centered approach to ensure we’re addressing the
needs of our users as well as government designers and developers. A
cross-functional team of UX, front-end, and visual designers each played
a key role in this process:

![An early wireframe of our design suggestion for a reset password
page.](/assets/blog/web-design-standards/wireframe.png)
*An early wireframe of our design suggestion for a reset
password page*

### User Experience

“Making the best thing the easiest thing” starts with making the
standards website itself easy to use. With every iteration of this
product, we conducted numerous interviews, usability tests, and card
sorts with designers and developers across government. Everything from
the site’s organization scheme to its code snippets and download buttons
are informed by user research.

The design of every component follows data-informed best practices,
found both inside ([DigitalGov](https://www.digitalgov.gov/)) and
outside (Nielsen Norman group articles) of government. Many components
were derived from other agency and style guide patterns; more complex
patterns were further tested with end users.

We believe agencies should still usability test everything they build,
but following the standards will help everyone avoid common pitfalls.

![A sample of code from the Web Design Standards.](/assets/blog/web-design-standards/code.png)
*All of our standards include code samples.*

### Front-end

We wanted to create a single reference point for developers in need of
common patterns, providing the building blocks of code for teams to
assemble websites. Our goal was to build a system of components shaped
by modern best practices in front-end development and government
accessibility standards.

We built the UI components on a solid HTML foundation, progressively
enhanced to provide core experiences across browsers. All of the code is
508 compliant, so it’s accessible to everyone. Our styles are written
with Sass and can be used as a Sass library or included directly as
compiled CSS. In order to make sure our code was easy to read and easy
to pick up, it had to look like it was written from a single voice.
After speaking with dozens of front-end developers and designers in
government, we sought to strike a balance between modular CSS and code
that’s clean and easy-to-use.

![A screenshot of the color section of the Design Standards.](/assets/blog/web-design-standards/colors.png)
*The Design Standards include an extensive color palette.*

### Visual design

We set out to create a single common visual style to apply flexibly on a
broad range of government platforms. We wanted a clean, modern aesthetic
that communicates credibility, trust, and warmth and meets high
standards of visual accessibility.

We conducted a branding exercise, auditing dozens of government
websites, logos, and brand styles. We tested dozens of typefaces, with a
laser focus on open source and highly-legible pairings. The font suite
we selected — a sturdy serif and slender sans serif — meet a range of
layout needs, from polished marketing pages to content-heavy digital
services. We landed on a palette of blue, gray, white, and red that can
be applied generously or sparingly to create a distinctly American
flavor with adaptability baked in.

## We’re just getting started...and we need you!

Like any true alpha, this is a living product; we will continue to test
our decisions and assumptions with real-world feedback as it develops and evolves. We encourage you to explore the [U.S. Web Design Standards](https://playbook.cio.gov/designstandards), contribute your own code
and ideas, and leave feedback on [GitHub](https://github.com/18F/web-design-standards). We will use
your input to improve the standards and make regular releases in the
coming weeks and months.

[Check out the U.S. Web Design Standards](https://playbook.cio.gov/designstandards) and [let us know what you
think](https://github.com/18F/web-design-standards/issues)!

-----------

*This project was a major feat of collaboration. We’d probably still be
off in a corner designing buttons if it hadn’t been for the
encouragement, feedback, and support of this incredible group of people
both inside and outside of government.*

*A heartfelt thanks to Mollie Bates, Nick Bristow, Danny Chapman, Scott
Cranfill, Elizabeth Goodman, Victor Garcia, Kavi Harshawat, Michael Jovel, Jeremiah
Kimelman, Deepa Kunapuli, Maria Marrero, Brad Nunnally, Alex Ose, Eric
Ronne, Nick Setthachayanon, Jessica Teal, Jennifer Thibault, Ryan
Thurlwell, Russ Unger, Charles Worthington, and Emily Wright-Moore for
always being available to help us think through some of the extra sticky
bits. Major kudos to Mike Bland and Alison Rowland for making [18F Pages](https://18f.gsa.gov/2015/05/14/18Fpages/)
work seamlessly for this project.*

*A special shout out to Julia Elman for her hard work in
getting this thing off the ground and to John Yuda for seeing us through
to the end. And thanks to Code for America's Norris Hung and Frances Berriman for their contributions to this project.*

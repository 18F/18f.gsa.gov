---
title: "How user archetypes informed the Draft U.S. Web Design Standards"
date: 2016-03-18
authors:
- carolyn
tags:
- web design system
- user research
- how we work
excerpt: "To celebrate Sunshine Week, we’re highlighting some groundbreaking open government work by the Department of the Treasury, one of 18F’s partner agencies."
description: "To celebrate Sunshine Week, we’re highlighting some groundbreaking open government work by the Department of the Treasury, one of 18F’s partner agencies."
image: /assets/blog/web-design-standards/vision-provider.jpg
---

This past fall, [we announced the alpha release of the Draft U.S. Web Design Standards]({{ "/2015/09/28/web-design-standards/" | url }}), a set of “open source UI components and a visual style guide to create consistency and beautiful user experiences across U.S. federal government websites.” When we started work on the [standards](https://playbook.cio.gov/designstandards/), we knew we needed to start with a strong understanding of our users. We had two groups in mind — one was our end users, the folks who would eventually be using the government sites built with the Draft Standards. The other group included the folks actually implementing the Draft Standards in
their projects — designers and developers within the federal government.

Since this project was conceived as an optional resource for federal agencies, adoption of the Draft Standards depended largely on whether or not we could legitimately meet the needs of the designers and developers working within those organizations. Without that, we’d never get the chance for the Draft Standards to serve the public in any meaningful way.

For the first phase of our research, we decided to focus on this group and give the development team some time to build some of the components that would be included in the Draft Standards, which we could test with users at a later date.

## Who we found

Jumping off from an idea suggested by Julia Elman (the project lead on the 18F side), Colin MacArthur and I created a series of user archetypes inspired by [this article on the TED blog](http://hello.ted.com/2013/10/08/whats-your-ted-habit/). User archetypes presented a way of concisely describing the behaviors and needs of the people who would be using the standards. We based our initial archetypes on preliminary discussions and user interviews, recognizing that they’d evolve during the course of the project and as we got more research under our belts. With that in mind, we kept the descriptions loose and the images sketchy to indicate the “work in progress” status that we intended. Following some quick interviews and brainstorming sessions, we came up with the following archetypes.

{% image_with_class "assets/blog/web-design-standards/vision-provider.jpg" "width-400px" "Stick figure zapping two Pantone chips." %}

### The Vision Provider

#### Who they are

The Vision Provider is often a creative director or tech lead for a digital team.

#### Why they’re using the Draft Standards

They want a cohesive resource they can point their team and contractors to so they can create consistent products and experiences. This person is more likely to advocate for adoption of the Draft Standards in their agency if they believe in the broad mission of the Draft Standards.

#### Concerns and challenges

They may face challenges convincing less experienced folks on their team on why the Draft Standards are important, or they may themselves not want to override the brand identity for their agency that has already been developed. They wonder how much they can customize the Draft Standards before they defeat the purpose of a unified user experience.

{% image_with_class "assets/blog/web-design-standards/newbie.jpg" "width-400px" "Stick figure of a person with an I heart gov shirt and a coffee cup." %}

### The Newbie

The Newbie is a designer or front end developer who is new to government and early in their career.

#### Who they are

They’re excited to prove their mettle, but they may not be experienced enough to create new designs or stand up prototypes quickly.

#### Concerns and challenges

They don’t fully understand the need for design standards. They may resist using design standards because they don’t want their creativity to be stifled.

{% image_with_class "assets/blog/web-design-standards/lone-ranger.jpg" "width-200px" "Stick figure of a cowboy." %}

### The Lone Ranger

#### Who they are

The Lone Ranger is a one-off (or two-off) designer or front end developer in an agency, trying to do the right thing but without a lot of time or support.

#### Why they’re using the Draft Standards

They will use the Draft Standards to cut down on design and development time, and as leverage for arguing for best practices to higher ups who might otherwise pull rank on design or development decisions.

#### Concerns and challenges

The Lone Ranger wants to be able to get started with the Draft Standards quickly and not have to fuss with a lot of compatibility issues. They worry about tying their projects to a resource without knowing whether or not it will be maintained.

{% image_with_class "assets/blog/web-design-standards/master-builder.jpg" "width-200px" "Stick figure wearing a hard hat." %}

### The Master Builder

#### Who they are

The Master Builder is a savvy developer who is working alone or with others and is looking for components to download and integrate.

They see their code as their personal craft and value clean, semantic markup that is easy to manipulate. They have strong opinions on how code should be written and want to know why specific decisions were made about the code within the Draft Standards.

#### Why they’re using the Draft Standards

The Master Builder doesn’t want to have to do mindless “grunt work” such as styling tables or making form fields accessible, and would rather focus their attention on more creative problem solving.

{% image_with_class "assets/blog/web-design-standards/reviewer.jpg" "width-400px" "Stick figure looking at a website with a magnifying glass." %}

### The Reviewer

#### Who they are

The Reviewer is charged with inspecting other teammates’ code or designs and making sure this work is up to snuff. They’re usually quite experienced in their role and may have to support others who don’t have as much professional experience.

#### Why they’re using the Draft Standards

The reviewer wants to point to the Draft Standards to help these folks implement good front end code, reducing the amount of emergency clean-up they have to deal with. They may refer to the Draft Standards documentation when reviewing code.

{% image_with_class "assets/blog/web-design-standards/decider.jpg" "width-400px" "Stick figure holding onto a yes/no switch." %}

### The Decider

#### Who they are

The decider chooses whether or not to use the Draft Standards on a project. They assess what is offered in the Draft Standards with the needs and state of their project. They may be in a position of authority, or they may be at the front lines looking to make recommendations to higher ups.

#### Concerns and challenges

They will ask questions about how the Draft Standards will be maintained and how they will integrate with existing technology stacks and work-flows.

{% image_with_class "assets/blog/web-design-standards/macgyver.jpg" "width-400px" "A monitor duct taped together." %}

### The MacGyver

#### Who they are

The MacGyver is a back end developer who has been charged with front end design and development, despite protests. This person has to produce web pages despite their lack of experience with the persnickety inconsistencies of browser rendering — CSS is their nemesis.

#### Why they’re using the Draft Standards

They would like a resource with downloadable templates and components so they stand up sites quickly can get back to what they love — arguing data schematics.

{% image_with_class "assets/blog/web-design-standards/pinch-hitter.jpg" "width-200px" "Stick figure with a baseball bat." %}

### The Pinch Hitter

This person has a design background and is very skilled in HTML and CSS; they may be familiar with JS, but they’re not an expert.

#### Why they’re using the Draft Standards

They rely on the pattern library components to work out of the box, and they need explanations of any dependencies and how to implement them.

#### Concerns and challenges

They are concerned about conflicts with existing frameworks because these are difficult to resolve with their limited development experience.

{% image_with_class "assets/blog/web-design-standards/influencer.jpg" "width-400px" "Stick figure posing next to a monitor that says new and shiny." %}

### The Influencer

#### Who they are

The Influencer likes the idea of creating a consistent user experience across government websites and wants to empower government employees to work toward this goal. They play a key role in advocating for adoption of the standards, and they want the site itself to offer language and resources to help them out.

{% image_with_class "assets/blog/web-design-standards/contract-manager.jpg" "width-400px" "Blind-folded stick finger pointing at three numbered doors." %}

### The Contract Manager

#### Who they are

The Contract Manager is in charge of managing work for — you guessed it — government contractors.

#### Why they’re using the Draft Standards

They want their projects to benefit from quality design and front end development work, but do not necessarily know what it looks like or how to enforce it. They want to be able to specify that contractors follow web design standards with specific legalese.

{% image_with_class "assets/blog/web-design-standards/clock-racer.jpg" "width-400px" "Stick figure coding with clocks in the background." %}

### The Clock Racer

#### Who they are

This unfortunate soul has been given way too much work to do in too little time.

#### Why they’re using the Draft Standards

They want to be able to stand up quick prototypes and sites with minimal fuss. They’ll choose resources that allow them to get up and running quickly, and they don’t want to have to read a lot of documentation to be able to do it.

#### Concerns and challenges

They are more likely to choose a tool they are already familiar with than to experiment with an unfamiliar resource. If getting started is too confusing or takes too long, they will choose a different resource. Copy-paste is their M.O.

## Applying and refining

Throughout the project, we referred to these archetypes to understand and describe our direct users, their challenges, and their goals. When research helped us uncover new categories or embellish ones we’d already identified, we updated the descriptions accordingly.

How do you use user archetypes to inform your work? Let us know at [uswebdesignstandards@gsa.gov](mailto:uswebdesignstandards@gsa.gov), we’d love to hear from you!

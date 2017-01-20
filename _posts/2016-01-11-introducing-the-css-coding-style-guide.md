---
layout: post

title: "Introducing the CSS coding style guide"

image: /assets/blog/css-guide/css-guide.png

description: "18F is releasing our CSS coding style guide, which specifies our best practices and rules for writing consistent, maintainable CSS code."

excerpt: "18F is releasing our CSS coding style guide, which specifies our best practices and rules for writing consistent, maintainable CSS code."

authors:
- marco
- jeremiak

tags:
- design
- guides
- tools you can use
---

18F is releasing our [CSS coding style guide](https://pages.18f.gov/frontend/css-coding-styleguide/), which specifies our best practices and rules for writing consistent, maintainable CSS code. It was built with extensive user research to ensure we accurately understood the problems our developers were facing and to match them up with conventions in the public frontend community.

## What’s in the guide

The guide uses two approaches to improving CSS code at 18F: a written guide and a linter to automatically check code for compliance to our guidelines.

The guide lays out rules and recommendations on writing consistent and maintainable CSS. The first part of the guide goes over 18F’s recommended CSS frameworks and CSS processing languages: Sass and Bourbon Neat. These were chosen because they’re broad enough to allow us to apply our standards in different situations, and they have wide-spread use in the current front end community.

We also have guidelines on whitespace, sorting order, naming conventions and general formatting. Supplying these rules allows different codebases to all remain consistent so 18F developers don’t have to adjust to new ways of writing CSS when they join different teams, which happens often due to the large number of simultaneous projects happening at 18F.

While many of the rules in this guide are meant to standardize CSS code across our projects, we also wanted to include the best practices from the front end community. We researched numerous open sourced guides and resources to develop suggestions for CSS architecture, file structure, how and when to use certain language features and CSS specificity. Since CSS as a language has very few constraints, having a set of guidelines can help less advanced developers write CSS in a more sustainable way.

While 18F developers are diligent about reading guides and following best practices, everyone can use a little help sometimes. So we made a linting tool that checks a codebase to ensure it conforms to all the rules in the guide. The linter can be used both on GitHub or locally to check code on a developer's computer. If the linter finds any discrepancies between the code and our guide, it will issue a warning and the developer can choose how to proceed. Automated testing like this helps ensure we’re shipping the best quality code we can, while also freeing up time so developers can spend more time coding and less time testing.

## Getting started

To get started using the style guide for your Sass code, we recommend setting up the linting tools and running them on your project using [these instructions](https://pages.18f.gov/frontend/css-coding-styleguide/). The linter can either be set up to run locally or run on each pull request through the free Hound CI service. Either option works, it depends on what is best for your team.

## Coming up

We'd like to continually improve this project as we go forward. Future updates may include:

- Ensure we have linting tools that work with pure CSS rather than just Sass.
- Update our linter so when it gives warnings they'll tie back to the coding style guide. This could mean setting up identifiers for each rule in a similar way to how [pylint](http://www.pylint.org/) does it.
- Track metrics on the success of the style guide by monitoring how many 18F project teams are conforming to it.
- Reach out to other federal development teams to expand or modify the guide so it can work for all federal teams.

If you have any feedback on the style guide, please [open an issue at the 18F frontend repository on GitHub](https://github.com/18F/frontend/issues).

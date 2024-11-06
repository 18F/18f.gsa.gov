---
title: "Take our code: 34 reusable projects from 18F"
date: 2016-04-06
authors:
- britta-gustafson
tags:
- tools you can use
- open source
excerpt: "We encourage you to adapt 18F open source projects for your work and personal purposes, whether you’re a fellow federal employee or outside government. We’ve put together a list of some 18F repositories that might be especially useful to you."
image:
---

Since 18F’s mission is to transform government, we’re constantly
thinking about how to scale up our impact. How can our custom-developed
work get more mileage in benefitting the federal government and beyond?
One way is through reuse of our open source code.

We encourage you to adapt 18F open source projects for your work and
personal purposes, whether you’re a fellow federal employee or outside
government. We’ve put together a list of some 18F repositories that
might be especially useful to you — for your own projects, as part of a
nonprofit or business, part of a government somewhere, or for something
else that you’re working on.

[18F’s open source
policy](https://github.com/18F/open-source-policy/blob/master/policy.md)
emphasizes that our work belongs to you. Our policy says:

> The code we create belongs to the public as a part of the public
> domain. The code we work on was paid for by the American people, but
> the end-product is not the only way they should be able to interact
> with their government. By coding in FOSS [Free and Open Source
> Software], we help populate a larger commons that cities, states,
> businesses, and individuals can participate in. This creates real
> economic value by lowering the burden of replicating similar work or
> by allowing the private sector to build off of and create new
> businesses around code developed at 18F.

We know it might be overwhelming to look at all the [hundreds of
repositories in the 18F GitHub organization](https://github.com/18F) to
figure out what might be useful for you. They include a variety of
projects in varying stages of development: client projects, tools we’ve
built to support our work, guides we’ve written, prototypes, other
people’s open source tools that we’re adapting, and more. We’re
continually thinking of ways to share our work better, and here’s one
experiment!

This list is part of our New Year’s resolution to [be more
open]({{ "/2016/01/07/18f-new-years-resolution-be-even-more-open/" | url }}).
Following up on those goals, we’ve also been working more on identifying
parts of our work that are generic and decoupling them from the
applications we developed them for.

If you’re interested in volunteering to contribute to our work, these
projects are in varying stages of development and would generally
benefit from external expertise — feel welcome to open issues and pull
requests. We’re also featuring selected [“help wanted”
tasks](https://github.com/search?q=user%3A18f+label%3A%22help+wanted%22)
in our weekly newsletter (link removed). If you
have suggestions for other 18F projects to include in a future iteration
of this list, you can add them to [the discussion of our New Year’s
resolution](https://github.com/18F/18f.gsa.gov/issues/1445).

## If you maintain your team’s websites

-   [**analytics.usa.gov**](https://github.com/18F/analytics.usa.gov): Publish live analytics for your website(s) on a public page — see [analytics.usa.gov](https://analytics.usa.gov/) for an example. This can help both staff and visitors understand how people use your website. You can also separately use a component of it: [**Analytics Reporter**](https://github.com/18F/analytics-reporter), a reporting and publishing tool for Google Analytics data.

-   [**18F Pages**](https://github.com/18F/pages): Help your team quickly publish static websites with 18F Pages, which is a Jekyll-based system similar to [GitHub Pages](https://pages.github.com/) that [lets you use your own infrastructure]({{ "/2015/05/14/18Fpages/" | url }}). We use 18F Pages to publish guides and other simple websites on [pages.18f.gov](https://pages.18f.gov/) (with content hosted on GitHub).

## If you help your team work together

-   [**Checklistomania**](https://github.com/18F/checklistomania): Build centrally-managed todo lists for complex processes such as team member onboarding/offboarding and management changes.

-   [**Open Opportunities**](https://github.com/18F/openopps-platform): Especially for large organizations, this is a way for staff to share news about available internal tasks that might be interesting to somebody in a different part of the organization.

-   [**Tock**](https://github.com/18F/tock): Track how much time team members spend on projects by asking them to fill out a weekly timesheet in Tock. It’s more convenient than a collection of spreadsheets, and lighter-weight than many of the available commercial time tracking tools.

## If you build digital services for government

-   [**Compliance Masonry**](https://github.com/opencontrol/compliance-masonry): Simplify the process of building certification documentation (especially for modern applications built on pre-existing systems) by generating documentation based on the [**OpenControl Schema**](https://github.com/opencontrol/schemas), a machine-readable format for writing and generating compliance documentation.

-   [**Draft U.S. Web Design Standards**](https://github.com/18F/web-design-standards): Use these pre-built UI components and visual styles to help you create beautiful, easy-to-use U.S. federal websites.

-   [**eRegulations**](https://eregs.github.io/): Make your agency’s regulations easier to find, read, and understand with this web application that you can adapt to your agency’s needs. (A collaboration between the Consumer Financial Protection Bureau and 18F.)

-   [**FISMA Ready**](https://github.com/fisma-ready) ([introduction](https://github.com/fisma-ready/introduction)): Make Federal Information Security Management Act compliance easier by sharing and reusing configurations and best practices for various pieces of software and tooling.

-   [**Samwise**](https://github.com/18F/samwise) - Access the SAM.gov API via Ruby.

## If you work with lots of data

-   [**AutoAPI**](https://github.com/18F/autoapi): Set up a simple API engine that converts flat data files into a web service.

-   [**Document Processing Toolkit**](https://github.com/18F/doc_processing_toolkit): Extract text from PDFs, and default to OCR when text extraction fails.

-   [**gapps-download**](https://github.com/18F/gapps-download): Download documents from Google Drive with a quick command so that you can easily republish them to the open web.

-   [**Open Data Maker**](https://github.com/18F/open-data-maker): Turn CSV files into easily accessible open data.

-   [**rdbms-subsetter**](https://github.com/18F/rdbms-subsetter): Generate a random sample of rows from a relational database that preserves referential integrity. Good for creating test or development databases from production.

## If you make websites that communicate lots of information

-   [**Accordion**](https://github.com/18F/accordion): Reuse this accessible JavaScript accordion component, such as for sidebar navigation.

-   [**Glossary**](https://github.com/18F/glossary): Add a collapsible glossary sidebar to your website to give readers a quick way to look up important specialized terms. We made this for the [beta Federal Election Commission website](https://beta.fec.gov/) and split it out for reuse in future projects, and now the [U.S. Extractive Industries Transparency Initiative](https://useiti.doi.gov/) is using it too.

-   [**Linkify citations**](https://github.com/18F/linkify-citations): Turn legal citations into links with this JavaScript plugin, which uses a [public domain legal citation engine](https://github.com/unitedstates/citation).

-   [**Private Eye**](https://github.com/18F/private-eye): Using this JavaScript plugin, provide in-context indicators to readers that some of the links on a page won’t be accessible to them.

## If you use [Slack](https://slack.com/)

-   [**Coffeemate**](https://github.com/18F/coffeemate): Help team members get to know each other by finding a teammate to have a coffee with.

-   [**Dolores Landingham Bot**](https://github.com/18F/dolores-landingham-bot): Help onboard new team members with this Slack bot that sends scheduled direct messages with helpful tips.

-   [**hubot-slack-github-issues**](https://github.com/18F/hubot-slack-github-issues): File an issue in a GitHub repository by tagging a Slack chat message with a specific emoji reaction. For example, this is a quick way to remind yourself (or your team members) to integrate a useful piece of information from chat into the documentation for your project.

-   [**Slack Emoji Search**](https://github.com/18F/emoji_search): With this command-line utility, search for Slack messages that have been reacted to with a specific emoji.

## If you use [Jekyll](http://jekyllrb.com/)

-   [**Jekyll Frontmatter Tests**](https://github.com/18F/jekyll_frontmatter_tests): Add tests to make sure you're always including required fields on posts or other documents.

-   [**Jekyll-get**](https://github.com/18F/jekyll-get): Download data from external JSON sources to use in generating your site.

-   [**Jekyll Pages API**](https://github.com/18F/jekyll_pages_api): Generate a JSON file with data for all the pages in your site.

-   [**jekyll\_pages\_api\_search**](https://github.com/18F/jekyll_pages_api_search): Add search to your site, no server required.

## If you use [Cloud Foundry](https://www.cloudfoundry.org/)

-   [**BOSH Release for New Relic server monitor**](https://github.com/cloudfoundry-community/newrelic-boshrelease): Set up New Relic to monitor your Cloud Foundry deployment ([more about BOSH](https://bosh.io/docs/about.html)).

-   [**cg-cron**](https://github.com/18F/cg-cron): Run cron jobs in a Cloud Foundry app. Also: [**cf-go-cron**](https://github.com/18F/cf-go-cron), an experimental rewrite in Go. (These are in alpha stage.)

-   [**Cloud Foundry Deck**](https://github.com/18F/cg-deck): If you use Cloud Foundry, manage your applications with a web UI.

-   [**Cloud Foundry Notifications for Hubot**](https://github.com/18F/hubot-cf-notifications): Get chat notifications (in Slack or [elsewhere](https://hubot.github.com/docs/adapters/)) about deployments of applications within Cloud Foundry.

-   [**Cloud Foundry RDS Service Broker**](https://github.com/cloudfoundry-community/rds-broker): Manage RDS instances and a shared RDS Database. We’re working on a generic version to handle more AWS services at [**aws-broker**](https://github.com/18f/aws-broker), and we’ll update the community version when they’re complete.

See also: [our list of cloud.gov platform
tools](https://docs.cloud.gov/ops/repos/).

## If you want information about websites

-   [**domain-scan**](https://github.com/18F/domain-scan): Use this command-line tool to run several open source scanning tools on domains to measure aspects such as speed, accessibility, and HTTPS.

-   [**urlsize**](https://github.com/18F/urlsize): Determine the file sizes of one or more URLs via this command-line tool.

For more guidance about reusing or contributing to our work, take a look
at our [open source
policy](https://github.com/18F/open-source-policy/blob/master/policy.md).
While not required, if you end up using one of our tools, we would love
to hear from you. You can tweet at [@18F](http://twitter.com/18f),
open an issue in the relevant repository to write a note about that
project, or send us an email ([18F@gsa.gov](mailto:18F@gsa.gov)).
Looking forward to hearing from you!

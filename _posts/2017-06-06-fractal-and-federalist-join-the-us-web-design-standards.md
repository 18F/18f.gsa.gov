---
title: "Fractal and Federalist join the U.S. Web Design Standards"
authors:
 - shawn
tags:
- web design system
- open source
- federalist
excerpt: "We've added two powerful, new tools to the U.S. Web Design Standards development workflow. Fractal is a development, testing, and documentation tool, and Federalist is an 18F hosting platform that makes it easy to generate previews and simplify our process."
---

We've recently added two powerful tools to the [U.S. Web Design Standards](https://standards.usa.gov/) development workflow that allow us to preview, test, and publish the Standards code more quickly and easily.

## Fractal

[Fractal](http://fractal.build/) is a powerful and flexible framework for building interactive component libraries. It's similar to [Jekyll](https://jekyllrb.com/) (which we use to publish the Standards site) in one key respect: It operates primarily on simple file naming conventions. Organize your files in a specific way, using the content and data formats it understands, and it will generate a web site automatically.

<figure>
  <img src="{{site.baseurl}}/assets/blog/web-design-standards/fractal-federalist.png" alt="The design standards homepage rendered in Fractal" width="624" height="380" />
  <figcaption>Check out the Standards in Fractal</figcaption>
</figure>

### Why Fractal?

-   **It's open source**, so we didn't have to pay for it (which can be time-consuming and difficult to authorize in government), and we can easily modify it to suit our needs.

-   **It's easy to use.** Fractal supports some of the same, user-friendly file formats as Jekyll, such as Markdown and YAML; and it comes with a handy development server that reloads the site automatically whenever you change a file.

-   It generates **standalone HTML previews of each component**, which we can use for accessibility, cross-browser, performance, and visual regression testing.

-   **It uses or supports many of the technologies we use already** (or intend to use in the future), such as Node.js (the JavaScript environment in which we write, build, and publish our code) and Nunjucks templates — which are compatible with a number of other template languages, including Jinja2 for Python and Twig, the PHP templating engine used by Drupal.

-   Fractal offers a **customizable theme engine**, so we can make it look and feel like the Standards.

### Thinking in components

Fractal's component-oriented architecture nudged us to consider how each of [our own components](https://standards.usa.gov/components/) really *work*: What are their moving parts, and how do their "variants" (for instance, our basic and extended headers) differ from one another? The process of adapting our components to Fractal produced a basic interface inventory, which shows us exactly where we are right now, and the interactive previews give us the confidence to make bigger changes because we can immediately see their impacts on various aspects of the Standards.

### Painless development

Fractal has also made it much simpler to work on the Standards' CSS,
JavaScript, and HTML component templates. Previously, the only "place" we could test our components interactively was on this site, which was tricky to set up: Each person needed to clone both of our repositories, `npm link` them together, then manually restart the Jekyll server so that it would detect changes to the code. Contrast that with the four commands necessary to get up and running now (assuming you have Node.js version 6 or greater installed):

```sh
git clone https://github.com/18F/web-design-standards.git
cd web-design-standards
npm install
npm start
```

Now each of us has a powerful development, testing, and documentation tool at our fingertips, which we can use to test every aspect of the Standards code without any of the customizations we've made on the Standards site. Fractal even comes with a handy resizable preview window we can use to test the responsiveness of each component or page template without having to resize our entire browser window.

**But wait, there's more!** Fractal is an invaluable tool for those of us developing the Standards on our own computers, but what if we put it... *on the cloud?* That's where Federalist comes in.

## Federalist

In a nutshell, [Federalist](https://federalist.fr.cloud.gov/) is GitHub Pages for government: a platform that automatically builds and publishes static sites whenever we push commits to our [GitHub repository](https://github.com/18F/web-design-standards). Unlike GitHub Pages, though, Federalist isn't limited to publishing just static files and Jekyll sites: We can use the same Node.js tools we use to develop the Standards to publish our Fractal component library as a static site on Federalist.

One of Federalist's most useful features is its ability to publish "branch previews". Whenever we push commits to a branch on GitHub, Federalist builds a new version of the site and publishes it at a predictable URL. For instance, you can see the current state of our [develop branch preview](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/develop/), or you can kick the tires of our [forthcoming version 1.1.0 release](https://github.com/18F/web-design-standards/releases/tag/v1.1.0-pre) on the [release-1.1.0-pre branch](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0-pre/).

Federalist hosts other websites across government and is open for business. If you’re interested in using it to host and preview your own federal static sites, please [get in touch with that team!](https://docs.google.com/forms/d/1iB8aW7c9r1QH3s8XElQCrnXRGjAiPUYpWG1CMeEqGIo/viewform)

Equipped with Fractal and Federalist's automatically published URLs, we can add preview links to each of our GitHub pull requests, and more quickly collect feedback on proposed changes. Whenever we create a new pull request, we can paste the following template at the top and replace {BRANCH} with the pull request branch name:
`### [:eyes: Preview on Federalist]({{ page.preview_baseurl }}/{BRANCH}/)`

The resulting [pull request](https://github.com/18F/web-design-standards/pull/1836) description looks like this:
<img src="{{site.baseurl}}/assets/blog/web-design-standards/federalist-preview.png" alt="A pull request with a link to a Federalist preview branch in the comment." width="624" height="74" />
We can even link directly to [individual](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0/components/detail/header--basic.html) [components](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0/components/detail/header--extended.html), and their [standalone previews](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0/components/preview/header--basic.html). These links help us provide more targeted feedback and more quickly address any issues that arise.

### Versioned assets and documentation

Another technique we're exploring is making versioned assets (the standards CSS, JavaScript, images, and fonts) more readily accessible for testing on other sites. In fact, we're already doing this with Federalist, which includes the git branch in its preview URLs. This means you can link directly to the [JavaScript](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0-pre/dist/js/uswds.min.js) or [CSS](https://federalist.fr.cloud.gov/preview/18f/web-design-standards/release-1.1.0-pre/dist/css/uswds.min.css) from our [version 1.1.0
Pre-release](https://github.com/18F/web-design-standards/releases/tag/v1.1.0-pre) once you know the URL format:

``{{ page.preview_baseurl }}/release-{VERSION}/dist/{FILENAME}``

These URLs will only work for version 1.1.0 and above. You can get the assets from previous releases with `[unpkg]` using URLs in this format:

`https://unpkg.com/uswds@{VERSION}/dist/{FILENAME}`

Having these public, predictable URLs make it easier for us to create test cases with "live-coding" tools such as JSFiddle and CodePen. We used JSFiddle to create a [live test case](https://jsfiddle.net/47Lpu62z/9/) for [this accordion bug](https://github.com/18F/web-design-standards/issues/1762) that references the JavaScript from a branch to demonstrate the proposed fix. In this case, the reporter of the issue was able to download that same script and confirm the fix on their project!

## What's next

We're working on a reorganization of the Standards site that will incorporate Fractal's standalone component previews and code samples so we don't have to maintain them in two different places. We're also exploring the possibility of enabling live editing capabilities in Fractal so that we can more quickly create and share test cases for each of our components. We've also got more work to do on fully porting our old component templates over to Fractal and better organizing our components, variants, page templates, and related documentation.
If you have a suggestion, see something amiss, or just want to say hi, feel free to [file an issue on GitHub](https://github.com/18F/web-design-standards/issues/new), [email our mailing list](mailto:uswebdesignstandards@gsa.gov), or join our [public Slack channel](https://chat.18f.gov/).

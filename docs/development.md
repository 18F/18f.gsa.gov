---
permalink: false
eleventyExcludeFromCollections: true
---

# Development

## Overview

Content for the 18F website is written using Markdown, and pages are styled based on the layouts which are stored in `templates/layouts`. Individual posts and pages are customized using front matter, which is the set of key-value pairs you see at the top of many pages and posts. Front matter is written in YAML format and sets up some configuration for the page.

This document is a work in progress. If you don't see the information you're looking for, please open a [new issue](https://github.com/18F/18f.gsa.gov/issues).

## Debugging

For debugging, prepend your command with `DEBUG=Eleventy:{scope}`, where `scope` is the subset of errors you want to see in the log. To see everything, use `DEBUG=Eleventy:*`, and the log is tagged with all the error types.

### Send errors to a log file

We've found the following command to be useful. It writes any exception logs to a file called debug.log while running `npm run dev`.

```sh
$ DEBUG=Eleventy:EleventyErrorHandler npm run dev > debug.log 2>&1
```

### Send all log messages to a log file

```sh
$ DEBUG=Eleventy:* npm run dev > debug.log 2>&1
```


## Testing and CI/CD

Every pull request will trigger a build on Cloud.gov pages. Additionally, we have a github workflow in place that performs a number of tests on every pull request:
- Automated accessbility test with`pa11y-ci`
- Code linting with `eslint`
- HTML validation with `html-validate`
- Internal link checking with `check-html-links`

Additionally, we manually use `prettier` for code formatting.


### Accessibility Scanning

We use `pa11y-ci` is used to scan for accessibility issues. The scan runs as part of
our CI setup (see the [pull-request.yml workflow](.github/workflows/pull-request.yml))
on every pull request, but it can also be run locally. To run locally, type:

```
npm run test:pa11y-ci
```

Note that running `pa11y-ci` inside the docker container may not always work.

In certain cases we may need `pa11y-ci` to ignore an element. For example, in the accessibility guide there are elements that violate a11y rules on purpose. We know those will fail and don't want to fix them because they are showing an example of a bad practice, and so we want `pa11y-ci` to ignore them. To do so we can the data attribute `data-pa11y-ignore` to the element that should be ignored.

_Example:_

```html
<span style = "color:#58AA02" class="exampleFailure" data-pa11y-ignore>This text fails.</span>
```

### Checks

We have a command to locally run all the checks that happen in each build, so you can catch errors before you commit and push:

```
npm run precommit
```

This will run code linting, HTML validation, and link checking.

#### Code linting

We use [eslint](https://eslint.org/) for code linting:

```
npx eslint . --fix
```

#### HTML validation

`html-validate` will check for valid HTML. It is configured in `.htmlvalidate.json`.

#### Link checking

`check-html-links` will test internal links on the site. The internal link check tests whether a target link file exists in the `_site` folder at the expected location. Because the current version of `check-html-link` [does not return an error value](https://github.com/modernweb-dev/rocket/issues/166) when it finds broken links, the npm script for this check includes an additional grep search for a "✅" which would appear only if there are no broken links. With this (hopefully) temporary fix in place, github actions will report a failure if there are broken links.

If you'd like to run these locally you could run `npm run test:links`. Alternatively you could use `npm run test:links-internal`, which will run the test with colorized output if you find that helpful, but note that it will not return an accurate exit code.

If there is a link that is still to be deteremined as we are moving guides, you can use '/TODO/' as the URL. This will visually highlight the link as TODO, and the link will be ignored in the link test.

### Code formatting

We use [Prettier](https://prettier.io/) for code formatting. You can run prettier manually with
```
npx prettier . --write
```
Note that this will overwrite files in place. See `npx prettier --help` for more CLI options.

An easier way to use prettier is to integrate it into your IDE/editor. For example, [integration exists for VS Code](https://github.com/prettier/prettier-vscode) such that prettier runs on a file every time you save it.

You can also add prettier as a [git commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks), but you will need to set up the script yourself. For example, you can symlink [this template](/utils/pre-commit) file into `.git/hooks/pre-commit`

## Developing

### Ignoring AssetPaths

We want to avoid commiting the `assetPaths.json` file, but need to keep it out of the project `.gitignore` in order to allow eleventy to rebuild when it is changed. One way to resolve this issue is to add `assetPaths.json` to the git exclude list:
1. Open up `.git/info/exclude`
2. Add `assetPaths.json` to that file

If that doesn't work, type in `git update-index --assume-unchanged data/assetPaths.json` into the terminal.

### Link icons

Any link in the contents of the guides (i.e. not part of a layout or page component), will be tested to determine if it's an external link and if the access to the linked resource is restricted to 18F (e.g google docs, murals, etc...). We are using the patterns developed as part of [work on the UX guide](https://github.com/18F/ux-guide/issues/340).

An external link is [defined](https://github.com/18F/ux-guide/issues/297) as any link that is not a federal .gov or .mil website. However, as there does not seem to be a programmatic way to distinguish between a federal and non-federal .gov domain, state and local-domains need to be marked as such manually. In order to mark a link as external we can add the USWDS `usa-link` and `usa-link--external` classes. To do so in markdown we can utilize the installed `markdown-it-attrs` plugin and append the class to the link using curly brackets (`{ }`). For example: `[external link](example.com){.usa-link .usa-link--external}`.

Private or restricted links are determined by comparing against the list of links in `config/privateLinksList.js`. If there are other links that are restricted you should add them to this list.

## Content organization

The content for all of the pages and posts are in the `content/pages` and `content/posts`.

**To add a blog post:** Create new file in `content/posts` with the file format `YYYY-MM-DD-title-slug.md`. Copy the latest blog post's frontmatter to get started, then edit for your specific post.

## Data

All the data that's accessible sitewide is kept in `data/`.

Anything we display or iterate over that isn't content goes here. This includes things like all our author data, agencies whose logos we display on the homepage and on "Work With Us", etc.

De-duplicate data wherever possible. In the previous site we had "agencies" and "featured agencies" — now we have one agencies file, and featured agencies are marked with `featured: true`.

The data file names should be semantically meaningful. As a counterexample, "featured" has a key "case studies" which list agency names, not case studies. This introduces confusion: are these agencies or are they case studies? Ideally, the relationships should be clearer than this.

## Configuration / plugins

Eleventy uses a "plugins" system to manage site-specific configuration.

Because we have A LOT of configuration to customize our site, it's important that this configuration remain organized.

#### Guidelines for adding / editing configuration**

To add configuration:

1. Create a subfolder inside `config/` and add an index.js file, for example `config/inflectors/index.js`

2. If your configuration is short and sweet, like it is with `config/browsersync/index.js`, you can keep the config all in the `index.js` file.

3. If you are defining multiple functions or classes, add a file per function or per class, then `require` and export them in `index.js`. For example, you might have `config/inflectors/singularize.js` and `config/inflectors/pluralize.js`.

Then, in `index.js`, you'd write:

```js
const singularize = require('./singularize')
const pluralize = require('./pluralize')

const inflectorsPlugin = (eleventyConfig) => {
//    ^^^^^^^^^^ remember to change the plugin name here and at the bottom
  eleventyConfig.addInflector('singularize', singularize)
  eleventyConfig.addInflector('pluralize', pluralize)
}

module.exports = inflectorsPlugin;

```

4. Add the plugin to the main site-wide plugin in `config/index.js`. For example:

```js
// ... other config ...
const inflectors = require('./inflectors')

module.exports = function EighteenF(eleventyConfig) {
  // ... other plugins ...
  eleventyConfig.addPlugin(inflectors)
}

```

**Never** add configuration directly to:

- `.eleventy.js`
- `config/index.js`
- a file inside `config/` — configuration should always be in a folder


### Collections / tags

11ty uses “[collections](https://www.11ty.dev/docs/collections/)” to create content groupings. We can create a distinct collection for each guide, which allows us to group relevant content together. Site pages can be added to a collection simply by adding a `tag` to the front matter with the appropriate guide name as the value. The tag name is used throughout the site to refer to each guide (for example to determine the guide’s title).

_Examples:_
- De-risking guide content would have the front matter `tags: derisking`
- UX guide pages would have `tags: ux-guide`

## Navigation

The `data/navigation.yaml` file is used to define the primary navigation for each guide. The guide’s tag is used as a key which maps to its list of link names and urls.

_Example:_
```
agile:
  - name: Home
    url: /agile/
```


### Page titles
By default, the page's `<title>` tag will use the `title` set in the page's front matter.

You can also set a custom page title using `seo_title` in the front matter, to improve the experience for people skimming search results. Reasons to write a custom page title include:
- The `title` is more than 30-35 characters long
- The `title` is too similar to titles on other guides. (Examples are "Introduction" or "Planning.")

By default, the `title` front matter will be rendered as an `h1` element. There are two additional front matter options that control the markup for the title:

- `page_title_tag`: When you need the title of the page to be something other than H1, use this. This takes the name of the tag only, like `h2` or `div` — don't set the full tag like `<h3>`.
- `hidden_guide_title`: If added, this will take the value of `hidden_guide_title` and render a screen reader only `h1` element before the `page_title_tag`. This option is meant to be used together with the `page_title_tag`.

Example usage:
```
title: Questions to ask
page_title_tag: h2
hidden_guide_title: State Software Budgeting Handbook
```
Which will render the following html:
```
<h1 class="usa-sr-only">State Software Budgeting Handbook</h1>
<h2 class="page-title derisking">Questions to ask</h2>
```

## URL's

### Base URL's

Eleventy does not use `{{site.baseurl}}` to refer to other pages. When linking to another page on the site, use Eleventy's `url` filter as such:
- For the home `index.md` page, use `{{ '[Markdown filename]' | url }}`.
- For any other page in `content/[guide]`, use `{{ '../[Markdown file name]/' | url }}` (remember the trailing slash!)
- For pages in their own section within each guide, use `{{ '../../[Markdown file name]/' | url }}` (remember the trailing slash!). An example is in the Engineering Hiring guide, where there are several pages in `content/eng-hiring/interviews/`. Any page within the `interviews` folder needs to use `../../` to link to other pages in `content/eng-hiring/`

### Permanent redirection

Many guides used Jekyll's `redirect_from` and `redirect_to` frontmatter keys to redirect old pages to current ones. In order to preserve past redirects from old guides, we ported over these frontmatter keys and implemented an 11ty version of this functionality, found in [/content/redirect.html](https://github.com/18F/guides/blob/main/content/redirect.html).

Note that paths listed as values for these keys should **NOT** contain the beginning forward slash (like is needed for permalinks):

#### Correct:
```
redirect_from:
  - content-guide/foobar/
```

#### Incorrect:
```
redirect_from:
  - /content-guide/foobar/
```

## Frontmatter

### Posts

TK

### Pages

TK

## Managing dependencies

This project uses Github's Dependabot to keep the NPM dependencies up to date.
Dependabot takes care of noticing version updates and proposing the updates to
`package.json` and `package-lock.json` as pull requests (PRs). A human
developer needs to review these Dependabot PRs and merge them into the `main`
branch.

If Dependabot PRs go un-reviewed for too long, they can have merge conflicts
and complex interactions with other code changes. The best practice is to
review and merge Dependabot PRs as soon as possible. The automated test suite
for this project is quite good, so this is fairly straightforward:

1. Comment `@dependabot recreate` on the PR to request Dependabot to update
   the changes to the current state of `main`.
1. After Dependabot updates the PR in accordance with the re-create request,
   review the changes that are included in the PR. There should be changes
   **only** to the `package.json` and `package-lock.json` files and ideally
   they would be small changes, obviously connected to version updates. After
   reviewing the changes, you should approve the PR.

   Semantic versioning practices suggest that for dependencies where the
   "major" version changes (the first number, e.g. 3.x.y), breaking changes
   might be present and additional testing might be warranted. The reviewer
   could pull the Git branch and test the site build and function locally.

1. When the automated tests have completed successfully and the PR is reviewed
   and approved, go ahead and merge the PR.

## Replatforming-specific information

_This information was relevant during the replatforming effort to merge all 18F guides into this repo, but may not continue to be relevant after replatforming._


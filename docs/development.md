---
permalink: false
eleventyExcludeFromCollections: true
---

# Development

## Overview

Content for the guides is written using markdown, and pages are styled based on the layouts which are stored in `/includes/layouts`. Individual guide pages are customized using front matter, which is the set of key-value pairs you see at the top of many pages and posts. Front matter is written in YAML format and sets up some configuration for the page.

This document is a work in progress. If you don't see the information you're looking for, please open a [new issue](https://github.com/18F/guides/issues).

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

### Code linting

We use [eslint](https://eslint.org/) for code linting:

```
npm run lint
```

### HTML validation

`html-validate` will check for valid HTML. It is configured in `.htmlvalidate.json`.

### Link checking

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

If that doesn't work, type in `git update-index --assume-unchanged _data/assetPaths.json` into the terminal.

### Link icons

Any link in the contents of the guides (i.e. not part of a layout or page component), will be tested to determine if it's an external link and if the access to the linked resource is restricted to 18F (e.g google docs, murals, etc...). We are using the patterns developed as part of [work on the UX guide](https://github.com/18F/ux-guide/issues/340).

An external link is [defined](https://github.com/18F/ux-guide/issues/297) as any link that is not a federal .gov or .mil website. However, as there does not seem to be a programmatic way to distinguish between a federal and non-federal .gov domain, state and local-domains need to be marked as such manually. In order to mark a link as external we can add the USWDS `usa-link` and `usa-link--external` classes. To do so in markdown we can utilize the installed `markdown-it-attrs` plugin and append the class to the link using curly brackets (`{ }`). For example: `[external link](example.com){.usa-link .usa-link--external}`.

Private or restricted links are determined by comparing against the list of links in `config/privateLinksList.js`. If there are other links that are restricted you should add them to this list.

## Content organization

The content for all of the guides is in the `content` folder, which is organized with subfolders for each guide. For example all of the content for the De-risking guide should be placed in `content/derisking/`.

Additionally, if a guide contains multiple sections, each section should have its own subfolder in that guide's folder. All pages that are part of a section should be placed into the section subfolder. For example, the "Federal Field Guide" is a section within the De-risking Guide, and "Basic principles" is a page in the "Federal Field Guide". So `basic-principles.md` would be placed in `content/derisking/federal-field-guide/`.

### Guide-specific files
If there are images and `include` files that only one guide uses, create a guide-specific folder within the site-wide `asset` or `_includes` folder.

Call a guide-specific include by using `{% include '[guide-folder]/[include-name].html' %}`. An example is in the Engineering Hiring Guide, where there is a warning about unconscious biases displayed on several pages. The file `unconscious-bias-warning.html` is located in `_includes/eng-hiring/`. The pages that use it will contain the line `{% include 'eng-hiring/unconscious-bias-warning.html' %}`

### Guide titles and subdirectories
The `_data/titles_roots.yaml` file is used to set the title for each guide (i.e. what appears after the 18F logo in the header). In addition it defines the name of the URL “subdirectory” that will be the “root” or homepage for the guide. A guide’s tag is used as a key which maps to the title and root. This tag is referenced to set the title, header, and primary navigation for each guide.

_Example:_
```
agile:
  title: Agile
  root: /agile/
```

### Collections / tags

11ty uses “[collections](https://www.11ty.dev/docs/collections/)” to create content groupings. We can create a distinct collection for each guide, which allows us to group relevant content together. Site pages can be added to a collection simply by adding a `tag` to the front matter with the appropriate guide name as the value. The tag name is used throughout the site to refer to each guide (for example to determine the guide’s title).

_Examples:_
- De-risking guide content would have the front matter `tags: derisking`
- UX guide pages would have `tags: ux-guide`

## Navigation

The `_data/navigation.yaml` file is used to define the primary navigation for each guide. The guide’s tag is used as a key which maps to its list of link names and urls.

_Example:_
```
agile:
  - name: Home
    url: /agile/
```

### Sidenavs

We can use the [EleventyNavigation](https://www.11ty.dev/docs/plugins/navigation/) plugin to programmatically create a sidenav for any collection. In order to group pages within a subsection together, all pages within a section should have a common `eleventyNavigation` `parent` key. For example the introduction page for the content guide "Our style" would include the following front matter:
```
eleventyNavigation:
  key: content-style-index
  parent: content-style
  order: 1
  title: Our style
---
```
and similarly, the "Active voice" page within that section would have the following in its front matter:

```
eleventyNavigation:
  key: content-active
  parent: content-style
  order: 3
  title: Active voice
```

In the above front matter:
- `parent: content-style` references the name of the parent section.
- `key: content-active` sets this page's unique key for the sidenav.
- `order: 3` explicitly sets the order the page should appear in the sidenav (in this case it'll be first).
- `title: Active voice` controls what text is displayed in the sidenav. This field is optional, and if it’s omitted the `key` value will be displayed.

#### Sticky sidenavs
Use `sticky_sidenav: true` to stick the sidenav to the top of the window when scrolling.

### Subnavs

You can use the existing `subnav:` options in the original file's front matter to generate a subnav with the current page's anchor links. To prevent errors in `eleventyNavigation`, ensure the `parent` and `key` values are different.

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

### Top level

| key | description | data type | applies to |
|---|---|---|---|
| category | adding a top-level category key will give a methods page a colored background | text | methods |
| eleventyExcludeFromCollections | an [eleventy-supplied option](https://www.11ty.dev/docs/collections/#how-to-exclude-content-from-collections) to exclude pages from collections | boolean (default false) | all |
| eleventyNavigation | part of eleventy's [navigation plugin](https://www.11ty.dev/docs/plugins/navigation/#fetch-the-menu-items-using-the-eleventynavigation-filter) | object (see eleventy's [docs](https://www.11ty.dev/docs/plugins/navigation/#fetch-the-menu-items-using-the-eleventynavigation-filter)) | all |
| description | page's meta description | text | all |
| layout | one of the [eleventy layouts](https://www.11ty.dev/docs/layouts/) that the page will use | text | all |
| method | object for method data | object (see below) | methods |
| permalink | [eleventy-supplied option](https://www.11ty.dev/docs/permalinks/) for setting the url path | text | all |
| redirect_from | custom option for setting url paths that redirect to this page | array of text | all |
| sidenav | determines whether page has side navigation (only used for standard page layouts) | boolean (default false) | all |
| tags | part of eleventy's [collection](https://www.11ty.dev/docs/collections/) functionality | text or array of text (see eleventy docs) | all |
| title | page's title used both in meta tags and as the h1 for standard pages | text | all |

### Method

| key | description | data type | applies to |
|---|---|---|---|
| title | a method's title (differs from page title) | text | methods |
| what | content for method's "what" section | text | methods |
| why | content for method's "why" section| text | methods |
| timeRequired | short description of how much time is required for method activity | text | methods |
| category | a method's category name; do not capitalize | text | methods |

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

### Content migration process

The general steps for migrating a guide:
1. Add the guide to the `_data/titles_roots.yaml` file with the guide’s tag, name, and root (See [Guide titles and subdirectories](#guide-titles-and-subdirectories) for an example).
2. Add the primary navigation for the guide to `_data/navigation.yaml`.
3. Add a link to the new guide in `_includes/guidelist.html` so it will be easier to find.
4. Copy over the markdown file for the guide into the appropriate subfolder.
5. Open up the markdown file to edit the front matter:
    1. Change the layout to `layout/page` or whatever layout is most appropriate.
    2. Add `tags: <collection-name>` where <collection-name> is the guide’s tag.
    3. Update the `permalink` to the link that should be displayed. Generally this will be `/<guide-root>/<section-name>/<page-name>`. Try to match the permalink of the original markdown file.
    4. Add the `eleventyNavigation` front matter (See [Sidenavs](#sidenavs) for more details) :
    ```
    eleventyNavigation:
      parent: <collection-name>
      key: <unique-key>
      order: <#>
      title: <Sidenav-title>
    ```
6. If your guide offers any downloads, add the files for download to `/assets/{guide}/dist/{filename}`, and set the download links to point to the same path.
7. Celebrate! Or edit this documentation to update any steps that may be missing.

### Adding new node modules

It may turn out that you need to install an npm package to replicate functionality in the old guides. Here's how to do it!

First, before your write any code or configuration that relies on the package, install the package via Docker Compose while the services are running:

```sh
# If you haven't already
$ docker compose up

# In another tab
$ docker compose exec guides npm install {your options here}
```

### Temporary redirection during development
We are planning to release the replatformed guides incrementally. During this time, replatformed guides that are still in development and have not yet been released will redirect users to the existing guide's URL (typically following the pattern of `<guide>.18f.gov`). This approach is implemented using client-side redirects. The `_data/redirect_bases.yaml` stores a mapping of each guide's tag key (the same one used to create the [collections](#collections--tags), to the base URL of the current guide. This base URL is then used to generate the URL the user will be redirected to. When a guide gets released, we will need to remove its corresponding key-value pair from `_data/redirect_bases.yaml`.

#### Accessibility impacts to client-side redirects

While server-side redirects would be preferable, our deployment limitations have us using client-side redirects for this purpose.

[WCAG states](https://www.w3.org/TR/WCAG20-TECHS/H76.html) that if using this technique, the `content` attribute should be set to 0 (meaning 0 seconds / immediate redirect), to avoid content "flashing" before the page is redirected.

Since redirects will be immediate, we will leave the redirect page template empty of body content in order to avoid content flashing.

Through manual testing, we’ve determined the redirect is unnoticeable visually and is smooth for screen readers. We welcome any feedback on how to improve this experience.

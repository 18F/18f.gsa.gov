This document is about how to contribute to the 18f.gsa.gov site. This process looks a bit different depending on whether you’re a member of the public, an 18F employee, or a member of the outreach or site team. Here’s what you can find in this doc:

* [Public contributions](#public-contributions)
* [18F contributions](#18f-contributions)
    - [Branches](#branches)
    - [Front end architecture](#front-end-architecture)
    - [Standards and benchmarks](#standards-and-benchmarks)
* [Public domain](#public-domain)

## Public contributions

We're so glad you're thinking about contributing to an 18F open source project! If you're unsure about anything, just [send us an email](mailto:18f@gsa.gov) with your question — or submit the issue or pull request anyway. The worst that can happen is you'll be politely asked to change something. We love all friendly contributions.

We want to ensure a welcoming environment for all of our projects. Our staff follow the [18F Code of Conduct](https://github.com/18F/code-of-conduct/blob/master/code-of-conduct.md) and all contributors should do the same.

We encourage you to read this project's CONTRIBUTING policy (you are here), its [LICENSE](LICENSE.md), and its [README](README.md).

* If you see an error or have feedback, the best way to let us know is to file an issue.
* To contribute a specific change to the site, outside contributors will need to fork this repo.

## 18F contributions

There is a team actively working on the site. You can find us in Slack in the #18f-site or #beta-18F-site channels (access is limited to 18F employees).

### Branches

Any 18F team member should be able to make a branch of the site and submit a pull request. Doing so will also generate a preview URL we can use to inspect your changes.

Because new blog posts are published several times a week, we use several branches to manage parallel work in a predictable way:

* Submit **blog posts and minor content edits** as pull requests to the `master` branch.
* Submit **new design work, content changes, and features** as pull requests to the `dev` branch. This will allow us to test and review batches of changes before deploying them.

**The `master`, `staging`, and `production` branches are protected.** Only administrators of the repo can push directly to those branches. 18F teammates who don’t think they have the correct permissions should ask in the #18f-site channel.

### Submitting pull requests

If you submit your Pull Request (PR) from the Github website, a form will appear and will be populated with [a template](PULL_REQUEST_TEMPLATE.md). If you are submitting via the Github Client app, a template will not appear and you will need to populate it yourself. You can find the text [here](PULL_REQUEST_TEMPLATE.md). If you are not on the 18F site team, feel free to disregard the template and someone from the team will follow up with you.

To fill out the template, please start by attaching any issues your PR addresses. If the PR changes are not associated with an issue, please leave a brief message detailing what was wrong with the site before, and how it _should_ be.

If the nature of the PR is visual, please replace all instances of `BRANCH_NAME` with the name of the branch that is being merged.

Complete the PR message by detailing all fixes and tagging GitHub users who should review the work, with a note about what they should be reviewing. In general:

- If you are not an admin or member of the 18F site team, tag someone who you would like to review and merge your PR
- If you are an admin for the repo or a member of the 18F site team, you are responsible for merging your own PRs **after they have been reviewed and approved by someone else on the team**
- If you have been asked to review a PR, leave a clear message indicating your approval, either through the formal PR review feature or by commenting (at the very least, with a note saying `LGTM`, or "Looks good to me")
- If your PR includes many small, incremental commits, consider squashing them
- Don’t merge until linters pass, unless you have discussed with reviewers and approved exceptions

### Front end architecture

This site is based on the [U.S.
Web Design Standards](https://standards.usa.gov/) (WDS). It is developed using [Jekyll](https://jekyllrb.com/), a static site generator based on the Ruby programming language.

We default to using [semantic HTML5](http://www.w3schools.com/html/html5_semantic_elements.asp).

We use [HoundCI](https://houndci.com/) to automate Sass, JavaScript, and Ruby linting.

We use [CircleCI](https://circleci.com/) to run HTML Code Sniffer.

#### CSS

CSS methodology is inherited from the WDS, which inherits mostly from the [18f front end guide](https://pages.18f.gov/frontend/css-coding-styleguide/architecture/).

- Use [18F modifed BEM naming convention](https://pages.18f.gov/frontend/css-coding-styleguide/naming/)
- Componentized CSS: start with tag rules and only becomes more specific as necessary, using component classes

The 18F-site team will update the WDS library when it publishes a change required by the site; otherwise it will update bi-monthly (see [issue #1877](https://github.com/18F/18f.gsa.gov/issues/1877))

#### Images

- All icons should use  `<svg>` and `xlink` (looking for link) formats
- All blog images should be under 800kb in total, un-minified size
- Images should be under 600Kb after being minified
- All raster images should be minified with a tool such as [grunt-imagemin](https://github.com/gruntjs/grunt-contrib-imagemin)

#### JavaScript

This site does not use any heavy JavaScript frameworks, and should always work without JavaScript.

- jQuery is included in the WDS
- Ruby gems is used for front end dependency management

## Accessibility

To test the site locally for accessibility errors, we use [pa11y-ci](https://github.com/pa11y/ci) to periodically test the site for accessibility concerns.

To set up, do the following:

1. `npm install`
2. `npm install -g pa11y-ci`
3. `npm run pa11y-ci local`

## Standards and benchmarks

### Device and browser support

- The website supports all versions of Internet Explorer still supported by Microsoft, as well as recent versions of Chrome, Safari, and Firefox
- The website should be designed with a mobile-first approach

### Performance

Each of the following events should load in under a second:

- Time to blog post image
- Time to main image and callout text
- Time until first blog post title shows up on page with all blog posts

## Public domain

For detailed license information, see [LICENSE](LICENSE.md).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

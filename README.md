## 18F's Homepage

This repository contains 18F's website, https://18f.gsa.gov.

* The `staging` branch is **automatically deployed** to our [staging site](http://staging.18f.us).
* The `production` branch is **automatically deployed** to our [production site](https://18f.gsa.gov).

**All development and pull requests should be done against the `staging` branch.**

Deployments to production will be done using PRs from `staging` to `production`.

### Getting started

This is a [Jekyll](http://jekyllrb.com) website. Install Jekyll through Rubygems (you may need `sudo`):

```bash
gem install jekyll
```

Sadly, [for the time being](https://github.com/jekyll/jekyll/issues/2327#issuecomment-55337023) you will also need Node to be installed, because Jekyll 2 couples a CoffeeScript runtime. This will eventually be removed. Install Node through `brew install node` or `apt-get install nodejs`.

Launch with Jekyll:

```bash
jekyll serve
```

The site will be visible at `http://localhost:4000`.

## Deployment

You don't need to worry about deployment stuff for normal development -- any pushes to `staging` and `production` branches will auto-deploy.

But to dig into our deployment setup and code, visit [`deploy/`](deploy) for more details.

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

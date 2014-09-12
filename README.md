## 18f.gsa.gov

[Building the 21st century digital government.](https://18f.gsa.gov/)

**Contributors:** We work on `staging`, and submit PRs to `staging`. When we want to deploy to production, a pull request is initiated (by the site admins) between `staging` and `production`.


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

### Automatic deployment

You don't need to worry about this in development. But on the staging and production server, this project uses [`hookshot`](https://github.com/coreh/hookshot) to receive GitHub post-receive webhooks and update the project.

We use a fork of `hookshot` with a bugfix, until [this pull request](https://github.com/coreh/hookshot/pull/5) is merged. Install with:

```bash
npm install -g https://github.com/VesQ/hookshot/tarball/master
```

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

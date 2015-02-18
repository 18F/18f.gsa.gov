## 18F's Homepage

This repository contains 18F's website, https://18f.gsa.gov.

**Writing a blog post for 18F? You must read our [blog publishing guide](_posts/README.md).**

### Deployment and workflow

* The `staging` branch is **automatically deployed** to our [staging site](https://staging.18f.us).
* The `production` branch is **automatically deployed** to our [production site](https://18f.gsa.gov).

**All development and pull requests should be done against the `staging` branch.**

Deployments to production will be done by site admins, using PRs from `staging` to `production`.

### Adding yourself to the site

If you're a new teammate, add yourself to the website by:

1. Add yourself to the `team.yml` file in 18F/data-private/ and be sure to read [the Privacy section in the README there](https://github.com/18F/data-private#privacy).
2. Clone this repo either with the GitHub Desktop App or through the command line
3. Create a branch
4. Add a photo to the [`assets/images/team`](https://github.com/18F/18f.gsa.gov/tree/staging/assets/images/team) directory that matches the name you used for `name` in the `team.yml` file
5. Push your branch and create a pull request to the `staging` branch of this repo to include your photo.

**You do not need to edit the team.yml file in this repo,** we'll find it in `data-private`.

If you get stuck, feel free to reach out to anyone on the 18f-site team.

Helpful tips:

* [Creating a Pull Request (GitHub Support)](https://help.github.com/articles/creating-a-pull-request/)
* [Creating a Pull Request with GitHub for Mac (GitHub blog post)](https://github.com/blog/1946-create-pull-requests-with-github-for-mac)


### Publishing a blog post

For a guide to how 18F manages blogging, and technical guidelines for getting your blog post into the site, see the **[18F Blogging Guide](_posts/README.md)**.

### Developing the site

This is a [Jekyll](http://jekyllrb.com) website. Install Jekyll through Rubygems (you may need `sudo`), Bourbon, and Jekyll Sitemap:

```bash
./go init
```

[For the time being](https://github.com/jekyll/jekyll/issues/2327#issuecomment-55337023) you will also need **Node** to be installed, because Jekyll 2 couples a CoffeeScript runtime. This will eventually be removed.

So yes: this project requires Ruby and Node (for now). Aren't static site generators the simplest?

Launch with Jekyll:

```bash
./go serve
```

The site will be visible at `http://localhost:4000`.

Before submitting a pull request, please ensure `./go ci_build` runs and exits cleanly.

### Deploying the site

You don't need to worry about deployment stuff for normal development -- any pushes to `staging` and `production` branches will auto-deploy.

But to dig into our deployment setup and code, visit [`deploy/`](deploy) for more details.

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

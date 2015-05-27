## 18F's Homepage

This repository contains 18F's website, https://18f.gsa.gov.

**Writing a blog post for 18F? You must read our [blog publishing guide](_posts/README.md).**

### Deployment and workflow

* The `staging` branch is **automatically deployed** to our [staging site](https://staging.18f.us).
* The `production` branch is **automatically deployed** to our [production site](https://18f.gsa.gov).

**All development and pull requests should be done against the `staging` branch.**

Deployments to production will be done by site admins, using pull requests from `staging` to `production`.

### Adding yourself to the site

If you're a new teammate, please add yourself to the website by following these steps:

1. You should have a file with your name on it in `_data/team` (`_data/team/boone.yml`, for example) on [18F/data-private](https://github.com/18F/data-private). Make sure that information is accurate and be sure to read [the Privacy section in the README there](https://github.com/18F/data-private#privacy).
2. Upload your photo to the appropiate [Google Drive folder](https://drive.google.com/a/gsa.gov/folderview?id=0B8kn3cuJUwEkLUMwWXE2VVczbUU&usp=sharing).
3. Fill out the [bio form](https://docs.google.com/a/gsa.gov/forms/d/1XRCkQZw3-1JoZh6tm4k1qbunEnvJdOvDrTjRCqs-dp4/viewform).
4. Get in touch with the site team in #18f-site; we'll handle it from there!

**You do not need to edit the team.json file in this repo,** we'll find it in `data-private`.

If you get stuck, or have any other questions, feel free to reach out to anyone on the 18f-site team in channel #18f-site.

Helpful tips:

* [Our Guide to the Terminal and GitHub](https://18f.gsa.gov/2015/03/03/how-to-use-github-and-the-terminal-a-guide/)
* [Creating a Pull Request (GitHub Support)](https://help.github.com/articles/creating-a-pull-request/)
* [Creating a Pull Request with GitHub for Mac (GitHub blog post)](https://github.com/blog/1946-create-pull-requests-with-github-for-mac)


### Publishing a blog post

For a guide to how 18F manages blogging, and technical guidelines for getting your blog post into the site, see the **[18F Blogging Guide](_posts/README.md)**.

### Developing the site

This is a [Jekyll](http://jekyllrb.com) website. Install Jekyll through Rubygems (you may need `sudo`), Bourbon, and Jekyll Sitemap:

```bash
./go init
```

Prerequisites: A few of our gems require a C++ compiler (**XCode** on the Mac). [For the time being](https://github.com/jekyll/jekyll/issues/2327#issuecomment-55337023) you will also need **Node** to be installed, because Jekyll 2 couples a CoffeeScript runtime. This will eventually be removed.

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

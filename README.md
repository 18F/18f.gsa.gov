## 18F's Homepage

This repository contains 18F's website, https://18f.gsa.gov.

* The `staging` branch is **automatically deployed** to our [staging site](https://staging.18f.us).
* The `production` branch is **automatically deployed** to our [production site](https://18f.gsa.gov).

**All development and pull requests should be done against the `staging` branch.**

Deployments to production will be done by site admins, using PRs from `staging` to `production`.

### Adding yourself to the site

If you're a new teammate, add yourself to the website by:

1. Either fork the repository, or make a new branch inside the repo if you have write permissions.
2. Add your name to [`_data/team.yml`](_data/team.yml). Your `name` should be an all-lower-case handle, and **must be unique** among the team. Your `full_name` should be how you want your name to be displayed beneath your picture, and on your blog post bylines.
3. Add a 250x250 JPG of yourself to [`assets/images/team`](assets/images/team). The filename must be your unique team handle, e.g. `eric.jpg`.
4. (Optional) Verify that your photo and name looks right by [running the site locally](#developing-the-site).
5. Submit a pull request from your fork or branch to this repository's `staging` branch.
6. When your PR is merged, your face and name should appear automatically on [our staging site](https://staging.18f.us).

A site admin will take care of deploying you to the [live site](https://18f.gsa.gov). Feel free to poke them if they don't get around to it in a timely fashion!

### Publishing a blog post

For a guide to how 18F manages blogging, and technical guidelines for getting your blog post into the site, see the **[18F Blogging Guide](blogging.md)**.

### Developing the site

This is a [Jekyll](http://jekyllrb.com) website. Install Jekyll through Rubygems (you may need `sudo`):

```bash
gem install jekyll
```

Install the latest versions of Sass and Bourbon:

```bash
gem install bourbon
gem install sass
```

Sadly, [for the time being](https://github.com/jekyll/jekyll/issues/2327#issuecomment-55337023) you will also need Node to be installed, because Jekyll 2 couples a CoffeeScript runtime. This will eventually be removed. Install Node through `brew install node` or `apt-get install nodejs`.

Launch with Jekyll:

```bash
jekyll serve
```

The site will be visible at `http://localhost:4000`.

### Deploying the site

You don't need to worry about deployment stuff for normal development -- any pushes to `staging` and `production` branches will auto-deploy.

But to dig into our deployment setup and code, visit [`deploy/`](deploy) for more details.

**Legacy deploy**

While we wait on a DNS change, the following can be used to update the live site on the old server, while logged in as the `ubuntu` user:

```bash
cd /var/www/18f.gsa.gov-new && git pull && sudo jekyll build && sudo chown -R ubuntu:ubuntu _site && sudo chmod -R 755 _site
```

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

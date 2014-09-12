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

You don't need to worry about this for normal development. But on the staging and production server, this project uses [Node](http://nodejs.org) and [`hookshot`](https://github.com/coreh/hookshot) to receive GitHub post-receive webhooks and update the project.

Install Node however you want. We use a fork of `hookshot` with a bugfix, until [this pull request](https://github.com/coreh/hookshot/pull/5) is merged. Install with:

```bash
npm install https://github.com/VesQ/hookshot/tarball/master
```

Run the hookshot script to listen on port 3000 for incoming pushes:

```
node deploy/hookshot.js
```

You may wish to use [ngrok](https://ngrok.com/) or [localtunnel](https://localtunnel.me/) in development, to test out the webhook.

You can daemonize the webhook by using `forever`:

```
npm install -g forever
```

and then running the webhook with it:

```
forever -l deploy/hookshot.log -a start deploy/hookshot.js
```

Stop webhook with `forever stop deploy/hookshot.js` and restart with `forever restart deploy/hookshot.js`.


### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

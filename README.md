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

Install Node however you want. We use a fork of `hookshot` with a bugfix, until [this pull request](https://github.com/coreh/hookshot/pull/5) is merged.

Install dependencies with:

```bash
npm install https://github.com/VesQ/hookshot/tarball/master
npm install minimist
npm install -g forever
```

18F's web server uses the `hookshot` command to listen for hooks on either of two ports.

```bash
hookshot -r refs/heads/staging -p 3000 "echo 'HOOKS' && cd /home/eric/18f/18f.gsa.gov && git pull && jekyll build > build.out"
```


From `/deploy`, run the hook with the appropriate port and command. It can be helpful to have `forever` and your command both log to the same file.

In development, you might use:

```bash
forever start -l $HOME/hookshot.log -a deploy/hookshot.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && jekyll build >> $HOME/hookshot.log"
```

You can stop and restart your hooks by supplying the same arguments you gave.

```bash
forever stop deploy/hookshot.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && jekyll build >> $HOME/hookshot.log"
forever restart deploy/hookshot.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && jekyll build >> $HOME/hookshot.log"
```

On our web server, 18F runs two separate hooks.

#### Staging hook

Starting:

```bash
forever start -l $HOME/hookshot.log -a deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && jekyll build >> $HOME/hookshot.log"
```

Restarting:

```bash
forever restart deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && jekyll build >> $HOME/hookshot.log"
```

Stopping:

```bash
forever stop deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && jekyll build >> $HOME/hookshot.log"
```

#### Production hook

Starting:

```bash
forever start -l $HOME/hookshot.log -a deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && jekyll build >> $HOME/hookshot.log"
```

Restarting:

```bash
forever restart deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && jekyll build >> $HOME/hookshot.log"
```

Stopping:

```bash
forever stop deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && jekyll build >> $HOME/hookshot.log"
```


You may wish to use [ngrok](https://ngrok.com/) or [localtunnel](https://localtunnel.me/) in development, to test out the webhook.


### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

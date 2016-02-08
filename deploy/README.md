## Contents

1. [18f.gsa.gov deployment details](#18f-gsa-gov-deployment-details)
1. [Cloud Foundry deployment details](#cloudfoundry-deployment-details)

## 18f.gsa.gov deployment details

Quick overview:

* [`18f-site.conf`](18f-site.conf) - Our nginx config for the production and staging site. Not synced to version control automatically, but we'll try to keep them in sync.
* [`fabfile.py`](fabfile.py) - Fabric deployment script to start/stop/restart our webhook processes. Could be extended to deploy and sync our nginx config, and restart nginx.
* [`githooked.js`](githooked.js) - Tiny webhook app, runs a command when a branch is updated. Uses [`githooked`](https://github.com/ScottONeal/githooked) to do the heavy lifting. Daemonized on our server using [`forever`](https://github.com/nodejitsu/forever).

### Automatic deployment

On the staging and production server, this project uses [Node](http://nodejs.org) and [`githooked`](https://github.com/coreh/githooked) to receive GitHub post-receive webhooks and update the project.

Ideally, these webhooks just run forever and never need to be maintained!

But just in case, this project includes [fabric tasks](http://www.fabfile.org/) for easy remote stop/start/restart of the hook processes on the 18F website.

You will need:

* authorized access to the 18F site server
* an `18f-site` entry in your `$HOME/.ssh/config` with the necessary credentials
* to `pip install fabric`, and have your active `python` when running it be 2.X

With that, you can start, stop, and restart the staging and production hooks like so:

```
fab stop
fab start
fab restart
```

Provide `--set env=production` to any of those commands to apply it to the production hook.

#### Setting it up yourself

These instructions can be applied locally (for development) or on the server (for deployment).

Install the Node dependencies with:

```bash
cd deploy/
npm install
npm install -g forever
```

18F's web server uses the `githooked` command to listen for hooks on either of two ports.

From `/deploy`, run the hook with the appropriate port and command. It can be helpful to have `forever` and your command both log to the same file.

In development, you might use:

```bash
forever start -l $HOME/githooked.log -a deploy/githooked.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && bundle exec jekyll build >> $HOME/githooked.log"
```

You can stop and restart your hooks by supplying the same arguments you gave.

```bash
forever stop deploy/githooked.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && bundle exec jekyll build >> $HOME/githooked.log"
forever restart deploy/githooked.js -p 3000 -b your-branch -c "cd $HOME/18f/18f.gsa.gov && git pull && bundle exec jekyll build >> $HOME/githooked.log"
```

On our web server, 18F runs two separate hooks.

You may wish to use [ngrok](https://ngrok.com/) or [localtunnel](https://localtunnel.me/) in development, to test out the webhook.

## Cloud Foundry deployment details

Cloud Foundry is 18F's [open source platform as a service](https://18f.gsa.gov/2015/05/08/layering-innovation/) that allows us to iterate quickly and receive feedback sooner. The 18F-site team has an organization and a few "routes." Each route is a subdomain that can be used like a demo server. If you have a Cloud Foundry account with 18F and are added to the `site` space you can push up changes and circulate them to others before issuing a pull request to `staging`.

Here's how to do it:

1. If you haven't already, make an issue with the DevOps team to get a Cloud Foundry account. Make sure you're added to the `site` space.
1. Follow the instructions for [setting up Cloud Foundry](https://docs.18f.gov/getting-started/setup/) (If you get an error during `brew install` while following this step, you can [download an installer](https://cli.run.pivotal.io/stable?release=macosx64&source=github-rel))
1. Rename `manifest-sample.yml` in this repo to `manifest-<name>.yml` where `<name>` is your name.
1. Open `manifest-<name>.yml` in your favorite editor and change line 5 to `- name: site-<name>` (where `<name>` is your name.)

Now you should be all set to make your first deployment.

1. Open Terminal and `cd` into your copy of `18f.gsa.gov`
1. Run `./go build` to build the site
1. Run `cf push -f manifest-<name>.yml` (where `<name>` is your name).

The last step should generate a bunch of output that ends with this:

```
requested state: started
instances: 1/1
usage: 64M x 1 instances
urls: site-<name>.18f.gov
last uploaded: Mon Jul 6 16:01:37 UTC 2015
stack: cflinuxfs2

     state     since                    cpu    memory         disk           details
#0   running   2015-07-06 12:02:12 PM   0.0%   31.5M of 64M   148.8M of 1G
```

If it looks good, you should be able to go to site-<name>.18f.gov and see your demo copy of 18f.gsa.gov running and share it with the team.

Sometimes you might get some crazy looking errors. These seem to happen especially on slower connections. If you get an error, try again. If you're still getting an error reach out on either the #18f-site or #devops channels and we'll help you out.

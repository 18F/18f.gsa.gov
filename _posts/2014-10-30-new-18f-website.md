---
layout: post
title: Taking our website into our own hands
image:
description: How we moved our website to Jekyll, left Tumblr behind, and set up automatic deployment with webhooks.
xexcerpt: A few of us here recently took a bit of time to drastically rework 18F's main website and blog &mdash; what you're reading right now &mdash; and take it fully into our own hands. It may not look a lot different on the surface, but we made some serious infrastructure changes. Namely, we migrated the site to Jekyll, and left Tumblr behind by moving the blog inside to join it. We also set up automatic deployment to staging and live sites, using GitHub's webhook system.
authors:
 - eric

tags:
  - syntax
---
<p class="authors">
  by {% author eric %}
</p>

A few of us here recently took a bit of time to drastically rework 18F's main website and blog &mdash; what you're reading right now &mdash; and take it fully into our own hands.

It may not look a lot different on the surface, but we made some serious infrastructure changes. Namely, we migrated the site to Jekyll, and left Tumblr behind by moving the blog inside to join it. We also set up automatic deployment to staging and live sites, using GitHub's webhook system.

<!-- more -->

This has drastically simplified our publishing process and opened it up the whole team, by deploying from GitHub instead of managing a separate Tumblr account. While we still have an approval process for the _content_ of our blog posts, anyone on the team is capable of hitting the Publish button.

To that end, we've written a [team blogging guide](_), to make the blogging process easier for teammates less familiar with Jekyll.

Below are more details on how we got this done, for anyone interested in trying it out.

## Moving to Jekyll

Our site used to be a handful of static HTML, with lots of copied and pasted header and footer boilerplate.

We've now moved to **[Jekyll 2.4](_)**, which uses a basic templating system to generate static files when needed. This enables us to use a system of layouts and includes for rendering HTML, and plugins to transform content during the rendering process. The resulting static files can be served extremely efficiently.

We also took the time to **[make data out of our team](_)**, and turn them all into a YAML file. This lets us render a grid of their faces more easily, even open up a [little JSON API of our team](_).

## Blogging with freedom

Jekyll is a fantastic blog engine, so we've also **ditched our Tumblr blog**. We took the [old blog](http://18fblog.tumblr.com) and imported it here, at [`https://18f.gsa.gov/news`](18f.gsa.gov/news).

This lets us do all kinds of fun things, like **writing in Markdown**. [Markdown](_) is a simple text-based markup language designed to be easy for humans to type themselves. For example, a [recent post about our EITI design studio](_) has [this excerpt](_):

```
**Creating user personas.** Based on the participants’ previous research on users,
the group developed [user personas](http://www.usability.gov/how-to-and-tools/methods/personas.html)
to serve as examples of the types of people who would interact with the website.
```

Jekyll lets you associate any metadata you want with posts, using "YAML front-matter". At the top of a Markdown file, you put some key-value pairs you want to pair with the post. This way, you can keep information about a post in one place but use it multiple places (for example, in OpenGraph tags and Twitter cards).

This [recent post on an 18F-hosted hackathon](_) begins [with this metadata](_):

```yaml
---
layout: post
title: "18F Open Source Hack Series: Midas"
image: /assets/blog/midas-oct-hacking/coding.jpg
description: "We're building the future of government, but we need your help! Join us for a session of coding or UX design. Feel free to come for the afternoon or evening session or both! You can work solo, in pairs or groups that will form when we get there."
excerpt: "18F invites designers and developers from inside and outside of government to join us for a flurry of coding and sketching.  Midas is an open source project in active development by 18F, Health & Human Services (HHS) IDEA Lab and the State Department.  A small cross-agency team, dedicated to launching this product to empower passionate civil servants and aspiring diplomats all over the world."
authors:
- sarah
tags:
- open source
- how we work
- midas
---
```

Because we're running Jekyll on our own servers, and not using GitHub Pages, we can also make our own custom plugins. Since we have our team [captured as data](_), we wrote a [simple plugin](_) to add an `author` tag to our templates using teammates' handles.

```html
<p class="authors">
  by {% raw %}{% author chrisc %}{% endraw %}, {%raw %}{% author mhz %}{% endraw %}, and {% raw %}{% author nick %}{% endraw %}
</p>
```

Which produces:

```html
<p class="authors">
  by <span class="author chrisc">Chris Cairns</span>, <span class="author mhz">Michelle Hertzfeld</span>, and <span class="author nick">Nick Bristow</span>
</p>
```

This way, we can update team names in one place and have it automatically update all of their posts. In the future, we can do a lot more, like link each person's name to their previous posts, or maybe even put little icons next to people's names. The future is an exciting place.

Finally, we can use Jekyll to generate an [RSS feed](_) for our blog, so that you can plug it into your feed reader, or powerful tools like [IFTTT](_) and [Yahoo Pipes](_).

## Automatic deployment

Even though we're not using GitHub Pages, we really wanted any changes to show up on our staging and live sites immediately and automatically. Automatic deployment changes team behavior, and makes anyone feel empowered to make changes without going through a bottleneck.

We made this work using **[GitHub's webhooks](_)**. A free feature, GitHub will notify the URL of your choice whenever various events happen to your repository. We created two webhooks for [our website's main repository](https://github.com/18f/18f.gsa.gov), pointed at our staging and live URLs:

  [ image of configured webhook on 18f site repo ]

Each of which is configured to notify the webhook when changes are made to the files in the repository, directly or through a pull request. Here's our production webhook:

  [ image of one webhook detail ]

We use a small tool called [Hookshot](_), a tiny Node HTTP server that can listen for any updates to a given branch, and run a given command. We run two of these, one for our `staging` branch, and one for our `production` branch.  Each of them is given the command to re-build the site.

We daemonize the webhooks using [`forever`](_). Starting the webhook process for the staging site looks something like this:

```bash
forever start -a deploy/hookshot.js -p 3000 -b staging -c "cd /path/to/18f.gsa.gov && git pull && jekyll build"
```

These hookshot processes run on the web server, and we make them available for GitHub to speak with through an [nginx reverse proxy](_):

```nginx
location /deploy {
    proxy_pass http://localhost:3000/;
    # ... more proxy options ...
}
```

We have our nginx configuration and deploy scripts [versioned and documented](_) for anyone who wants to do something similar.

## It's nice to have control

Taken together, these steps greatly simplified our site's development and deployment, and gives our blog the flexibility and customization of self-publishing. It's nice to have control, and we hope the details of our work are helpful for anyone who's interested in doing the same.

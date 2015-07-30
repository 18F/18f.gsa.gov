---
title: "Giving back to open source: Everybody wins"
date: 2015-06-03
layout: post
authors:
- mbland
tags:
- open source
- technical
- security
- the hub
- our projects
excerpt: "We love when we're able to contribure to open source projects from other organizations. Recently, we contributed to Bitly's open source google_auth_proxy to support our Hub and MyUSA applications, and our contribution has  already helped other OAuth2 providers."
description: "We love when we're able to contribure to open source projects from other organizations. Recently, we contributed to Bitly's open source google_auth_proxy to support our Hub and MyUSA applications, and our contribution has  already helped other OAuth2 providers."
image: /assets/blog/google-auth-proxy/bitly-oauth-github.jpg
---

Many of our products depend on reusable open source software, and we
also publish our own work as open source. What's even cooler is when
we’re able to contribute to an open source product from another
organization. [oauth2\_proxy](https://github.com/bitly/oauth2_proxy)
(formerly google\_auth\_proxy) is a program from
[Bitly](https://bitly.com/) (written in [the Go programming language](https://golang.org/)) that enables a web service to provide
authentication via OAuth2 provider accounts, without the need to build
authentication code directly into the service. This was a perfect fit
for the needs of the internal [18F Hub](https://18f.gsa.gov/2014/12/23/hub/), which is a
[Jekyll](http://jekyllrb.com/)-generated site containing no
authentication logic of its own.

Because the [General Services Administration (GSA) is a Google Apps for
Government customer](http://googleforwork.blogspot.com/2011/07/gsa-has-gone-google.html),
and because we serve the Hub using the [Nginx web server](http://nginx.org/), it was straightforward to configure Nginx
and the oauth2\_proxy to provide authentication for 18F team members
(and other guests within the GSA) with no changes required to the Hub
code.

The basic structure is to create a `server` block as the public-facing
internal Hub server that uses the `proxy_pass` directive to forward
requests to the oauth2\_proxy, listening on `localhost:4180`. The
oauth2\_proxy, in turn, is configured to redirect authenticated requests
to a server on `localhost:8080`, configured as another Nginx
`server` block, that just serves the pre-generated Jekyll site:

```
server {
    listen 443 ssl spdy;
    server_name hub.18f.gov;
    include ssl/star.18f.gov.conf;

    location /logo.png {
        alias /home/ubuntu/18f-hub/_site/assets/images/logo-18f-oauth.png;
    }

    location / {
        proxy_pass http://127.0.0.1:4180/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Scheme $scheme;
        proxy_connect_timeout 1;
        proxy_send_timeout 30;
        proxy_read_timeout 30;
    }
}

server {
    listen 127.0.0.1:8080;
    server_name hub.18f.gov;
    port_in_redirect off;
    error_page 404 /404/index.html;

    location / {
        ssi on;
        root /home/ubuntu/hub/_site;
        index index.html api.json;
        default_type text/html;
        set $authenticated_user $http_x_forwarded_email;
        set $access_token $http_x_forwarded_access_token;
    }
}
```

This worked really well for 18F, but there was a problem. Not all
government agencies use Google Apps, and we wanted to be able to permit
guests from other agencies access to our internal Hub or set up their
own. The idea was to use 18F’s own
[MyUSA](https://18f.gsa.gov/2015/05/18/myusa/) product as an [OAuth2 authentication provider](http://oauth.net/articles/authentication/)
instead. However, since the Hub didn’t contain any authentication code
of its own, the question was how to implement the switch to MyUSA.

Thanks to the fact that Bitly chose to make its oauth2\_proxy open
source, I was able to inspect the code, learn how it worked, fork my own
copy, and produce a prototype that used MyUSA as the OAuth2 provider.
Then, [I engaged the oauth2\_proxy maintainer](https://github.com/bitly/google_auth_proxy/issues/65),
Jehiah Czebotar, to get feedback and solicit approval to incorporate
[an OAuth2 provider generalization](https://github.com/bitly/google_auth_proxy/pull/77)
into the main `bitly/oauth2_proxy` repository. With that
generalization interface in place, Jehiah also permitted me to add [the MyUSA provider](https://github.com/bitly/google_auth_proxy/pull/79) to
the main repository, potentially enabling any oauth2\_proxy user to use
MyUSA for authentication. Also, the new generalized provider support
also paid dividends for others beyond 18F and Bitly, as another
developer built upon the new interface to add [LinkedIn as an OAuth2 provider](https://github.com/bitly/google_auth_proxy/pull/84), and
Jehiah added [GitHub as a provider](https://github.com/bitly/oauth2_proxy/pull/98).

While this was a big step forward for 18F’s involvement in the open
source community, and for MyUSA in particular, the collaboration didn’t
stop there. We wanted the Hub to be able [to integrate with other MyUSA-authenticated services](https://github.com/18F/hub/pull/211)
serving JSON API endpoints; to do that, we needed access to the MyUSA
access token, which the oauth2\_proxy initially discarded. I added
[access token pass-through](https://github.com/bitly/google_auth_proxy/pull/80) to
the oauth2\_proxy to enable this integration (and [clean it up later](https://github.com/bitly/google_auth_proxy/pull/81)).

Since then, I’ve contributed a host of other changes to the main
oauth2\_proxy repository, both to solve minor issues ([sign-in page redirection](https://github.com/bitly/google_auth_proxy/pull/82), email
address [case sensitivity](https://github.com/bitly/google_auth_proxy/pull/83)) and
to implement handy new features ([automatic refresh](https://github.com/bitly/google_auth_proxy/pull/88) of the
auth cookie, [watching the authenticated emails file](https://github.com/bitly/google_auth_proxy/pull/89) for updates,
blocking crawlers with
[robots.txt](https://github.com/bitly/google_auth_proxy/pull/90)).
I’ve also figured out how to configure the oauth2\_proxy to provide
[single-sign on across multiple hosts](https://github.com/18F/hub/blob/master/deploy/SSO.md).

The lessons here are twofold. For one, it’s possible to use
oauth2\_proxy, Nginx, and Jekyll to produce a highly functional,
fully-authenticated web application without the need for complex
frameworks, databases, or other moving parts requiring vigilant
maintenance. While the Hub has a ways to go, our team has had a great
deal of success finding and sharing information with it, particularly
when it comes to onboarding new team members; and it’s incurred very,
very low running costs. The new authenticated API integration feature
promises to make the Hub and its application model even more powerful,
despite the fact that it remains a statically generated Jekyll site at
its core. (Fellow 18F team member Dave Cole actually [advocated for this model three years ago](https://developmentseed.org/blog/2012/07/27/build-cms-free-websites/).)

As for the second lesson, it’s often difficult to achieve this degree of
transparency, collaboration, reuse, and contribution in the same
organization, let alone between a government agency and a private
company. However, thanks to a commitment to open source development on
behalf of both 18F and Bitly, our team members can work together to
develop features that benefit not just our two organizations, but many
others who may be able to apply (and adapt!) the oauth2\_proxy to their
needs.

By continuing to explore new ways to develop and deploy applications and
reuse infrastructure as fully-invested members of the open source
community, 18F aims to demonstrate to the rest of government, and those
it serves, that such methods are safe and productive and ultimately
improve the way government works.

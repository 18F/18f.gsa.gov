---
title: The first .gov domains hardcoded into your browser as all-HTTPS
date: '2015-02-09'
layout: post
image: '/assets/blog/hsts/with-https-headers.png'
tags:
- https
- security
- policy
- hsts
authors:
- eric
description: "Every `.gov` website, no matter how small, should give its visitors a secure, private connection. Ordinary HTTP (`http://`) connections are neither secure nor private, and can be easily intercepted and impersonated. In today's web browsers, the best and easiest way to fix that is to use HTTPS(`https://`)."

excerpt: "Every `.gov` website, no matter how small, should give its visitors a secure, private connection. Ordinary HTTP (`http://`) connections are neither secure nor private, and can be easily intercepted and impersonated. In today's web browsers, the best and easiest way to fix that is to use HTTPS(`https://`)."

---
## The first .gov domains hardcoded into your browser as all-HTTPS

Every `.gov` website, no matter how small, should give its visitors a secure,
private connection. Plain HTTP (`http://`) connections are neither secure nor
private, and can be easily intercepted and impersonated. In today's web
browsers, [the best and easiest way to fix that is to use
HTTPS](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-
we-make/) (`https://`).

Now, a number of government websites have taken a step further and are
becoming **the first .gov domains hardcoded into major web browsers as HTTPS-
only**.

This means that when visitors type "notalone.gov" or click a link to
<strong>http://</strong>notalone.gov, the browser will go directly to
<strong>https://</strong>notalone.gov without ever attempting to connect over
plain HTTP. This prevents anyone from getting a chance to intercept or
maliciously redirect the connection, and avoids exposing URLs, metadata, and
cookies that would otherwise have remained private.

18F worked with a number of government teams to help submit 19 `.gov` domains
to be hardcoded as HTTPS-only:

* The Federal Trade Commission prepared the Do Not Call Registry, as well as
* their consumer complaint system and a merger filing system, by submitting
* **[donotcall.gov](https://www.donotcall.gov)**,
* **[ftccomplaintassistant.gov](https://ftccomplaintassistant.gov)**, and
* **[hsr.gov](https://www.hsr.gov)**.

* The Inspector General for the US Postal Service submitted
* **[uspsoig.gov](https://uspsoig.gov)*(which includes various [sensitive
* complaint forms](https://uspsoig.gov/form/whistleblower-complaint-form))
* after moving entirely to HTTPS.

* The **[AIDS.gov](https://www.aids.gov/)*team submitted their domain after
* moving the main website and each subdomain over to HTTPS.

* The Administrative Conference of the US submitted
* **[acus.gov](https://www.acus.gov)*after [moving to
* HTTPS](https://www.acus.gov/policies) while relaunching their website.

* At the state level, the District of Columbia legislature submitted
* **[dccode.gov](https://dccode.gov)*as part of its launch.

* The Federal Register submitted
* **[federalregister.gov](https://www.federalregister.gov)**, a fully HTTPS-
* enabled website since 2011.

* 18F chipped in and submitted **[notalone.gov](https://www.notalone.gov)**,
* which used HTTPS from the start.

* The [OMB MAX](https://max.omb.gov) team worked with the White House and the
* General Services Administration to prepare the website for the [Federal CIO
* Council](https://cio.gov) and a number of other websites and redirect
* domains: [cio.gov](https://cio.gov), [cao.gov](https://cao.gov),
* [cfo.gov](https://cfo.gov), [max.gov](https://max.gov),
* [itdashboard.gov](https://itdashboard.gov),
* [paymentaccuracy.gov](https://paymentaccuracy.gov),
* [earmarks.gov](https://earmarks.gov), [bfelob.gov](https://bbfelob.gov),
* [save.gov](https://save.gov), [saveaward.gov](https://saveaward.gov).

To be clear: the above domains are _not_ the only `.gov` domains that use
HTTPS. Many others do. The above domains have taken the extra step of
verifying that all their subdomains use HTTPS, and are comfortable telling
browsers to just assume this going forward. This will take effect in Chrome,
Firefox, and Safari over the course of 2015.

There are [many more .gov domains](https://18f.gsa.gov/2014/12/18/a-complete-
list-of-gov-domains/), but we hope this contribution is the beginning of
something bigger.

Read on for more about **[why HTTPS is important](#what-https-does)**, how to
**[reliably force HTTPS](#tightening-up-https-with-strict-transport-
security)**, and how to **[submit your own domain to browsers](#an-hsts-
preload-list)**.

## What HTTPS does

We've written previously about [why HTTPS is good for .gov websites and
visitors](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-
website-we-make/), no matter how important the website may be. To understand
why, it helps to understand the information that HTTPS protects.

When you visit a website, your computer connects to the website's computer.
This means you send information about yourself sprinting across the internet
at the speed of light, passing through the computers of companies and
countries from all over the world that sit between you and the website's
computer. That's how the internet works: a sprawling, unpredictable network of
computers under the control of potentially anyone.

When you connect over ordinary `http://`, it's like **sending a postcard in
the mail**, where every computer in between you and the website gets to see
your information:

<img src="https://konklone.com/assets/misc/with/with-http-headers.png"
<style="border: 1px solid" />

That includes cookies, the browser you use, and any other data the website
asks you to send (in this example, your location).

And because it's like a postcard, any computer in between you and the website
can freely **erase, change, or add** information on the postcard (imagine it's
written in pencil). In fact, because insecure `http://` connections are so
common, this happens all the time and it's often invisible to the ordinary
user.

When you can connect over `https://`, it's like **sending a locked briefcase**
that only the website's computer can open. IP addresses and a domain name are
all that the internet's computers get to see:

<img src="https://konklone.com/assets/misc/with/with-https-headers.png"
<style="border: 1px solid" />

IP addresses and domain names do still reveal some information, but it's the
bare minimum necessary to make the connection.

HTTPS guarantees that the connection between you and the website is secure and
private.

## Tightening up HTTPS with Strict Transport Security

Even after a website turns on HTTPS, visitors may still end up trying to
connect over plain HTTP. For example:

* When a user types "dccode.gov" into the URL bar, browsers default to using
* `http://`. A user may click on an old link that mistakenly uses an `http://`
* URL. A user's network may be hostile and actively rewrite `https://` links
* to `http://`.

Generally, websites that prefer HTTPS will still listen for connections over
HTTP in order to redirect the user to the HTTPS URL.

So when a visitor clicks a link to `http://dccode.gov`, the website will allow
the connection for just long enough to tell the visitor's browser to go to
`https://dccode.gov`.

However, **that redirect is itself insecure** (it's on a postcard), and is an
opportunity for an attacker to capture information about the visitor, or to
maliciously redirect the user to a phishing site.

Any website can protect their visitors from this scenario by instructing
browsers to _only_ connect over HTTPS using an open standard called **[HTTP
Strict Transport Security](https://developer.mozilla.org/en-
US/docs/Web/Security/HTTP_strict_transport_security)**, or **HSTS**.

Turning on HSTS means adding a `Strict-Transport-Security` [HTTP
header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) to your
website:

``` Strict-Transport-Security: max-age=31536000; ```

Any [browser that supports HSTS](http://caniuse.com/#search=hsts) that sees
that header will from then on refuse to issue an `http://` request to that
website, issuing an `https://` request instead.

HSTS greatly increases the security and privacy of a website, and is a very
easy add-on to HTTPS.

Its main weak point is that the visitor's _first_ visit to the website is not
protected (it's still a postcard!), as the browser needs to visit the website
once in order to receive the HSTS instruction.

## An HSTS Preload List

To solve the "first visit" problem, the Chrome security team created an "HSTS
preload list": a [list of domains](https://chromium.googlesource.com/chromium/
src/+/master/net/http/transport_security_state_static.json) baked into Chrome
that get Strict Transport Security enabled automatically, even for the first
visit.

Firefox and Safari also now use HSTS preload lists that include Chrome's list.

While a giant list may sound crude, it's a simple solution that many of the
today's most popular websites (including Twitter, Facebook, Google, and
GitHub) use to protect your visits.

The Chrome security team allows anyone to [submit their domain to the
list](https://hstspreload.appspot.com/), provided you meet the following
requirements:

* Enable HTTPS on your root domain (e.g. `https://donotcall.gov`), and **all
* subdomains*(e.g. `https://www.donotcall.gov`). Your website should redirect
* from HTTP to HTTPS, at least on the root domain. Your root domain should
* turn on Strict Transport Security for all subdomains, with a long `max-age`,
* and a `preload` flag to indicate that the domain owner consents to
* preloading..

If you check out the HTTP headers sent by the `.gov` domains above, you'll see
that they all include the following header:

``` Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
```

So in short, if you want to add your domain to the list: force HTTPS on the
whole domain, add that header, and submit the form.

## Moving forward

Obviously, you can't hardcode the entire internet into a big list.

But the `.gov` space, by comparison, is quite small. Perhaps someday we'll be
able to just delete every individual `.gov` domain from the list and replace
them with one entry: `*.gov`.

In the meantime, the internet's governing bodies are [clearly
stating](https://w3ctag.github.io/web-https/) that
[encryption](https://datatracker.ietf.org/doc/rfc7258/) is [the
future](http://www.internetsociety.org/news/internet-society-commends-
internet-architecture-board-recommendation-encryption-default), and a lot of
people are working to make HTTPS simpler to deploy. It's becoming easier to
imagine a future where web browsers treat HTTPS as the norm, and [warn
visitors away from plain HTTP](https://www.chromium.org/Home/chromium-security
/marking-http-as-non-secure).

Finally, a big thank you to the civil servants across government who took the
time to prepare their `.gov` domains.

---
layout: post
title: Why 18F uses HTTPS everywhere
image:
description: 18F uses HTTPS in every website we make, so that our users have a fast, secure, private connection.

authors:
 - eric

tags:
- security
- https
- policy
---
<p class="authors">
  by {% author eric %}
</p>

18F is an in-house government team that builds modern, usable, and secure technology for the rest of the US federal government. As government employees in the largest organization in the world, we get to work on tough problems affecting lots of people.

That's why 18F is committed to **using HTTPS in every application we build**.

That means our products are only accessible over an encrypted, verified connection. Our sites use `https://` and communicate using [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security) (TLS), which is also known as SSL.

That sounds technical, but you see HTTPS all the time as you browse the web. Look up and you'll see it right now:

[image of browser bar with https://]

Our decision to use HTTPS everywhere was not difficult to make. Using strong encryption greatly benefits our visitors and our government partners by letting us offer:

* **A secure connection.** HTTPS guarantees that visitors are connecting to the official website, and not getting a page that's been tampered with &mdash; or replaced entirely &mdash; by someone else. This protects users from being hijacked or having their information stolen, and protects our government partners from being impersonated or used as a vehicle for attack.
* **A private connection.** Internet traffic is easily intercepted and easily correlated &mdash; there is no such thing as insensitive browsing data. By using HTTPS, a visitor's browsing activity is kept private. Web pages, URLs, cookies, and HTTP headers are all encrypted.
* **A fast connection.** Encryption allows us to use modern protocols like [SPDY](https://developers.google.com/speed/spdy/), an extension to HTTPS that [greatly speeds up website loading](https://thethemefoundry.com/blog/why-we-dont-use-a-cdn-spdy-ssl/). SPDY is widely supported by modern browsers, and used today by [Twitter, Google, and Facebook](http://www.wired.com/2013/03/facebook-spdy/). SPDY requires encryption, and is the basis for the upcoming [HTTP/2](https://http2.github.io/), which will require encryption to support visitors on modern browsers.

Finally, using HTTPS lets us adhere to **search engine best practices**, as [Google's search algorithms now prefer encrypted websites](http://googlewebmastercentral.blogspot.com/2014/08/https-as-ranking-signal.html).

These properties are useful for all of our applications, all of the time &mdash; not just when passwords or personal information are involved. By simply deploying HTTPS all the time, we don't have to engineer a boundary around "sensitive" parts of the application, or judge where those lines should be drawn.

Our friends across the pond in the Government Digital Service have come to the same conclusion, and [require HTTPS](https://www.gov.uk/service-manual/domain-names/https.html) in their [digital standards for the UK government](https://www.gov.uk/service-manual).

As we build web APIs that we want the public to rely on, secure connections are becoming even more vital. 18F's [API standards](https://18f.gsa.gov/2014/07/15/hot-off-the-press-18fs-api-standards/) recognize this by [requiring the use of encryption](https://github.com/18F/api-standards#always-use-https).

## HTTPS has never been faster

The most common concern people raise about HTTPS is performance. Encryption requires computation, and can make some kinds of caching more difficult. Fortunately, in the last several years, there has been tremendous investment in HTTPS by the private sector.

Google has been engineering and publishing major speed improvements to OpenSSL's [encryption](https://www.imperialviolet.org/2010/06/25/overclocking-ssl.html) and [privacy](https://www.imperialviolet.org/2011/11/22/forwardsecret.html) for years, and their work on SPDY allows websites to achieve [serious performance improvements](https://thethemefoundry.com/blog/why-we-dont-use-a-cdn-spdy-ssl/). As major technology firms like [Facebook](http://lists.w3.org/Archives/Public/ietf-http-wg/2012JulSep/0251.html) and [Twitter](https://blog.twitter.com/2013/forward-secrecy-at-twitter) invest in universal encryption, their engineering and best practices have improved the ecosystem for everyone.

In 2014, the biggest performance priority for HTTPS is to just [get it deployed more widely](https://istlsfastyet.com) so that these optimizations can continue.

## Integrating HTTPS into our workflow

A more serious concern with HTTPS is operational: managing certificates, working out the right configuration, and generally not screwing it up. The financial cost of _purchasing_ certificates is small &mdash; the maintenance cost of installing, configuring, and rotating them is not. This is arguably the biggest issue with deploying HTTPS today, and contributes to the web's [overall slow and inflexible security response](https://konklone.com/post/why-google-is-hurrying-the-web-to-kill-sha-1#changing-certificates-shouldn't-be-this-hard).

Like everything else, managing the mechanics of HTTPS becomes far easier when you commit to it and operationalize it.

We've still got a lot to do on this front, but we're starting out by:

* Openly documenting our [standard HTTPS practices](https://github.com/18F/tls-standards). This forces us to be more thoughtful and rigorous, and we hope it will yield valuable public feedback.
* Baking a strong nginx configuration into the baseline that 18F uses to create each of our production servers, so that our individual developers don't have to become HTTPS experts.
* Keeping up with the web security community as it makes advances in [encryption](https://blog.cloudflare.com/ecdsa-the-digital-signature-algorithm-of-a-better-internet/), [protocols](http://threatpost.com/tls-1-3-working-group-has-consensus-to-deprectate-rsa-key-transport), and [certificate management](https://sslmate.com) that can make our lives easier and our applications more secure.

As we grow, we'll be writing about the tools we use &mdash; and [open sourcing](https://18f.gsa.gov/2014/07/29/18f-an-open-source-team/) the tools we make &mdash; along the way.

## Moving forward

The web's future is encrypted connections, for all the right reasons. The more people and institutions that push encryption forward, the simpler and faster it will become for everyone. 18F is joining that process.

You'll soon hear more about our technical practices, and what we're doing to move the ball forward on web security inside the federal government.

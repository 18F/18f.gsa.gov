---
layout: bare
permalink: /privacy/
---

# Privacy

18F is a component of the [General Services Administration](http://gsa.gov) (GSA), an independent agency of the United States federal government.

As such, this website is currently covered by the [GSA's overall privacy policy](http://gsa.gov/portal/content/116609).


## Third Party Services

Serving this website relies on several third party services, each of whom may obtain data concerning some aspects of your browsing history on this website.

The third party services we use are quite common on the internet today, and you almost certainly visit other websites using them on a regular basis. It's nonetheless important to be aware of them, and in the spirit of transparency and an informed public, we're listing them here.

Below, we describe how we use each third party service, and link to its privacy policy so you may understand how they handle your information.

If you wish to suggest alternatives or workarounds to these third parties, or you see one we're missing, please open a discussion in [this website's issue tracker on GitHub](https://github.com/18F/18f.gsa.gov/issues).

## Services

* **[Amazon Web Services](https://aws.amazon.com/privacy/).** 18F's website is hosted on [Amazon Web Services](https://aws.amazon.com), a commercial cloud services provider. We use an [HTTPS connection](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/) to encrypt your data in transit. We use standard website logging, including visitor IP addresses and user agents.

* **[Google Analytics](https://www.google.com/policies/privacy/).** 18F uses [Google Analytics](https://www.google.com/analytics/) on its website to understand visitor behavior. We [tell Google to anonymize IP addresses](https://support.google.com/analytics/answer/2763052?hl=en) before they are stored, and [force an HTTPS connection](https://developers.google.com/analytics/devguides/collection/analyticsjs/advanced#ssl) at all times.

* **[Google Fonts](https://www.google.com/policies/privacy/).** 18F uses [free webfonts from Google](https://www.google.com/fonts/) to style content. Fonts are served over an encrypted connection. We are [evaluating](https://github.com/18F/18f.gsa.gov/issues/230) hosting these fonts ourselves, which would remove visitor interaction with this third party.

* **[Symantec](https://www.symantec.com/about/profile/privacypolicy/).** 18F currently uses an HTTPS certificate signed by Symantec (Verisign). Some browsers (including Firefox) will ask Symantec for confirmation of our certificate before loading our website, which tells Symantec you've visited the site. This is called "revocation checking", and is anot a commonly discussed aspect of browsing secure websites today. 18F is [in the process](https://github.com/18F/18f.gsa.gov/issues/292) of implementing a more sophisticated mechanism for revocation checking (called ["OCSP stapling"](https://en.wikipedia.org/wiki/OCSP_stapling)) that no longer shares visitor information with Symantec in most browsers.

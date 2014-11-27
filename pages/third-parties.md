---
layout: bare
permalink: /third-parties/
---

# Third Party Services

Serving this website depends on several third party services, each of whom may obtain data concerning some aspects of your browsing history on this website.

We describe how we use each third party service below, and link to its privacy policy. You should consult with each third party's privacy policy, to understand how that third party handles your information.

If you wish to suggest alternatives or workarounds to these third parties, or you see one we're missing, please open a discussion in [this website's issue tracker on GitHub](https://github.com/18F/18f.gsa.gov/issues).

## Services

* **[Amazon Web Services](https://aws.amazon.com/privacy/).** 18F's website is hosted on [Amazon Web Services](https://aws.amazon.com), a commercial cloud services provider. We use an [HTTPS connection](https://18f.gsa.gov/2014/11/13/why-we-use-https-in-every-gov-website-we-make/) to encrypt your data in transit. We use standard website logging, including visitor IP addresses and user agents.

* **[Google Analytics](https://www.google.com/policies/privacy/).** 18F uses [Google Analytics](https://www.google.com/analytics/) on its website to understand visitor behavior. We [tell Google to anonymize IP addresses](https://support.google.com/analytics/answer/2763052?hl=en) before they are stored, and [force an HTTPS connection](https://developers.google.com/analytics/devguides/collection/analyticsjs/advanced#ssl) at all times.

* **[Google Fonts](https://www.google.com/policies/privacy/).** 18F uses [free webfonts from Google](https://www.google.com/fonts/) to style content. Fonts are served over an encrypted connection. We are [evaluating](https://github.com/18F/18f.gsa.gov/issues/230) hosting these fonts ourselves, which would remove visitor interaction with this third party.

* **[Symantec](http://www.symantec.com/about/profile/privacypolicy/).** 18F currently uses an HTTPS certificate signed by Symantec (Verisign). Some browsers (including Firefox) will ask Verisign for confirmation of our certificate before loading our website. This is called "revocation checking", and is not a widely understood aspect of browsing secure websites today. 18F is [in the process](https://github.com/18F/18f.gsa.gov/issues/292) of implementing a more sophisticated mechanism for revocation checking (called ["OCSP stapling"](https://en.wikipedia.org/wiki/OCSP_stapling)). This will remove visitor interaction with this third party for most visitors.


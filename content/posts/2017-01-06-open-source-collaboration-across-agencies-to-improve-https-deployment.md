---
title: "Open source collaboration across agencies to improve HTTPS deployment"
date: 2017-01-06
authors:
- cameron-dixon
tags:
- https
- security
- open source
excerpt: "Cameron Dixon at the Department of Homeland Security writes for 18F: To facilitate secure connections for citizens, immigrants, and other users, the Department of Homeland Security began delivering 'HTTPS Reports' directly to federal agencies. We open-sourced the tool we scan with, in collaboration with our colleagues at 18F."
image: /assets/blog/pshtt-post/https-report-title.png
hero: false
---

{% image "assets/blog/pshtt-post/https-report-title.png" "Cover of HTTPS report delivered by DHS to agency security offices." %}

Sometimes, to accomplish a worthy goal, people and organizations benefit from a little push.

In 2015, the White House's Office of Management and Budget (OMB) issued a [standard](https://https.cio.gov/) requiring all publicly accessible federal websites and web services to only provide service through a secure connection — HTTPS. GSA launched a public dashboard, [Pulse](https://pulse.cio.gov/), to help track agency compliance — but as helpful as a public dashboard is, not everyone who needs its data will look at it.

In an effort to facilitate secure connections for citizens, immigrants, and other users, the Department of Homeland Security (DHS) began delivering "HTTPS Reports" directly to federal agencies and open-sourced the tool we scan with — which we lovingly call [`pshtt`](https://github.com/dhs-ncats/pshtt) (pronounced "pushed"; yes, that's an anagram of the letters in HTTPS). It was developed in collaboration with our colleagues at 18F.

## Getting the word out

In any organization, there are formal methods for getting the word out — press releases, dashboards, Twitter. But in an organization the size of the U.S. federal government, how can a team communicate across organizational boundaries to make a meaningful impact?

You start by working publicly, since that's the most effective way we've found to ensure wide internal distribution. The Pulse team maintains a [fantastic public resource](https://pulse.cio.gov/https/domains/) that supports transparency, accountability, and [replicability](https://github.com/18F/pulse#the-pulse-of-the-federal-gov-webspace) — people in other countries have started deploying their own dashboards.

Then you work on the inside, and that means you use acronyms: a team inside of the DHS NCCIC called NCATS (that's the [National Cybersecurity & Communications Integration Center](https://www.dhs.gov/cyber-incident-response), and the National Cybersecurity Assessments and Technical Services team, respectively) performs [authorized](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2015/m-15-01.pdf) scans of federal networks for known vulnerabilities and obvious misconfigurations. This effort, known as "Cyber Hygiene", delivers regular findings to agency information security staff so that they can apply appropriate fixes. (Cyber Hygiene is [also offered](mailto:ncats_info@dhs.gov) to state, local, tribal, and territorial governments and private organizations.)

Cyber Hygiene is generally centered on finding flaws, but we've recognized for some time that we have great potential to assist agencies in complying with technical memoranda like the [HTTPS-Only Standard](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2015/m-15-13.pdf) or in deploying [other](https://tools.ietf.org/html/rfc7208) [freely](https://tools.ietf.org/html/rfc7489) [available](https://tools.ietf.org/html/rfc3207) modern security practices. And because we maintain relationships with agency security teams, we can typically get results directly in front of people who can take action on them. Since we started sending our reports in September 2016, we've happily seen a flurry of inquiries and action from teams that are working hard to comply with the HTTPS requirement.

## How pshtt works

`pshtt` is a command line tool that examines how and whether a domain supports and enforces HTTPS. Respect and thanks goes to [Ben Balter](https://github.com/benbalter) for developing the open source [`site-inspector`](https://github.com/benbalter/site-inspector) Ruby gem that `pshtt` was based on.

You can find `pshtt` on GitHub, or install it with `pip`:

```
$ pip install pshtt
```

Then, run `pshtt` on a domain to see HTTPS information about that domain:

```
$ pshtt dhs.gov --json
  {
    "Canonical URL": "https://www.dhs.gov",
    "Domain Supports HTTPS": true,
    "Domain Enforces HTTPS": true,
    "Domain Uses Strong HSTS": false,
...
```

`pshtt` works by making GET requests to four "endpoints" at each domain:

1. `http://`
2. `http://www`
3. `https://`
4. `https://www`

`pshtt` then analyzes responses at each endpoint, parsing HTTP headers and following redirects. It uses this information to determine the "canonical" URL, and then spits out CSV or JSON with a variety of helpful fields. These include whether the domain:

* Is up and responsive!
* Downgrades HTTPS (when users can briefly connect over HTTPS but are immediately redirected down to HTTP)
* Appears to "default" to HTTPS
* Has certificate errors (like a hostname mismatch error, an expired certificate, or a problem with the certificate chain)
* Uses [HTTP Strict Transport Security](https://https.cio.gov/hsts/) (HSTS), and the length of its `max-age`

Together, `pshtt`'s analysis can determine whether a domain fully requires HTTPS and uses HSTS. `pshtt` uses the wonderful open source [`sslyze`](https://github.com/nabla-c0d3/sslyze) to check the low-level TLS bits. At DHS, we use `pshtt` results to assemble our HTTPS reports, which are generated by LaTeX. At GSA, `pshtt` is used as the underlying HTTP scanner in Pulse.

Here's an example of what our reports look like:

{% image "assets/blog/pshtt-post/opm-chart.png" "Chart showing HTTPS progress for the Office of Personnel Management." %}

{% image "assets/blog/pshtt-post/opm-table.jpg" "Table showing HTTPS progress for the Office of Personnel Management." %}

_(OPM has since fixed, or has plans to fix, the findings in this image.)_

## Security improves when collaboration increases

This type of cross-agency collaboration will continue in the U.S. government, with smart efforts like the [Federal Source Code Policy](https://sourcecode.cio.gov/) encouraging agencies to share code publicly and with other federal agencies. This makes better solutions possible for citizens, solutions that cost less to create and can be reused (or contributed to!) by the public.

In fact, `pshtt` is already seeing wider use: in December 2016, the [Freedom of the Press Foundation](https://freedom.press/) used `pshtt` to launch [securethe.news](https://securethe.news) to encourage news organizations to use HTTPS to secure their content from unwanted modification and to protect their readers' privacy. The Open State Foundation, a Dutch open government organization, also recently launched [pulse.openstate.eu](https://pulse.openstate.eu), which uses `pshtt` for HTTP scanning.

DHS believes system owners have an ethical responsibility to their users — especially services operated by a government on behalf of its citizens. We want systems to be free from known flaws and usable in a manner that promotes increased security. That's an outcome we intend to keep pushing toward, and our open source work on `pshtt` is an approach we'll continue to take.

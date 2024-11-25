---
title: "Tracking the U.S. government's progress on moving to HTTPS"
date: 2017-01-04
authors:
- eric
tags:
- https
- security
- pulse.cio.gov
excerpt: "The White House HTTPS policy generated significant HTTPS adoption in the U.S. government. HTTPS is now used for most web requests to executive branch .gov websites, and the government now outpaces the private sector on HTTPS."
image: /assets/blog/https-progress/white-house-https.png
hero: false
---

{% image "assets/blog/https-progress/white-house-https.png" "WhiteHouse.gov using HTTPS." %}

[HTTPS](https://https.cio.gov/faq/#what-does-https-do%3f) is a protocol to create secure and private connections to websites or services on the internet. You're using HTTPS to read this article, as indicated by the `https://` and lock icon in your browser's location bar above. Because we use HTTPS for our website, it's very difficult for anyone to modify or inspect the communication between your device and our servers. If we used plain HTTP, it would be very easy for an attacker to insert malware or tracking information into your browser. HTTPS is the [minimum baseline that users should expect]({{ "/2014/11/13/why-we-use-https-in-every-gov-website-we-make/" | url }}) from any website they visit, government or otherwise.

Recognizing this, in June 2015, the White House released [M-15-13](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2015/m-15-13.pdf), a "Policy to Require Secure Connections across Federal Websites and Web Services". This policy requires all federal web servers to [support and enforce HTTPS connections over the public internet](https://https.cio.gov/#guidelines).

This policy also requires the use of [HTTP Strict Transport Security](https://https.cio.gov/hsts/) (HSTS), which gives permission to web browsers and other clients to enforce HTTPS directly, and disables the ability for users to click through certificate warnings.

This post will look at how the government is doing in adopting these technologies. We've also published the data we used to draw these conclusions.

There's more detail and caveats below — and in particular, this focuses only on .gov domains — but the overall conclusions are:

* The White House policy generated significant HTTPS adoption in the U.S. government, to the point that **[the government now outpaces the private sector on HTTPS](#did-we-need-a-formal-https-policy)**.
* HTTPS has gone from **[a clear minority to a clear majority](#evaluating-adoption)** of support across executive branch .gov domains since the release of the policy.
* Web traffic data suggests that **[HTTPS is now used for most web requests](#measuring-overall-user-impact-using-analytics-usa-gov)** to executive branch .gov web services.
* In 2017, agencies should focus on closing gaps through the use of **[inexpensive and free certificates](#recommendations-and-data)**, and by **[preloading their domains](#recommendations-and-data)** wherever possible.

## Measuring .gov domains and subdomains

Before getting into the data, it's important to understand that there is no perfectly accurate or comprehensive way to measure HTTPS usage across the government.

This is primarily because **there is no complete list of federal domains and subdomains**. While the General Services Administration (GSA) publishes a complete list of .gov domains, this list only includes parent domains (for example, gsa.gov) and does not include subdomains (for example, 18f.gsa.gov) or .mil domains. As far as we can tell, no federal agency has a complete government-wide list of subdomains, and most individual agencies of any significant size do not have a complete central inventory of their own subdomains.

This isn't unique to the government — the internet was designed to be distributed, and managing hostnames centrally is challenging for any large organization. However, it does make measuring an HTTPS policy more difficult.

But we can still make some useful measurements. For the data in this post, we used:

* **All federal .gov parent domains**, as published in [GSA's official list](https://github.com/GSA/data/tree/gh-pages/dotgov-domains).
* **Many publicly known federal .gov subdomains**, from three public data sources: websites that participate in the [Digital Analytics Program](https://analytics.usa.gov/), certificates found in [Censys.io](https://censys.io), and URLs that appear in crawl data from the [End of Term Archive](https://github.com/end-of-term/eot2016/tree/master/seed-lists). Each of these three data sources contains a significant number of hostnames that do not appear in the other two.

We only count "live" domains and subdomains that actually respond to HTTP/HTTPS over the public internet on standard ports, at either their exact hostname or when `www.` is prefixed. Using this metric, we measure **around 1,000 live executive branch .gov parent domains**, and we measure **around 26,000 live subdomains of those domains**.

Until August 2016, all scans were performed with [Ben Balter's site-inspector](https://github.com/benbalter/site-inspector), an excellent general purpose tool to gather all kinds of information about websites. From September 2016 on, scans were performed with a new tool called [`pshtt`](https://github.com/dhs-ncats/pshtt), an [open source collaboration by the Department of Homeland Security (DHS) and GSA]({{ "/2017/01/06/open-source-collaboration-across-agencies-to-improve-https-deployment/" | url }}) that focuses solely on measuring HTTPS and HSTS behavior. We're very grateful [DHS open sourced this tool]({{ "/2017/01/06/open-source-collaboration-across-agencies-to-improve-https-deployment/" | url }}), as it improves our scans and makes our results consistent with theirs.

All federally operated web services on the public internet are in scope of the White House policy, whether they end in .gov, .mil, .us, .com, or any other suffix. However, since there is more comprehensive information available on .gov domains than on other suffixes, and the .gov suffix contains most domains belonging to most agencies, our public monitoring efforts and data are focused on federal .gov domains.

## Evaluating adoption

We measure adoption for any given web service using three metrics, in order of increasing strictness:

* **Supports HTTPS**: Whether the web service can be used over HTTPS. The service may also support insecure HTTP connections, but the service _must not_ redirect users (even briefly) from HTTPS to HTTP. Certificates _must not_ be invalid for the given hostname, but certificates may use a [non-publicly trusted or self-signed certificate authority](https://https.cio.gov/guide/#what-if-i%27m-using-a-federally-issued-certificate----such-as-from-the-federal-pki-or-department-of-defense----for-my-web-service%3f).
* **Enforces HTTPS**: Whether the web service appears to "default" to HTTPS. The service _must_ redirect users from HTTP to HTTPS. Domains used only for redirects (for example, ethics.gov to ethics.data.gov) may redirect HTTP requests directly to the destination HTTPS URL, but [_must_ support HTTPS themselves if accessed directly](https://https.cio.gov/guide/#what-about-domains-that-are-only-used-to-redirect-visitors-to-other-websites%3f).
* **HSTS**: Whether the web service allows clients to automatically enforce HTTPS by setting a [strong HSTS](https://https.cio.gov/hsts/) policy. The `Strict-Transport-Security` header must be served over HTTPS, and must set a `max-age` of at least 1 year.

Each metric is a significant step in security and operational progress, and HTTPS enforcement is most complete when doing all three.

For "parent" federal .gov domains (for example, gsa.gov), we have 18 months of scan data, taken roughly weekly, from June 2015 through January 2017. For subdomains (for example 18f.gsa.gov), we only began measuring from the above sources recently, so we're only using data from the most recent snapshot.

Over the last 18 months, HTTPS and HSTS implementation among parent .gov domains has gone up substantially, with the use and enforcement of HTTPS moving from a minority to a majority:

{% image "assets/blog/https-progress/chart-1-https-parent-domains.png" "HTTPS among "parent" .gov domains in the executive branch moved from around 30% to around 75%." %}

In particular, HSTS use among .gov domains was almost non-existent (2%) before M-15-13, and most or all of that was from [an 18F effort in February 2015 to preload the first 20 .gov domains]({{ "/2015/02/09/the-first-gov-domains-hardcoded-into-your-browser-as-all-https/" | url }}). HSTS is now present on almost half (43%) of live executive branch parent .gov domains.

Though we don't have time series data for subdomains, we can compare a snapshot of where the approximately 1,000 parent domains and a sizeable collection of approximately 26,000 subdomains ended up on December 31, 2016:

{% image "assets/blog/https-progress/chart-2-https-all-domains.png" "HTTPS usage as of December 31, 2016 for .gov parent domains and subdomains in the executive branch." %}

When broadened to include subdomains, the numbers are lower than when only measuring parent domains. This is likely in part because identifying parent domains is much easier (even inside an agency), and in part because most agencies have a "long tail" of unused, abandoned, testing, or staging subdomains.

This is an important point, because not all web services are equal. If the goal is to increase the number of secure connections to federal services, it's a bigger deal if whitehouse.gov or aids.gov use HTTPS than if little old 18f.gsa.gov supports HTTPS. Also, some subdomains that appear in this dataset are unmaintained or misconfigured, or just lead to an error page of some kind. While these subdomains should use HTTPS too, we should also try to consider overall user impact.

## Measuring overall user impact using analytics.usa.gov

It would be very difficult to go through 26,000 subdomains and try to pick apart which are more important or "real" than others. However, one thing we can do is look at data reported by the Digital Analytics Program on [analytics.usa.gov](https://analytics.usa.gov/) to get a sense of whether we're securing the domains that drive most federal web traffic.

The Digital Analytics Program (DAP) is a central analytics collector for participating federal websites. Since the program's launch in 2012, thousands of websites now participate, and it was recently made an executive branch requirement as part of a [new White House policy](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2017/m-17-06.pdf). DAP publishes **a lot** of [data about the federal government's web traffic](https://analytics.usa.gov/data/), and among them is [a list](https://analytics.usa.gov/data/live/all-domains-30-days.csv) of how many visits are received by participating websites that get at least 1,000 visits over a 30 day period (about 33 visits a day).

As of right now, that list has about 1,700 "live" federal websites that use a .gov domain, and those 1,700 websites received 475 million visits over the last 30 days.

When we break out how many of those visits went to sites that use and enforce HTTPS and use an HSTS policy, the numbers are much higher than if we just measured all subdomains without weighting by traffic:

{% image "assets/blog/https-progress/chart-3-https-by-web-traffic.png" "HTTPS usage for .gov domains in the executive branch when measured by amount of web visits." %}

Of course, this isn't a complete dataset either — none of these are. And each one of them points to more work for federal agencies to do to eliminate the use of insecure connections to their services.

But taken together, these datasets suggest very significant progress on the part of the executive branch, and it's likely that a clear majority of web traffic to executive branch .gov domains is now encrypted.

## Recommendations and data

As agencies continue implementing HTTPS in 2017, we recommend they focus on a couple of key areas that GSA has observed as greatly helping agencies improve their HTTPS posture:

* Authorizing and encouraging the use of [domain validated (DV) certificates](https://https.cio.gov/certificates/#what-kind-of-certificate-should-i-get-for-my-domain%3f). These certificates can be obtained cheaply or for free, and are generally more amenable to automation. In our experience, expensive "extended validation" certificates offer little to no actual security benefit for federal agencies, and significantly increase the bureaucratic friction to securing connections to agency services.
* [HSTS preloading](https://https.cio.gov/hsts/#hsts-preloading) as many of their domains as feasible. This means setting a specific HSTS header at the root domain (for example, [https://18f.gov](https://18f.gov)) that covers all subdomains, and then [submitting it for preloading](https://hstspreload.org/) by all major browsers. This will automatically mark all subdomains of the preloaded domain as compliant, and is the most complete HTTPS protection available. [OMB recommends this approach](https://https.cio.gov/guide/#options-for-hsts-compliance) wherever possible.

You can download [all the data we used to make these charts](https://github.com/GSA/https/tree/master/compliance/data) as spreadsheets, and [the Python scripts we used to analyze the data](https://github.com/GSA/https/tree/master/compliance).

You can also [see some additional charts we didn't have room for in this post](https://github.com/GSA/https/pull/223#issuecomment-270268431) that use more HTTPS data from [pulse.cio.gov](https://pulse.cio.gov/https/agencies/).

## Did we need a formal HTTPS policy?

One question worth asking is: Would this progress have happened anyway, even without the White House policy? There's been a lot of momentum around "HTTPS everywhere" on the broader web during this time, so did the government need to introduce the overhead of a top-down policy effort?

It seems clear from the data on U.S. government and the broader internet that the HTTPS policy was essential to achieving this level of improvement.

From a data perspective, HTTPS/HSTS use in the U.S. government looks to have outpaced the broader internet.

When looking at adoption across domains: [Mozilla's April King analyzed the Alexa Top 1 Million domains](https://pokeinthe.io/2016/11/14/state-of-security-alexa-one-top-million-2016-11/) in October 2016 and observed "Supports HTTPS", "Enforces HTTPS", and HSTS numbers of about 33%, 13%, and 3% respectively — numbers that are right about where the government began when the HTTPS policy was first introduced in summer 2015.

When looking at volume of web requests: [Mozilla reports usage statistics from Firefox](https://ipv.sx/telemetry/general-v2.html?channels=release&measure=HTTP_PAGELOAD_IS_SSL&target=1&absolute=0&relative=1) across all platforms showing HTTPS requests as a bit under 50% of traffic. [Google reports usage statistics from Chrome](https://www.google.com/transparencyreport/https/metrics/?hl=en) showing HTTPS requests on Android and Windows — the most dominant Chrome platforms by an order of magnitude, according to [analytics.usa.gov data](https://analytics.usa.gov/data/live/os-browsers.csv) — as 45% and 53%, respectively. While the government doesn't have the same kind of telemetry available, data from analytics.usa.gov suggests the government is exceeding these numbers.

From GSA's experience at directly assisting agencies with their HTTPS implementation, it was very clear that agencies were responsive to the policy and to its supporting monitoring efforts from GSA ([pulse.cio.gov](https://pulse.cio.gov)) and DHS ([direct reports]({{ "/2017/01/06/open-source-collaboration-across-agencies-to-improve-https-deployment/" | url }}) sent to agency Chief Information Security Officers). The breadth of federal staff involved in HTTPS implementation increased dramatically after the policy was issued, and we fielded numerous technical questions tied directly to improving GSA or DHS monitoring results.

And finally, the sharp uptick in December (especially for HSTS) shows that the government, like many things made of humans, needs a deadline to get things done. The HTTPS policy provided that deadline, along with enthusiastic assistance from GSA and DHS during the implementation process. That assistance will remain as agencies continue to close gaps over 2017, and work to eliminate remaining insecure connections their services make to federal staff, citizens, and the rest of the US government's many users.



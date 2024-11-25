---
title: A look at complex data in USEITI
tags:
- useiti
- open data

authors:
- boone
excerpt: "We've been working with the Office of Natural Resource Revenues on implementing the global Extractive Industries Transparency Initiative (EITI) standard, which includes all kinds of data. One new data point we have this year is the federal production number: The amount of a given resource produced on federal lands."
description: "We've been working with the Office of Natural Resource Revenues on implementing the global Extractive Industries Transparency Initiative (EITI) standard, which includes all kinds of data. One new data point we have this year is the federal production number: The amount of a given resource produced on federal lands."
image: /assets/blog/eiti/minot.png
hero: false
---

Of the dozens of offices in the government that deal with natural resources, the Office of Natural Resource Revenues (ONRR, pronounced “honor”) is responsible for implementing [the global Extractive Industries Transparency Initiative (EITI) standard](https://eiti.org/eiti/implementation). A few weeks ago, we wrote about [the work that lies ahead]({{ "/2015/11/02/useiti-what-we-learned-where-were-headed/" | url }}) for the USEITI project. We’re working with a lot of data and finding the best way to present it to the world. One new data point we have from ONRR this year is the *federal production number*: The amount of a given resource produced on federal lands.

The "federal production number"
-------------------------------
<figure>
  <img src="{{ site.baseurl }}/assets/blog/eiti/minot.png" alt="Photo of Minot, ND with an oil well icon from the USEITI project superimposed." />
  <figcaption><em>Minot, ND. photo by <a href="https://en.wikipedia.org/wiki/User:Bobak">Bobak Ha'Eri</a>. Licensed CC 3.0, BY-SA. Pumpjack graphic <a href="https://thenounproject.com/term/oil/42474/">by hunotika from the Noun Project</a>. Licensed CC 3.0, BY-SA.</em></figcaption>
</figure>

Let’s imagine you live in Minot, North Dakota. You’ve probably heard about an oil boom in your state, in fact, you might even know some people involved in the industry in your county. There’s a good chance that some of the money made in that boom is going back to federal, state, local, and tribal governments, and we’ve historically known exactly how much that is. What we haven’t known before was how much federal oil was actually produced.

In 2013, nearly $181 million in royalties were paid on oil produced on federal lands in North Dakota. If we know how much we made, we could just divide that by how much we paid per barrel and know how much was produced, right? It turns out to be a little more complicated than that.

Sales numbers don’t account for things like any product lost in transit or used on site. So some data were missing; there might be a statistical way to calculate the difference, but there was also a reporting problem.

Reporting production levels
---------------------------

Drilling for oil, mining for coal, or retrieving other natural resources are called *extractive industries*. When companies use federal lands to do it, they need to take out a lease. Much like an apartment, the lease is permission to use the land for a specific period of time and purpose. As part of the lease, they pay rent to the federal government just like you’d pay rent to a landlord. Before any work begins, they also pay out a reclamation bond, money the company will get back after they finish development and restore the land according to the law.

In order to produce and sell natural resources on that land, though, companies negotiate agreements with federal, state, and local authorities. The resources came out of public land, so some of the money made off those lands goes back to the public. This is called a *royalty*. Agreements can cover many different leases, and the portion of production that comes from federal lands changes whenever a lease is added or removed. New leases can be added every month, so the federal portion of production, then, can change monthly.

At the end of each month, ONRR reports revenue according to the split, but production is reported as a single number – 300 barrels of oil, 10 tons of coal – for the entire agreement. Since royalties get broken down differently than production volume, inferring production from sales is a poor estimate but until recently, the only one we had.

Arriving at the federal production number, then, meant going back to the beginning and reporting production more accurately for every agreement going forward. “Production data is the start of where the money comes from," said ONRR’s Jon Swedin. Eventually people across the U.S. Department of the Interior rallied around that idea and now, after several years of work, ONRR will publish federal production as part of the 2015 USEITI report.

Designing for production data
-----------------------------

Now that we have that information, USEITI and 18F’s job is to figure out how to take it (and a lot more) and show it to the world. We’re working with datasets from many different sources and each is unique and must be handled differently. To better understand the “shape” of each set, the team made a [data catalog](https://github.com/18f/doi-extractives-data/wiki/Data-Catalog) that breaks each one down to understand where it comes from, what it tells us, and how it’s reported.

Revenue and production data, for example, look very similar: They’re broken into the same geographic areas, have similar properties (like the production year and name of the commodity), both are reported down to the county level, and they have a common source. After cataloging them, we learned that federal production and revenue data were different enough that they couldn’t be served by the same interface.

The difference: Revenue has a common unit, U.S. dollars. Every revenue report has how many dollars were paid by the company. This means that without any interaction you can say: “Here’s the total amount of money brought in across *the entire natural resource industry* in 2014,” and that means something. You can’t do that with production data because every resource is reported in different units.

Why even bother publishing the production number anyway? Well, for one, people wanted it. Whenever ONRR published revenue numbers, people would often use it as a proxy for production numbers. But there’s another reason that takes us back to Minot. That oil boom? Some of that money is made on land that belongs to you and other residents of your county, state, tribe, and country. Natural resources are an important part of the national debate right now, even more so in communities impacted by extractives industries. You deserve to know how much is being taken out of the land to be an active and informed participant in that debate.

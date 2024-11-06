---
title: "The 18F engineering sandwich for cloud based web apps"
date: 2022-09-06
authors:
  - alex-bielen
  - laura-gerhardt
tags:
  - open source
  - how we work
  - application development
excerpt: "We often talk about 18F Engineering as a technology shop, but that's too broad. There are very few technology choices we actually make at the project level. When we build, we usually build open-source cloud-based web applications. We combine a limited set of technologies to make our applications. To explain this, we'll use the metaphor of a sandwich shop."
image: /assets/blog/eng-sandwich/image1.png
image_alt: "A line drawing of a hoagie sandwich topped with an olive on a toothpick"
---
We often talk about 18F Engineering as a technology shop, but that's too broad. There are very few technology choices we actually make at the project level. When we build, we usually build open-source cloud-based web applications.

We combine a limited set of technologies to make our applications. To explain this, we'll use the metaphor of a sandwich shop.

{% image "assets/blog/eng-sandwich/image2.png" "Three groups of food: bread, protein, and toppings" %}

## Bread: cloud-based application hosting
{% image "assets/blog/eng-sandwich/image4.png" "A baguette and a slice of sandwich bread" %}{.float-left .padding-right-2 .padding-bottom-2}

Bread represents commercial or government cloud hosting options. We use cloud computing to be [agile and resilient]({{ "/2019/02/07/the-cloud-is-not-a-virtue/" | url }}) and so that we can integrate security with our development. We host several of our applications on a government cloud provider called [cloud.gov](http://cloud.gov) which [meets many compliance requirements](https://cloud.gov/docs/compliance/ato-process/). We also have experience using our partner agencies' commercial cloud providers.

## Protein: open-source programming languages
{% image "assets/blog/eng-sandwich/image3.png" "Chicken, steak, and tofu to represent protein" %}{.float-left .padding-right-2 .padding-bottom-2}

The protein is what makes our sandwich tasty. These are the open-source programming languages with which we have experience. We use well-supported open source languages with active communities, which helps us to ensure security support, develop language-specific practices, and write reusable code. These days, we develop mostly in Python, Ruby,  and JavaScript. We also have some experience developing with C# in the .NET Core ecosystem.

Our commitment to open source languages and tools allows us to work in the open, and help ensure public input to our work.

## Fillings and condiments: features driven by user needs
{% image "assets/blog/eng-sandwich/image5.png" "Mustard, chili pepper, and tomato to represent toppings" %}{.float-left .padding-right-2 .padding-bottom-2}

What really makes a sandwich great are the fillings and condiments that meet individual preference and taste. In our metaphor, they represent application features that are based on the user needs we have discovered through research. The most common features we implement are user interfaces that are specific to our partner agencies' needs. We often integrate authentication, authorization, and user management. We frequently connect to notification services to send email to users. Sometimes we build integrations to transfer data to existing systems.

## Sides: other services

Together, these technologies make up most of the 18F Engineering "sandwich": cloud-based open source applications. But sometimes a side of chips or potato salad can make the meal complete. Some "sides" that we serve include data migration or the use of [Cloud.gov Pages](https://federalist.18f.gov/cloud-gov-pages/) (formerly known as Federalist) static sites for content-heavy websites.

## Why is "our menu" important?

By having a core menu, we enable developer efficiency and flexibility. We can use our existing [programming languages](https://engineering.18f.gov/language-selection/) practices and [tools for running our applications in the cloud](https://engineering.18f.gov/integrations/). It's important to note that we do not dictate any particular technology, though, since any particular choice might be inappropriate for the specific problems we encounter in our work.

Another consideration is our hiring materials. We've developed these around our technology choices and we have specific examples of "what good looks like" for the programming languages and methodologies that we support. We look for candidates with strengths in at least some of our core technology choices, and who have solid experience developing modern web applications on cross-functional teams. For example, here’s our [engineer job post from early 2022](https://join.tts.gsa.gov/join/tts-engineer/).

We'd prefer not to work too far outside our areas of expertise, but if an agency partner needs help in those spaces, we usually can consult with them to help them find a restaurant that serves the menu they need and can serve food in the timeframe and delivery path that 18F recommends.

We encourage you to take a look at our [open-source repositories](https://github.com/18F) and [hiring materials](https://eng-hiring.18f.gov/) to see if there's work you can reuse or develop further.

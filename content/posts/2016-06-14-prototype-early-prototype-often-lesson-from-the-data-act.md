---
title: "Prototype early, prototype often: A lesson from the DATA Act"
date: 2016-06-14
authors:
- boone
tags:
- data act
- agency work
- treasury
- agile
excerpt: "The DATA Act is a “tremendous undertaking …[to] standardize how federal agencies report their spending data.” It has the potential to provide unprecedented insight into how the federal government spends money, and it comes with a statutory deadline. Any delay in implementation is a delay in cost savings and transparency, so we’re trying to help the government deliver on the promise of the DATA Act in a timely manner."
description: "Developing and early prototype for the DATA Act with the Treasury Department has helped keep the project on track to deliver on the promise of the DATA Act in a timely manner."
image: /assets/blog/data-act-implementation/logo.png
hero: false
---
A lot of people ask us how our projects save money. It’s a tricky question to answer because often, the benefits of improved digital services are efficiencies for federal employees, more flexible decision making, and a greater ability to achieve your mission. Each of these benefits are difficult to quantify, but can have a positive impact on government. Our work with the [Digital Accountability and Transparency Act (DATA Act)](https://www.usaspending.gov/Pages/data-act.aspx) is a good example. The DATA Act is a [“tremendous undertaking …[to] standardize how federal agencies report their spending data]({{ "/2016/03/15/treasury-and-the-data-act-full-of-sunshine/" | url }}).” It has the potential to provide unprecedented insight into how the federal government spends money, and it comes with a statutory deadline. Any delay in implementation is a delay in cost savings and transparency, so we’re trying to help the government deliver on the promise of the DATA Act in a timely manner.

About a year before the law is due to be implemented, Treasury will be able to accept data from agencies. There are many reasons why, but a significant one is the process Treasury and 18F took to launch early with a prototype broker that was flexible enough to adjust to user needs and policy questions. In the words of Deputy Assistant Secretary for Accounting Policy and Financial Transparency of the Treasury, Christina Ho, the project “has made great progress and we are on our path to realize the significant benefits intended by DATA Act in the areas of transparency, innovation, federal financial management, just to name a few. I firmly believe that the taxpayers will be pleased with quality of the work.”

## Prototyping instead of waiting

[We’ve written before about our work on the project]({{ "/tags/data-act/" | url }}), and several of our 18F teammates have spoken about the work we’ve done to help implement this law. Time is an underrepresented factor in discussions of government projects like this. Decisions need to be made, and when you’re trying to coordinate multiple agencies with different systems and different priorities to do something they’ve never done before, that can take a while.

{% image "assets/blog/data-act-implementation/logo.png" "The DATA Act Logo" %}

Despite that, Kaitlin Devine, the product owner on the DATA Act implementation team, said “the team, a blend of 18F staff, contractors, and Treasury employees, is moving very fast compared to similar projects of comparable size.” Early on, when the team was much smaller and important decisions were still in flux, the team chose to build a working prototype that was flexible enough to change with the data standard. The prototype was a “data broker” that could take in spending data, validate it, and convert it into a standard format. With the broker in place, policymakers at Treasury could refine the standard and start testing data from agencies early to make sure it’d work with the system, and the team could focus on important use cases without getting distracted by edge cases. Without the broker, the development team would have spent a lot of time sitting on their hands until all the policy decisions were finalized.

## Reducing risk through flexibility

Data standards are hard: Computers can read data in specific formats like XML, JSON, or CSV, but in order for them to be useful, the files need to be written according to a single specification. As a developer, you can define that in advance in what’s called a schema. Since we didn’t know exactly what the data looked like ahead of time, the team decided to make the data broker’s schema flexible and editable by non-technical people, so as the official DATA Act standard – written by Treasury officials working with participating agencies – changed over time, we could keep iterating.

“The 18F prototype allowed actual data to drive feature development of both the schema and the application,” Devine said. This flexibility allowed us to work out technical problems while refining the data standard and “saved us months, maybe years, of learning some of these early lessons the hard way.” In addition to informing May’s milestone 1.0 release of the [DATA Act Schema](http://fedspendingtransparency.github.io/data-model/), those lessons also informed our prototype’s successor: the [official version of the DATA Act broker](https://github.com/fedspendingtransparency/data-act-broker-backend), released in alpha a few weeks ago.

<figure class="align-left">
	{% image "assets/blog/data-act-implementation/persona.png" "The persona for an investigator according to the DATA Act team." %}
	<figcaption>A persona of a potential user of the DATA Act. The team used personas like this to keep users in mind while working on the DATA Act implementation.</figcaption>
</figure>

18F worked closely with Treasury’s DATA Act program management office to implement the DATA Act, which involved more than just the code powering the applications. In addition to the development and design work, we conducted a discovery sprint to better understand the user needs for the flagship product, [usaspending.gov](https://www.usaspending.gov). Our acquisition team helped Treasury understand how to attract agile, user-centered vendors in their Requests for Proposals. The 18F Writing Lab helped organize and improve the documentation for the prototype. We also conducted workshops about agile product development for various groups at Treasury and helped foster a community around the open source products.

Treasury took advantage of nearly every service we could offer them, all with the goal of getting this policy initiative right the first time. Some of that was writing code, but much more important was understanding the problem deeply and working with Treasury, vendors, and the public to build the solution that best meets user needs and the goal of improving transparency of government spending. In Deputy Assistant Secretary Ho’s words: “Because of 18F, the DATA Act implementation has taken so many groundbreaking steps in how we approached this high profile and transformational initiative.”

The statutory deadline is less than a year away, and we will continue to work with Treasury to help them get to a successful launch, ensuring the product meets user needs from the start. Want to help the team move forward? [Treasury launched an open beta of the new USASpending.gov in November 2015, head there and send the team your feedback today](https://openbeta.usaspending.gov/).

[{% image "assets/blog/data-act-implementation/usaspendingbeta.png" "Screenshot of the USASpending.gov open beta." %}](https://openbeta.usaspending.gov/)

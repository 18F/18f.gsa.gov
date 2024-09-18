---
title: "Why discovery research matters for modular procurement"
authors:
- colinmacarthur
- rebecca-refoy
- aaron-burk
tags:
- forest service
- agile bpa
- acquisition services
- procurement
excerpt: "The Technology Transformation Service (TTS) has been working with the Forest Service since August 2016 on what will eventually be an agency-wide system to process permit applications. TTS is primarily helping the Forest Service hire private vendors for this work, rather than building it ourselves, and one way we’re improving that process is through “discovery research.” "
---

*Rebecca and Colin work here at TTS on our Acquisitions team. Aaron Burk is a Senior Project Manager at the Forest Service and the Product Owner for our engagement.*

The Technology Transformation Service (TTS) has been working with the Forest Service since August 2016 on what will eventually be an agency-wide system to process permit applications. TTS is primarily helping the Forest Service hire private vendors for this work, rather than build it ourselves, and one way we’re improving that process is through “discovery research.”  
 
## What’s discovery research?

[Discovery research](https://methods.18f.gov/discover/) is a process used to better understand what people need from a product or service. It incorporates interviews, observations, and other methods of information gathering. Sometimes discovery research focuses on an initial prototype; sometimes it’s more open-ended. It can be helpful on all kinds of projects, but it’s particularly useful when your team is using modular procurement to purchase a new product or service. 
 
## What’s modular procurement?

[Modular procurement](https://modularcontracting.18f.gov/modular-procurement/) breaks traditionally large, monolithic contracts into several shorter-term, lower dollar amount contracts. This makes development easier in two ways: it segments risks and encourages greater project visibility by having more frequent deliveries. Segmenting risk means that if one piece of a project fails, the other parts can still succeed. Because each unit is smaller, they’re easier to comprehend and manage, making problems and risks smaller so you can recognize and resolve them more easily. Greater project visibility helps build trust between the government team and the vendor so everyone knows the project is headed in the right direction.
 
## When to start a modular procurement with discovery research

Our engagement with the Forest Service is part of our [Agile Blanket Purchase Agreement (BPA) work](https://github.com/18f/ads-bpa), but we’ve handled this one a little differently. Instead of jumping straight into buying modules to help the Forest Service with their permitting system, we started with discovery research. We don’t start all our Agile BPA projects this way, but several elements of this project led us to suggest a discovery period:
 
- The system was going to serve many different groups of users. It also had to integrate with more than two systems.
- We walked away from our kickoff workshops with a good sense of the problem, but needed to understand more to pinpoint how our work would fix it.
- As a multi-buy project, we wanted to work especially hard to build common understanding about the problem space and purpose of our work with the Forest Service.
- We also realized that much of the work to be done wasn’t buying code, but tackling broader problems in policy, business process, legacy systems, and infrastructure. This discovery let us identify and surface those challenges.
 
## What we did

We started by [conducting interviews with Forest Service staff](https://github.com/18F/fs-online-permitting/blob/master/docs/round1-findings-reccomendations.pdf) who are involved in permitting. We showed them a [prototype for a particular type of permit](https://github.com/18F/forest-service-prototype), while leaving other conversations wide open. Ultimately, we settled on the permits that allow people to cut down a Christmas tree from a national forest, because of the simplicity of that permitting process. By way of research, [we observed Christmas tree permitting in action](https://github.com/18F/fs-online-permitting/blob/master/docs/christmas-tree-permitting-options.pdf) at two forests and talked to people obtaining Christmas trees.
 
We focused on “end users” or people who, as members of the public or the Forest Service, were on the ground using our software. We didn’t ignore higher-level policy makers or experts, but made sure that our work focused on end users. You can [read more about our approach in our project’s GitHub repository](https://github.com/18F/fs-online-permitting/wiki/Introduction). 
 
## What we found
When we started, we held workshops with our pilot forests — Mt. Baker-Snoqualmie for special uses and Shoshone, Araphoe-Roosevelt, Mt. Hood, and Flathead National Forests for Christmas trees — to align on the direction of the project. At that time, we understood the permitting problem across all permits to be that the Forest Service was not providing “modern” services to the public to facilitate access and connection to public lands. 
 
We based our discovery work on assumptions that we heard from Forest Service staff. Below are these assumptions and our findings based on our research.
 
#### Assumption: It takes a lot of time for Forest Service staff to prepare for, reconcile and report on Christmas tree tag sales. 
**Finding**: Confirmed. Based on our observations, we estimate that each frontline supervisor spends 5–8 hours per week on these processes, in addition to the time they spend selling any Christmas tree permits. Although the public transaction is brief (less than two minutes), the back-end processes are duplicative and time-consuming.
 

#### Assumption: When issuing Christmas tree tags takes a long time, the Forest Service staff involved can’t focus on other worthwhile activities, like public outreach and forest patrol. 

**Finding**: Confirmed. Forest Service staff in all our interviews spoke about decreased time in the field and time for outreach to surrounding business, which serve visitors.
 
#### Assumption: People are frustrated with the current hours and availability of Christmas tree permits.

**Finding**: Challenged. We didn’t find much evidence that customers are unhappy with the current hours and availability of Christmas tree permits. That doesn’t mean they wouldn’t like the ability to purchase permits elsewhere at other times; but it’s not a big source of frustration now. The public tends to be more confused about learning the basics of Christmas tree permitting: where they are allowed to cut, where permits can be purchased, etc.
 
#### Assumption: Christmas tree and outfitter/guide ePermitting are solving different problems. Therefore, we should think of them as two separate projects with two separate visions.

**Finding**: Challenged. Customers are frustrated by the speed, complexity, inconsistency, and legacy systems of the “back office” processes involved in both the Christmas tree and outfitters/guides permitting processes. While frustration surfaced quickly in our Christmas tree workshop, similar frustration with the outfitters and guides only surfaced after longer communication. 
 
#### Assumption: Outfitter/guide permittees don’t feel like they receive good or consistent customer service from the Forest Service.

**Finding**: Challenged. This assumption was partially true. Permittees certainly feel that the process is drastically different from district to district and forest to forest. But they typically don’t feel like that’s the fault of the Forest Service staff they work with. Rather, they feel those staff are trapped within a “ridiculous” system they’re trying hard to implement.
 
## What did we get from our investment in upfront discovery research?

By spending time talking to users, getting feedback on prototypes, and observing the process in action, we were able to identify a clear a set of priorities for our project. Our research also highlighted technical and bureaucratic challenges and needs that the final product must address to ensure a positive user experience. 
 
Discovery research was also essential in defining the modules in modular contracting. When we imagined a full user experience together, we were able to break it down into modules and determine a process order. Even though our modules will change as we build and learn, our discovery research offered us a place to start.
 
By having the Forest Service work alongside us during the discovery part of this project, they were able to see that the recommendations we were making were based on feedback from users, which built a huge amount of trust. Additionally, by working with the Forest Service to determine the modules we were able to zero in on specific areas of processes that could be improved. This demonstrated the value of using discovery research together with modular procurement to identify and address specific challenges affecting end users and Forest Service staff.
 
_This is the first post in a series of three. Be on the look out for the next two posts._

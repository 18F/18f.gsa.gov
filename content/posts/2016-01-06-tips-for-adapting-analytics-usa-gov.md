---
title: "Tips for adapting analytics.usa.gov from Tennessee, Boulder, and
Philadelphia"
date: 2016-01-06
authors:
- melody
tags:
- open government
- analytics.usa.gov
- interview
- tools you can use
- lessons learned
excerpt: "The city of Philadelphia, the city of Boulder, and the Tennessee Department of Environment and Conservation have all adapted analytics.usa.gov for their own use. We recently talked to them about how they adapted the platform and what advice they’d have for others who'd like to do the same."
description: "The city of Philadelphia, the city of Boulder, and the Tennessee Department of Environment and Conservation have all adapted analytics.usa.gov for their own use. We talked to them about how they adapted the platform and what advice they’d have for others who'd like to do the same."
image: /assets/blog/dap/screen.png
redirect_from:
-  /2016/01/05/tips-for-adapting-analytics-usa-gov/
---

When [we launched analytics.usa.gov]({{ "/2015/03/19/how-we-built-analytics-usa-gov/" | url }}) with the [Digital Analytics Program](https://www.digitalgov.gov/services/dap/), the [U.S. Digital Service](https://obamawhitehouse.archives.gov/digital/united-states-digital-service), and the White House last March, we purposefully made it very easy to adapt and wrote language on the website to let people know they could use the code without restriction:

> This open source project is in the public domain, which means that this website and its data are free for you to use without restriction. You can find the [code for this website](https://github.com/GSA/analytics.usa.gov) and the [code behind the data collection](https://github.com/18F/analytics-reporter) on GitHub.

And a few governments have done just that: the [city of Philadelphia](http://analytics.phila.gov/), the [city of Boulder](https://bouldercolorado.gov/stats), and the [Tennessee Department of Environment and Conservation](http://analytics.tdec.tn.gov/).

I reached out to **Lauren Ancona**, the Senior Data Scientist for the City of Philadelphia’s Office of Innovation and Technology (OIT); **Ron Pringle**, a Senior PHP Application Programmer Analyst for the City of Boulder; and **Cody Rockwood**, a project manager in the Information Systems Division of Tennessee’s Department of Environment and Conservation, to see how they adapted the platform for their respective organizations and what advice they’d have for others who would like to do the same.

**MK: We saw your tweets about adapting the analytics dashboard to create one for your respective organizations. How did you hear about the dashboard and what did you do to adapt it?**

**LA:** My previous career as a marketer involved heavy work with analytics, so I’d actually been “stalking" the project during its development phase on GitHub for several months. Once it launched, I got in touch with the maintainers with some questions about the analytics configuration. They were very supportive and actually merged some of my feedback, and eventually ended up letting me come on as a project maintainer for the [analytics-reporter repo](https://github.com/18F/analytics-reporter). That, frankly, blew my mind: a federal agency is incorporating feedback from a local government using their tool on an ongoing basis. We were able to bring up a few simple tweaks that made it easier to adapt.

**RP:** I heard about the analytics dashboard from a number of sources almost simultaneously. I follow a lot of 18F and Code for America folks on Twitter so I’m sure I saw it tweeted about there. I was also working with Becky Boone, our Code for America Senior Fellow at the time, on some analytics-related work. She brought it to my attention as well.

Working with Becky, we tried out a number of different dashboard solutions, including Code for America’s real time dashboard. Even though we got that up and running fairly quickly, I still felt there was value in integrating or emulating the 18F dashboard as part of our custom CMS, Xpress, that we co-developed with another Colorado city. I took some time over the summer to go through the federal dashboard code on GitHub. Because Xpress is PHP-based and modular, ultimately I decided to emulate the dashboard in PHP as a module specifically for Xpress. I rolled the work into a major upgrade already planned for late summer and we pushed it live in early fall of 2015.

**CR:** Analytics.usa.gov came across in one of our feeds. The discovery was well timed, as my team had been working with D3.js building infographics on our intranet. We were looking for ways we could do more. We decided pursuing this project would be a great way to provide the department with a new tool.

We spent 3 weeks pulling the project together, finding our way through D3.js, and learning to build intelligent graphs. From there, it was just getting the reporter running on our server and refining the interface. The whole thing was a “guerrilla" type project where we created it and deployed it under the radar. Then we said “Look what we built!" Our department leadership loved it.

**MK: What are you using your dashboard for? What has the response been?**

**LA:** We’re using it in much the same way the federal government is; a place where anyone curious about the way city content is being used, how often, and what kinds of technology they’re using (in aggregate). In my department (OIT), we frequently refer to it when discussing things like supporting legacy browsers or device types.

**RP:** The initial rollout of the dashboard was for internal use only. We made a stats page available to Xpress content managers to help them make better data-driven decisions about the content they’re curating on the City of Boulder website.

We’d always intended to make it public as well, so after some code refinement, we pushed out the public version about a month later. Since then, we’ve added a lot more to the content manager dashboard. It now allows stats by category and includes metrics on social media, search, content manager usage and more. Again, this is to help content managers make better decisions about content based on data. Putting this directly into the administrative section of the CMS makes this information available exactly at the place they’re most likely to use it. We’ve gotten very positive feedback from our content managers. We plan on pushing most of these new features to the public dashboard as well.

**CR:** The goal for Tennessee State Government is to become more “efficient and effective." One of the ways we’re doing that is to make more data-driven decisions. Before this product launched, we were already sending out monthly reports for our analytics. By providing this on-demand dashboard, we put more power in the hands of our colleagues working in our regulatory divisions. This can help our department better understand how our users are interacting with us on a day-to-day basis. That will lead to us making better decisions.

The response to the launch has been great. Our department has increased use of our web statistics since we started tracking them 3 years ago.

With this dashboard at their fingertips, they’re anxious to see more. We’re discussing other possibilities as well. We’ve already had requests to be able to narrow data or do custom “on-demand" searches. We’re hopeful we’ll be able to extend the functionality to include these requests soon.

**MK: Do you have any advice for other state or local governments who might want to adapt the platform?**

**LA:** The front- and back-end pieces are fairly straightforward for even a junior developer to deploy — if there is one on staff. I was not a developer, but managed to cobble our version together with lots of support from Eric Mill at 18F and several of my coworkers. Luckily, one of the first things our [alpha.phila.gov](http://alpha.phila.gov/) team built was a [pattern portfolio](http://cityofphiladelphia.github.io/patterns/), which made my life *much* easier when adapting the appearance to match our other work.

But more important than how you might adapt the platform for your government is *having cohesive analytics data to put in it.* For the most part, the government use-case is pretty consistent across the board — a configuration that works for one is likely to work almost anywhere. We’re working on [documenting and sharing ours](https://github.com/laurenancona/unified-analytics).

**RP:** Just do it! This was essentially a skunkworks project for us. We floated the idea at one of our monthly content manager meetings and got positive vibes from that but otherwise there was no mandate to do this. If you can, adapt the existing code. It makes more sense to piggyback off of someone else’s work when you can. Google has a great online API tester that allows you to test out any additional API calls you want to make as well. It helped me a lot when we decided to expand usage to other stats.

And finally, keep it simple and iterate. We ended up using Charts.js instead of D3 because what we needed to display was pretty simple. It kept the project light. We also cache the data just like the 18F dashboard because it reduces load on the API calls and because we plan on adding the data to our open data catalog. The cached CSVs will serve as the source for the open data entries as well.

**CR:** My main advice, is just go for it. 18F has done a fantastic job with documentation and using open-source technology to help make this platform come together.

The benefits of this project have more than warranted spending the time implementing it. For TDEC, providing this information has helped open up the door to better conversations around how and why we spend our efforts supporting our customers via our various digital services.

**MK: Is there anything 18F could do to improve the platform?**

**LA:** A 1-click deploy from GitHub to a PaaS like Heroku (where ours is currently hosted) or a Docker container — there was an abandoned PR where someone was working on this — (or perhaps [cloud.gov](http://cloud.gov/) in the future?) — would make the process simpler, I imagine. You can do this now, in fact — if you already understand the technology at work. But I think there are just a few tiny gaps we could close that would make it even easier.

**RP:** More, better documentation. I’ve found that most developers make a lot of assumptions about baseline knowledge of anyone attempting to adapt or emulate their work. Because the dashboard strikes me as something even non-technical people might want to try to implement, better documentation is always going to help.

**CR**: Outside of extending existing functionality, the platform and documentation are great.

We’re looking at trying to extend some of the reporting functionality. Being able to filter stats according specific pages (or groups of pages) would be hugely beneficial for divisions within TDEC. I’m sure that need is not unique. Additional or customizable reporting would be incredible.

**MK: Anything else you want to add?**

**LA:** I understand how hard it is to find time to think about implementing web analytics when you’re probably dealing with emergencies, old hardware, older software, lack of support or understanding of the potential for better service this kind of information can bring. And just getting the tracking code installed across many (sometimes siloed) sites is a challenge. So I'm packaging up [a version of our configuration](https://github.com/laurenancona/unified-analytics) and reporting tools that any city or state government could use.

There are three basic components to any web analytics implementation: configuration, collection, and reporting. This setup gives a solid foundation for all three using a single snippet of code that is installed on each page of every site to be included in tracking. It leverages a tracking “container" model that comes preconfigured to capture the standard Google Analytics measurements and adds more detail: PDF and other document downloads, frustrated users, JavaScript Errors, and even a little module to collect feedback.

On the other end, we’ve written custom report configurations to get that extra detail back out of Google Analytics and into the hands of departments and agencies that can use it to drive things like content decisions. I’m still working on the documentation, but the [Google Analytics Embed API](https://developers.google.com/analytics/devguides/reporting/embed/v1/?hl=en) makes something like this possible. [You can log in](https://github.com/CityOfPhiladelphia/phila-dashboards) — it’s a work in progress — it will only show you data for Google Analytics accounts *you* have access to — and doesn’t store any data. (Aside: this is the last piece I’m working on — an unbranded version to accompany the release of the container configuration. In the meantime, I’ve built [preconfigured links to reports](https://github.com/laurenancona/unified-analytics/blob/gh-pages/reporting.md) in the standard Google Analytics reporting interface).

**RP:** Thanks for sharing! While we were already working our way down a similar path, having a working example and being able to look at the code behind it really helped coalesce our ideas and work quickly to make it happen. It also helped us to have the federal dashboard to show as an example before we wrote a single piece of code. People got it, and were supportive, which made my job of coding it a lot easier.

**CR:** The work you are doing is inspiring. Steering tech and improving how the government implements it is no small task. By creating these resources you’re paving the paths allowing entities like TDEC to react and change faster.

You’re also providing a real world example of how modern workplace provisions (like remote workers, flexible schedules, etc), agile practices and modern technology can improve government. If government has any hope to emerge from “behind the curve” we have to break down the status-quo. We need modern work environments and to use some of the practices commonly considered only for the “start-up” world. We have to make working for the government “sexy.”

Otherwise, we’ll never be able to recruit the young upcoming talent and needed resources to accelerate or sustain long-term improvement. By implementing and vetting these practices, technologies and projects, then openly sharing your lessons learned, 18F is providing fuel for people like myself to use. I can point to your methods as real proof that these things can succeed in government when discussing it with executive management.

TL;DR: Keep pushing! 18F is affecting more than federal programs and we NEED your success to push forward.

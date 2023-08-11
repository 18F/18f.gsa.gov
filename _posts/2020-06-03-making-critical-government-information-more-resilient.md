---
title: Making Critical Government Information More Resilient
date: June 4, 2020
authors:
  - mheadd
  - timlowden
  - carter-baxter
  - michael-walker
tags:
  - web design system
  - cloud.gov
  - login.gov
  - federalist
  - tools you can use
excerpt: A roundup of steps that federal agencies, and other government
  entities, can take right now to improve the resilience of their websites and
  serve information more efficiently to the people that need it
---

<div class="testimonial-blockquote">
  Agencies are encouraged to update their .gov websites to the greatest extent practicable to provide agency service delivery information to Federal Government consumers and to direct Federal Government consumers to the appropriate digital and telephonic resources to obtain needed services.
    <span>- OMB Memorandum M-20-19: Harnessing Technology to Support Mission Continuity
</span>
</div>

It’s important for government agencies to provide easy access for citizens to critical information online.This is even more imperative during a crisis. The increased demand for critical information on government websites can place an additional load on the infrastructure supporting these sites, which are too often not engineered to handle the increased load efficiently.

The resilience of government websites is an important part of ensuring people have access to critical information during a crisis. This post will outline some of the steps that agencies can take right now to improve the resilience of their websites, and serve information to citizens more efficiently.

Please note that this post is only intended to focus on a collection of steps that agencies can implement on their public websites in the short term. You can find details about other, [more expansive and longer term strategies](https://18f.gsa.gov/2019/02/07/the-cloud-is-not-a-virtue/) that agencies can use to improve the delivery of information through their websites. Additional information can also be found that covers [specific guidance for agencies](https://digital.gov/resources/coronavirus-covid19-guidance-for-us-government/) developed by the White House and other agencies, or strategies for making content [easier to read](https://plainlanguage.gov/), [more accessible](https://digital.gov/topics/accessibility/), and [easier to find](https://developers.google.com/search/docs/data-types/special-announcements) in web searches.

The immediate steps listed in this post may be grouped into two main categories: reducing the number of web requests your site needs to serve, and speeding up those requests that your web site does need to serve.

## Less is more

When it comes to efficiently delivering critical information via an agency website, less is often more. Less unneeded requests to your web platform, fewer unneeded resources for your user’s browser to fetch, and smaller payloads delivered more quickly means more people will get the information they need more efficiently during a time of crisis.

### HTTP headers

One way is [leveraging HTTP caching headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Caching) to provide clear instructions to clients consuming your agency’s web content on how information may be stored for reuse. Information that is updated more frequently should be clearly marked, via the appropriate HTTP headers, as content that can only be stored for a short period of time (or not stored at all), or that must be revalidated before serving it to a consumer. Information that changes less frequently can be stored in various places that a web client can access before a request makes it to your web platform. This may include a user’s local browser cache, a server in a content delivery network (CDN), or a proxy cache server that sits in-between your web platform and your end users.

### Content delivery networks

Another common way to reduce unneeded requests is leveraging a content delivery network (CDN). A CDN is a geographically distributed set of web servers that retain a copy of your web content the first time it is accessed, and delivers this copy to subsequent requests based on a pre-established set of caching rules. This allows your content to be staged on CDN servers that may be geographically closer to consumers—speeding delivery—and also reduces the number of requests needing to be served by the platform hosting your website.

### Load balancing and caching

Like a CDN, a proxy server sits in-between the consumers of your information and the platform serving your website. A proxy provides several methods of reducing load. A **reverse proxy** server can be used to intercept requests for web content and modify them (for example, by adding or removing HTTP headers) or to redirect requests to another location. A **load balancer** can be used to spread out web traffic among several different web hosting instances, or reduce load on an instance. A **content cache** can act much like a CDN and stores a temporary copy of your content. Serving cached content can be especially helpful on dynamic sites where a server has to pull multiple streams of data together to build a web web. Instead of doing this each time a page is requested, you can simply serve the results of all that server effort from a content cache.

It should be noted that none of these approaches is mutually exclusive. Consider using all of them as part of your overall resilience strategy. It’s also worth noting that none of the steps outlined above requires reengineering or rebuilding your website, though you may want to consider how doing so might make your site more resilient.

## The Need for Speed

After taking steps to reduce the number of unneeded requests handled by your web platform, you can also increase the efficiency of the requests your platform does respond to. As a general rule of thumb, the smaller the payload your platform needs to deliver to uses in response to a request, the more quickly and efficiently it will be able to deliver it.

### Minimize and Optimize

There are certain tools that are crucial for maintaining strong user experience on your site. The more JavaScript (JS) the browser has to execute, the longer it will take to do it. For public government websites, [OMB mandates](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/memoranda/2017/m-17-06.pdf) implementing the [Digital Analytics Program](https://digital.gov/guides/dap/) (DAP) JS tag, and the DAP team encourages a parallel web analytics tag as well.

Beyond that, it is up to your team to assess which pieces of JS are essential, and which may be impacting page performance. You should review the JS libraries and CSS files currently used in your site’s pages and eliminate any references that may not be needed (hint: it’s not uncommon for a website to reference multiple versions of the same JS library). You can also use a number of free and easy to obtain tools to identify both JS and CSS files that are never used by your site, and that can probably be eliminated.

In addition, any JS and CSS files that are used by your site should be minimized to speed up the delivery of these assets to your user’s browser. Some popular JS libraries have a “slim” or “minimized” version that are more suitable for production websites, and are specifically designed to be delivered more quickly to users.

Image files are another asset type that can be [optimized to improve performance](https://developers.google.com/web/tools/lighthouse/audits/optimize-images).

### Use Compression

All modern web browsers support the ability to receive information in a compressed format and to render it properly for users once it is received. HTTP compression can dramatically speed up the delivery of information to users, and is usually easy to configure in the platform serving your website.

### Convert to Static

A common architectural paradigm for websites, particularly those that use a content management system (CMS), is to store webpage data and information in a database. When a user requests a page, the CMS will pull content from the backend database, render a page and deliver it to a users’ browser. This process is typically seamless to an end user, and if demand on a web platform is low, the overhead required to construct pages and deliver them to users can be negligible. But in times of high demand, even small amounts of overhead to construct and render web content can have significant performance implications.

One way to help offset this is to convert certain pages on your site, or even your entire site depending on the kind of information it houses, to [a static site](https://cloud.gov/docs/deployment/static/). If parts of your site contain information that is only updated periodically, converting to a static site can have significant performance benefits, and even make your site easier to manage. Look for a widely used CMS, like Wordpress or Drupal, where there are a large number of plugins and utilities that can be used to convert to a static site.

## Don’t Reinvent the Wheel

Most important for agencies looking to make their web content more resilient during times of crisis is to leverage existing tools and platforms. By using tools managed and supported by teams of experts, agencies can avoid reinventing the wheel and introducing bottlenecks to critical information delivery during a crisis.

Here is a list of production-ready components that agencies can leverage that are managed by GSA’s Technology Transformation Services:

[Federalist](https://federalist.18f.gov/): A platform for quickly and easily deploying and managing government websites. Federalist is optimized for delivering media and content to the public.

[Cloud.gov](http://cloud.gov/): A Platform-as-a-Service for government agencies that makes it easy to stand up and manage websites and applications on the cloud. [Cloud.gov](http://cloud.gov/) is specifically engineered to make it easy for government agencies to deploy scalable, resilient web applications.

[Login.gov](https://login.gov/): A simple service for providing authentication and identity verification to users of government digital services. Login.gov reduces user burden, lowers costs and improves the overall experience when interacting with government services online.

[Search.gov](https://search.gov/): An easy to use search engine service for public federal government websites.

[US Web Design System](https://designsystem.digital.gov/): A toolkit of principles, guidance, and code that helps agency digital teams build accessible, mobile-friendly government websites for the American public.

## Additional Resources

* [Digital.gov Guides and Resources](https://digital.gov/resources/): Essential ‘how-to’ guidance for product managers in government.
* [18F Accessibility Guide](https://accessibility.18f.gov/): A comprehensive guide for making websites and content more accessible.
* [PlainLanguage.gov](https://www.plainlanguage.gov/): The definitive source for writing content for government agency websites to ensure simplicity and clarity.
* [Google Lighthouse](https://developers.google.com/web/tools/lighthouse/): A resource for web developers and program managers to get a comprehensive view of a website’s accessibility and efficiency.

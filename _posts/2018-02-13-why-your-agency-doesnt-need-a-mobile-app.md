---
title: "Why your agency (likely) doesn’t need a mobile app"
date: 2018-02-13
authors:
- manger
- willsullivan
tags:
- best practices
excerpt: "Building products for the public requires a lot of listening and finding the right balance of value, cost, and user needs to build the best product. With that approach, we find most of the time that building a highly-optimized mobile-friendly website almost always trumps building native mobile apps."
---

Building products for the public requires a lot of listening and finding the right balance of value, cost, and user needs to build the best product. With that approach, we find most of the time that building a highly-optimized mobile-friendly website almost always trumps building native mobile apps.

Today, mobile technology in a government context can range from [FirstNet](http://www.firstnet.gov/) emergency responders to SMS tornado alerts to consumer-facing information websites to incredibly detailed and multi-field digital forms. The breadth of experiences and contexts we must serve, and the diversity of user technological literacy and available tools makes these decisions challenging, and there’s rarely a “silver bullet.” The solution always begins with “it depends” and balances user research and context to build the case for what platform to use.

## There are reasons to do mobile apps

There are absolutely times when it makes sense to build native mobile experiences. 

Some of these include, **low or no bandwidth contexts**, in which a user needs to store data on their device because most browser caches are limited and they can’t rely on their mobile network. (Such as [maps for exploring national parks](https://itunes.apple.com/us/developer/national-park-service/id447866742)). 

**Heavy device sensor use** is another area that web standards are slowly evolving and native apps tend to win out; it’s very difficult to build and support an augmented reality cross-platform “Pokemon Go”-type experience in a browser. For example, the National Oceanic and Atmospheric Administration launched an app called [CrowdMag](https://www.digitalgov.gov/2015/06/18/noaas-crowdmag-app-citizen-science-on-the-go.md/) that uses the magnetometer in mobile devices to send data to government researchers.

**Third party interactions** such as secure and repeat financial transactions and third party devices, like app-optimized watches or smart home devices, often require an app to make that final connection and are not as easy to execute on the mobile web.

If your users have these specific needs, then a mobile app may be the right choice for your agency, but apps that don’t take advantage of these features are likely better as optimized websites. New APIs for modern browsers have even added features that were previously only available through a native app, like [push notifications, geo-fencing, and background syncing](http://www.html5rocks.com/en/tutorials/service-worker/introduction/). 

## Apps change faster and can cost significantly more to build and maintain

The British Government Digital Service (GDS) has gone as far to write in it’s design manual that [apps are “rarely justified”](https://www.gov.uk/service-manual/making-software/standalone-apps.html). GDS requires an agreement from the Cabinet office and proof that the site already works well on mobile and has the content or services already available to the public as open data or APIs before you can even consider an app.

For government services, this is a judicious stance to take and one we encourage with our partners too.

### Developing multiple versions can significantly raise costs

Building native apps costs exponentially more to maintain because you have to build the same thing, multiple times for different platforms — at least Android and iOS, and maybe others depending on your audience. Then you have to keep your apps up to date with the rapidly evolving mobile operating system space where every year new versions with new APIs and functionality are released. This rapid evolution of operating system versions has helped tremendously in expanding what’s possible to do on these devices, but it creates a high level of maintenance and updating for app creators to stay current with modern devices and support the older ones too. 

That rapid development requires significant resources to continuously update, maintain, test, and deploy. Now multiply that times each platform you have to support. The government needs to serve people of all economic means, so that means making sure to continue to support older versions of operating systems and devices.

Mobile web standards may be evolving faster than they used to, but they still change slower than mobile operating systems. There’s also a large focus on depreciative standards that last decades, whereas operating system versions tend to measure device lifetimes in a few years.

### It takes a lot of effort to acquire and engage users

Native apps also have a huge user acquisition and engagement challenge. The process of raising audience awareness, getting them to their respective app store, getting them to download and install, getting them to open the app, and getting them to regularly use it is a very steep conversion hill to climb. 

Whereas on the mobile web, there’s no installation needed. You can find resources through search engines, social media, and just typing in the URL (SEO and social sharing is another area that is very difficult for native apps to beat the mobile web [although there have been efforts to improve this](http://thenextweb.com/google/2016/01/19/google-is-letting-android-users-install-apps-via-search-instead-of-the-play-store/)). Sure, you don’t have the app icon on the home page to remind the user, but studies have consistently shown that [most people only use 3-7 apps, even though they have 10 times that many installed](http://fortune.com/2015/09/24/apps-smartphone-facebook/) on their device.

Building for the mobile web allows you to do the single most powerful action on the web — linking outside of your domain. Apps still struggle with this. This tiny, but hugely significant act fuels all the interactive ability. It’s what links relationships, information, and experiences. Unlike other forms of media, the web enriched with links allows infinite possibilities to continue learning. And walling off the ability to link to the web in a mobile application, or using the current hobbled implementation for outside web links, fundamentally severs the power of the internet.

### Deployment costs and lack of control

Deployment time for fixes with the mobile web are minimal, whereas getting a new version of your app reviewed and approved in respective app stores can sometimes take days (this has improved significantly in the past few years). You’re also putting your digital product at the mercy of app store owners. If they want to remove you from the store, that’s their prerogative.

## Responsive web can reach more people for the money

> “The [wo]man who chases two rabbits, catches neither.” - Confucius

Most agencies aim to serve the most people possible in their target audience. Investing in your already existing web presence to make it completely mobile-optimized is a better use of your budget than building a separate mobile app, even if they have the same content.

When working with agencies, we focus on always building user-first and doing the research to justify the solution. In the case of government users, the cost, time to deploy, and breadth of potential audience on the mobile web far outweighs building native apps in most use cases. This isn’t to say that there aren’t places where apps make sense, but as the UK GDS says, you should make sure your mobile web experience is easily accessible without an app first. It’s not just a best practice, [it’s now a requirement](https://fcw.com/articles/2018/01/03/mobile-friendly-websites-congress.aspx).

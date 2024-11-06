---
title: "Get the most juice out of the squeeze"
authors:
- porta
tags:
- fec.gov
- agile
- best practices
- agency work
excerpt: "Through analytics and moderated sessions, we can learn what user goals are and enhance the platform to help them achieve those goals. By creating universal search across legal resources, people will be able to locate information more efficiently. This tool will allow them to better understand and comply with campaign finance laws, thus helping advance the FEC's mission."
image: /assets/blog/fec/microfilm.jpg
image_figcaption: The FEC Archives’ microfilm catalog of Matters Under Review
---

The Federal Election Commission’s (FEC) mission is to protect the integrity of the federal campaign finance process by providing transparency and fairly enforcing and administering federal campaign finance laws. The FEC's website is its most important source of instantly accessible information.

On the heels of successful efforts to increase the usability of campaign finance data through the [Open FEC API]({{ "/2015/07/08/openfec-api/" | url }}) and launch of [betaFEC]({{ "/2015/10/29/welcome-to-betafec/" | url }}), the FEC was ready to make headway in making laws, regulations, and other legal resources more accessible to the public. The FEC has a plethora of legal resources available to navigate the complex campaign finance laws to promote voluntary compliance. However, the diaspora of non-connected legacy query systems have made it difficult for a user to locate the appropriate resource.

In 2014, the FEC sought help from contractors to annotate statutes, regulations, and advisory opinions, viewing those linkages as a silver bullet to opening up this treasure trove of assets to the public. A demo from 18F of the [eRegulations]({{ "/2015/12/09/an-open-source-government-is-a-faster-more-efficient-government/" | url }}) platform went smashingly well, and gave the FEC a vision for how to leverage the eRegulations platform to *make legal resources easy to browse and read*.

However, as we conducted initial research and spoke to users; we uncovered different needs. Most notably they noted the need to *find things.* They found the current search systems very difficult to use.

> “I might like to find every enforcement action that dealt with a particular regulation, but I have no easy way to do that.”
>
> “I do think that the explanation on coordination is pretty good… I’m trying to find it. I can’t find it. I remember reading it.”
>
> “If the FEC’s mission is to promote compliance, having these search functionalities be really intuitive, almost like a Google search, that would be a real service to the regulated community.”

Many users also stressed the importance of advisory opinions and matters under review; whereas much of the FEC’s request to contractors focused on statutes and regulations. Steadily, the needs of the users and the stated desires of our stakeholders were diverging.

To complicate matters even more, as we looked at the states of the different legal resources, we discovered that much of the information was locked up in scanned PDFs; only Title 11 of the Code of Federal Regulations was in a state that could readily be parsed into the eRegulations platform. This made the work required to view advisory opinions and matters under review daunting.

We were in a position where we could not quickly meet both audiences’ needs. So who do you prioritize? At 18F, one of our pillars is [user centered design]({{ "/tags/user-centered-design/" | url }}), so shouldn’t we simply prioritize the users' needs?

It turns out: not so fast.

Users can speak to their needs. However, stakeholders can provide context and perspective that is shared across many users. People often forget that stakeholders are users as well. For example, many users with deep legal backgrounds (like attorneys) had indicated they didn’t need online statutes or regulations as they had hard copies with copious notes, post-its, and dog ears. However, not all users have those expensive resources. Furthermore, stakeholders had also pointed out that statutes and regulations are foundational resources that are the basis of advisory opinions and matters under review.

Faced with the challenge of meeting both audiences’ needs and deploying a minimum viable product quickly, we asked ourselves the question:

> **Which juice is worth the squeeze?** In other words, extract as much
> value with the least amount of effort.

There are many agile methodologies that will give you an ordered list of *things* on the product backlog. If this ordered list has valuable features that require a lot of effort, it’s best to break those features down into smaller pieces. By doing so, our team was able to identify the minimum set of valuable features that could be done with the least amount of effort:

-   Build out universal search across primary assets
-   Keep the search interface intuitive
-   Reuse the eRegulations platform

The following were left to a later time:

-   Advanced search functionality (only basic search in the initial releases)
-   Enhanced viewing capabilities (the user would view some resources as PDFs)

Having this streamlined set of principles allowed us to deploy FEC’s Title 11 of the Code of Federal Regulations on the eRegulations platform within seven sprints while integrating universal search across statutes and advisory opinions a couple sprints at a time afterwards. (We’ll also be adding matters under review in the near future.) Had we not broken the users’ needs down, we still would be laboring on our first release.

With legal resources now available on [beta.fec.gov](https://beta.fec.gov/legal-resources), we’re able to get real feedback from real users. Whether through analytics to understand general trends and patterns or through moderated sessions, we’re able to learn what users’ goals are and enhance the platform to help them achieve those goals.

By creating universal search across legal resources, people will be able to locate information more efficiently. This tool will allow them to better understand and comply with campaign finance laws, thus helping advance the FEC's mission. We’re still using that juicer to get the most out of the squeeze.

If you would like to be part of that voice that shapes our backlog, you can [sign up here](http://ethn.io/70862).

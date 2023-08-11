---
title: The 18F Public Benefits Portfolio reflects on the last year
date: March 31, 2021
authors:
  - elizabeth-ayer
  - alex-pandel
tags:
  - public benefits
  - hhs
  - user-centered design
  - data access
excerpt: Pairing our deepening domain knowledge of the unique nuances of
  benefits administration and delivery across programs and levels of government
  with our core expertise in modern technology and digital service delivery,
  18F’s Public Benefits Portfolio team helped empower our partners to take some
  important leaps forward to rise to the critical challenges of the current
  moment, and we’re thrilled to highlight some of their achievements from this
  past year.
---
It would be the understatement of the century to say the last 12 months have been an intense time for our country and our government. In particular, our country’s social safety net programs have been working in overdrive for the past year, as demand for their services have skyrocketed in light of the economic upheaval caused by the COVID-19 pandemic. 

As always, but especially this past year, [18F’s Public Benefits Portfolio team](https://portfolios.18f.gov/public-benefits/) **has been honored by the privilege to support these programs to strengthen the digital infrastructure and tools they use to get critical benefits into the hands of the people they serve** efficiently and equitably. 

Since 18F began working in this space in 2016 (and with even more rigor since we established the Public Benefits Portfolio in 2018), the Public Benefits team has consciously sought to deepen our understanding of the unique nuances of benefits administration and delivery across programs and levels of government. Pairing this deepening domain knowledge with our core expertise in modern technology and digital service delivery, **we’ve helped empower our partners to take some important leaps forward to rise to the critical challenges of the current moment, and we’re thrilled to highlight some of their achievements from this past year.**  

## Spotlighting partner successes through an intense year

### CMS shifts towards a more outcomes-driven, less burdensome approach to state-level Medicaid IT oversight

The Centers for Medicare & Medicaid Services (CMS) at HHS is responsible for overseeing more than $5B/year of federal investment in the IT systems used by states to administer the Medicaid program. Over the last several years, **18F has been supporting CMS in their efforts to streamline and increase the efficacy of their oversight approach** to encourage states to prioritize IT investments that will directly improve outcomes for end users (Medicaid beneficiaries, providers, and case workers), and provide them the leeway and support to employ modern best practices to do so.

**Streamlining a cumbersome paper process and building product management capacity along the way**

CMS began this effort by seeking to streamline their Advanced Planning Document (APD) process, which is how states request matching federal funds for Medicaid IT system improvements from CMS. Previously, the APD process involved states and CMS emailing a series of redlined Word docs back and forth. **Since 2017, [we’ve been collaborating with CMS](https://github.com/cmsgov/eapd/wiki) to develop and iterate upon [eAPD](https://eapd.cms.gov/login)**, a web application where states and CMS reviewers can develop, track, and analyze APD submissions that bakes in best practices and time-saving automation. In the process, we’ve helped CMS build the product management capacity to empower them to own and drive the ongoing development of eAPD.

After years of collaboration and coaching, in 2020 **we were able to wind down 18F’s involvement on eAPD completely, leaving the product fully in the capable hands of our CMS partners to drive forward**. Before rolling off, our team helped CMS procure and onboard a team of designers and developers to continue developing eAPD under our CMS partners’ skilled product leadership, and threw them a (virtual) goodbye party to mark the occasion.

Today, **our CMS partners have an established design research practice in place, and are successfully leading a full development team on their own**. Since 18F left, they have expanded the beta program to more states, and are making steady progress towards fully launching eAPD later this year. By bringing this product management capacity in-house, our CMS partners are now well-situated to lead other impactful digital services efforts themselves, and use these skills to better support their state partners in their efforts to improve their Medicaid systems as well.

![A screenshot of the Alaska APD Home page. Showing the Summary budget by activity for FFY21]({{ site.baseurl }}/assets/blog/ak-apd-homepage.png "eAPD product (2021)")

<div class="testimonial-blockquote">
We’ve leveraged human-centered design and research to take a product from concept to reality – and now we’ve shipped, tested, and are continuing to refine the eAPD to meet user needs and deliver value early and often. We aren’t done yet!
<span>- CMS partner </span>
</div>

<div class="testimonial-blockquote">
It takes a lot less time because I’m not formatting a bunch of Word docs. Just not needing to do tables, saves at least a day’s worth of work.
 <span>- State end-user </span>
</div>

**Asking better questions to put program & end-user outcomes at the center of state Medicaid system development**

eAPD represents an improvement to the early stages of a Medicaid IT investment, when a state seeks initial funding from CMS. However, CMS knows that meaningfully improving the outcomes of these investments also requires a shift in how they monitor ongoing project health throughout the development and operation of these systems as well. 

CMS has historically relied on a more budget-focused, timeline-driven, and document-heavy  approach to overseeing the execution of Medicaid IT investments. However, this approach has not proven to have much positive impact on program outcomes, and is quite time-intensive for both states & CMS.

For the last year, **we’ve been supporting CMS’ shift away from compliance checklists and towards monitoring the ongoing health and outcomes of these projects and systems**. To nurture a more collaborative, conversational dynamic between CMS and the states they support, CMS is investing in empowering their State Officer team with the expertise and confidence necessary to ask the right questions at the right time of their state partners, to ensure a constant focus on program and end-user outcomes throughout the development process. 

As part of this shift, we co-developed and piloted a set of tools and a discussion-based professional development program to support this major transformation to their approach, which we hope to share in the coming months, and have heard great feedback from the State Officer team thus far

<div class="testimonial-blockquote">
It has increased my confidence and given me a reliable resource where I can know what I’m doing, and when I know what I’m doing, I can help the states. I love it!
 <span>- CMS State Officers </span>
</div>

### Making benefits eligibility rules more transparent and reusable

After years of partnering with state governments, our team has witnessed firsthand the painstaking efforts states and territories have to individually undertake to interpret new policy rules and update their IT systems when federal eligibility rules change. In response, we created [the Eligibility APIs Initiative](https://github.com/18F/eligibility-rules-service/blob/master/README.md) to investigate promising approaches to address this pain point. 

This past year, the Eligibility APIs team released [a set of resources](https://portfolios.18f.gov/projects/eligibility-apis/) for making benefits eligibility rules more visible, transparent, and reusable. The Virginia Poverty Law Center subsequently re-used prototype code we developed, deploying [a benefits calculator for the Supplemental Nutrition Assistance Program (SNAP)](https://vplc.org/snap-calculator/) for all Virginians.

Since then, volunteers have extended the prototype with eligibility information for all 50+ states and territories, allowing anyone to see if they are eligible for SNAP benefits no matter where they live. 

This year, we are exploring ways for federal partners to reuse the eligibility rules API developed in 2020, and we’re excited about what’s ahead!

<div class="testimonial-blockquote">
18F created a tool that filled a massive pothole we have been trying to address for years. Now, checking one’s eligibility is a snap due to this incredibly accessible calculator – which hundreds of Virginians use every week.
 <span>- A legal aid staff attorney in Virginia </span>
</div>

### Data-informed grantee services with the Office of Head Start

Head Start promotes school readiness among young children from low-income families through grants and support to local agencies in communities nationwide. Through the Training and Technical Assistance (TTA) program, the Office of Head Start (OHS) assists program staff and grantees in delivering quality services to children and families, with an aim towards continuous improvement.

The divisions and regions that make up OHS have historically relied on disconnected data systems and manual, offline processes to coordinate TTA. Although each group collects information on the services delivered to grantees, it’s been impossible to see collective impact and needs across the Head Start system.

Over the past year, **18F and OHS have partnered to address this challenge by seeking to understand the different user needs, establishing a common data system for TTA information, and selecting a vendor to develop it.** 

Through our user research, we learned that different people interpreted the data in different ways, making it difficult to use data to drive decision making throughout the TTA system. As OHS builds the foundation for a new data system, we are establishing common language and data definitions with the people that use and create the data. This effort should improve OHS’s ability to continuously improve the TTA services they offer to local providers, and ultimately to improve outcomes for children and families. 18F is proud to support this thoughtful work from our visionary Head Start partners.

<div class="testimonial-blockquote">
Last fall we had a super big, clunky, swamp-of-a-problem, and a complicated charge to build trust in many directions. Today we are no longer in the muck; we have some promising tools for users, a committed vendor, and partners who are starting to count on us as much as we count on them. I hope you feel proud. I do. Thanks for bringing your superpowers to OHS.
 <span>- Our OHS partner </span>
</div>

## Playing the long game

You might notice a lack of emphasis on public-facing tools and products in the stories we just shared. That’s because over the years, we’ve frequently encountered the success of our partners’ more public-facing work getting tripped up by roadblocks further upstream. Given our team’s strong emphasis on sustainability and setting our partners up for long-term success, our focus has inevitably shifted over time to **supporting our partners to build the technical expertise and underlying processes and tools that will be necessary for them to be able to consistently and sustainably deliver effective digital services to the public over the long term.**

We love working on public-facing tools and interfaces, but many of our biggest wins in recent months have been of the more foundational, slightly-less-glamorous variety, and we are just fine with that :) 

## Work with us

In addition to continuing work with many of our existing partners, we’re thrilled to be digging into several new engagements over the next few months, and we’re always eager for more opportunities to help.

If your agency could use the help of a team of modern technology and acquisition specialists with deep experience in the benefits space to improve the effectiveness of your digital services, **don’t hesitate to get in touch at** [inquiries18F@gsa.gov ](mailto:inquiries18F@gsa.gov).

Interested, but not sure where you’d start? Have you considered...

* Redesigning your process for distributing assistance to reduce confusion and cost of administration 
* Developing and standardizing your practices for communicating with the public during crisis situations to minimize confusion and meet people where they are
* Developing a “service pattern library” of best practices to ensure interactions across all channels treat program’s beneficiaries with respect & dignity
* Prototyping the digital delivery side of your proposed policies before they are finalized in order to identify system impacts, surface potential implementation challenges, and understand the impact on program beneficiaries while there is still time to revise the proposed policy
* Creating connectivity between your data systems to decrease burden, improve security increase data’s usefulness for your team or the public  

Or, want to roll up your sleeves and join our team? **Keep an eye on opportunities to join the 18F team at** <https://join.tts.gsa.gov>!

# Stay in touch

If you’d like to follow along with what the Public Benefits Portfolio is up to in 2021 and beyond, [sign up for our quarterly newsletter here](https://public.govdelivery.com/accounts/USGSATTS/subscriber/topics?qsp=USGSATTS_4)!

*Thank you to Amy Ashida, Laura Poncé, Matt Dobson, Erin Strenio, and Alex Soble for your help pulling together and editing this post. And of course, thank you to all of the dozens of people at 18F and our partner agencies doing this work every day — you are incredible!*

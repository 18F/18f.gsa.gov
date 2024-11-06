---
title: "4 lessons from building our own recruiting tool"
date: 2017-11-08
authors:
- andrewmaier
- lauren-ancona
tags:
- lessons learned
- user research
- convincing stakeholders
excerpt: "As of September, GSA is running its own recruiting tool for moderated design research. In this post, we would like to share four key lessons we learned while building this tool, including the ways in which software development can serve as a starting point for broader conversations about information practice, privacy, and security."
image: /assets/blog/user-interview/four-lessons-hero.jpg
---

In November 2016, design researchers at GSA discovered that one of the tools we used to recruit folks for our moderated design research ultimately wouldn’t comply with the security needs of our organization. This made a few of us wonder: _What would it take for GSA to design and operate its own recruiting service, taking compliance into account from the outset?_

As of September of this year we _have_ found a way to pilot our own research recruiting service. But rather than focus on the service itself — something for a future blog post, no doubt — we’d like to share four lessons we learned along the way, including the ways in which software development can serve as a starting point for broader conversations about government information practices, privacy, and security.

Let’s start by reviewing how GSA’s recruiting process works for moderated design research.

## Recruiting for moderated design research

[Recruiting](https://methods.18f.gov/#recruiting) for moderated design research involves identifying and soliciting individuals (both inside and outside government) who, after providing consent, can provide feedback on government digital services. At 18F, we frequently use **remote recruiting**. Remote recruiting for moderated design research involves displaying a recruitment form on a website that is itself directly related to the task, behavior, or experience we’re researching. So while 18F was working with [the Federal Election Commission (FEC) on their new website]({{ "/2017/05/30/the-new-fec/" | url }}), for example, we used a popup on the FEC’s existing site to hear from individuals who would be genuinely interested in helping improve its content and services.

There are a few complicating factors. For starters, **recruiting can implicate federal privacy law** because it often requires the use of people’s contact information. For example, design researchers often need to correspond with participants about the study itself and to discuss logistics related to study participation. Additionally, while it’s fairly easy to recruit for a single study from a technological standpoint, it can require considerable coordination to ensure that a team of researchers manages simultaneous recruiting efforts in a privacy-preserving way.

## From pilot to prototype

Thus, GSA worked to procure software that could help streamline its recruiting process. Once we'd identified off-the-shelf software that potentially met our needs, we began piloting that software in early 2015. In this context, a “pilot” simply refers to a testing period in which GSA works with its IT office, GSA IT, to use software on a limited basis and evaluate if we should conduct a formal procurement.

Over the next few months, design researchers participating in the pilot came to rely heavily on the software in question. Things were looking good. The next step was figuring out if the software vendor would be willing to work with GSA IT to assess the degree to which their product complied with GSA’s security requirements. After weeks of negotiation, the vendor ultimately expressed that they had no interest in participating in a security review. As a result, GSA IT ultimately decided that we needed to discontinue our use of this software.

At this point design researchers at GSA were in a bind: We increasingly worried that no off-the-shelf vendor would be willing to comply with GSA IT’s security requirements in a reasonable amount of time. At the same time, 18F was actively recruiting for usability tests to support our human-centered design process. We had a strong interest in “keeping the lights on” for recruiting, protecting people’s privacy, and meeting our security requirements. This ultimately raised the question that opened this post: What would it take for GSA to design and operate its own recruiting service, taking compliance into account from the outset?

In search of an answer, we decided to dust off an old prototype we’d initially made to help describe the kind of software we were looking to procure. Internally, this was known as our “[Call Me Maybe](https://github.com/18F/call-me-maybe)” prototype. To better ensure our idea could meet GSA security requirements, we wired our prototype up to Google Apps using the Google Apps API. Google Apps is an information system that is already authorized by GSA’s Chief Information Officer (CIO). This meant that, outside of a few lines of custom javascript, our prototype was mostly just an thin interface into an already approved, secure information system.

<figure>
  <img src="{{site.baseurl}}/assets/blog/user-interview/four-lessons-1.png" alt="Screenshot of a call to action"/>
</figure>

After discussing the pros and cons of this idea, we decided it had legs. To see what it would take to actually put this pilot into practice, our next stop was GSA’s Privacy Office. What followed was a series of conversations with various stakeholders across the agency. And in lieu of a blow by blow, let’s cover the lessons we learned as things progressed.

## What we learned

### Lesson 1: It’s useful to frame design research as proactive customer service.

One of the first questions Richard Speidel, GSA’s Chief Privacy Officer, asked us when we approached him about standing up a recruiting service was to identify the authority we were working under. After considering a [few options](https://www.digitalgov.gov/resources/government-customer-service-policies-requirements-1993-to-present/), we decided that Executive Order 13571, _[Streamlining Service Delivery and Improving Customer Service](https://obamawhitehouse.archives.gov/the-press-office/2011/04/27/executive-order-13571-streamlining-service-delivery-and-improving-custom)_, most directly related to our goals. This Executive Order directs agencies to “establish mechanisms to solicit customer feedback on government services and, using such feedback [...] regularly make improvements to government services.”

Thinking about design research through the lens of customer service also helped us find a useful framing for it in future conversations across the agency: **Design research is really just a form of proactive customer service**. Think about it. Most folks are upset by the time they’ve contacted customer service because they’ve already had to complain to resolve their individual issue. But when designers fix bugs they’ve found during [usability testing](https://methods.18f.gov/#usability-testing), on the other hand, they’re proactively soliciting customer feedback to improve the experience for everyone — that’s proactive customer service.

### Lesson 2: When it comes to federal IT, it’s easiest to test an idea by developing it entirely within the boundary of a previously authorized system.

Shortly after our conversation with Richard, 18F met with GSA's Feedback Analytics Program to see if they might be interested in operating a recruiting service within their program office. They expressed interest, and the conversation soon turned to compliance: _What would be required for the Feedback Analytics Program to operate a recruiting service?_

To answer this question we consulted GSA IT, who explained that the uniqueness of a system’s boundary — that is, the “boundary” separating a federal information system from its broader environment — directly affects the degree to which it must be evaluated before it can receive an [Authority to Operate (ATO)](https://www.fedramp.gov/resources/faqs/what-is-an-authority-to-operate-ato/). Practically speaking, this meant that while our prototype largely depended on a system that was already authorized, the fact that it relied on just a few lines of custom javascript meant it would need a bespoke security analysis. This could slow down our ability to launch by a few months!

So we explored other options. Because Google Apps has its own scripting language, we ultimately decided to reverse-engineer our original prototype using only that language. And that’s how we learned that, **when it comes to federal IT, it’s easiest to test software by developing it entirely within the boundary of a previously authorized system.**

### Lesson 3: In the federal government, privacy has its own vocabulary.

In conversations across GSA our team was frequently asked to consider how a recruiting service would comply with a number of laws, including: The Paperwork Reduction Act, The Privacy Act of 1974, and the E-Government Act of 2002. To answer these questions we sought input with stakeholders across the agency. A high-level summary of what we heard, and what it meant for our service, appears in the table below. (Disclaimer: GSA has no regulatory authority here, so readers shouldn’t just take our word for it. We’re only sharing this information to prompt conversations around design research recruiting as it relates to the law.)

**Some of the laws implicated by a design research recruiting service**

<table>
  <tr>
    <th><b>Name and description</b></th>
    <th><b>Applied to a recruiting service</b></th>
  </tr>
  <tr>
    <td><p><a href="https://www.whitehouse.gov/omb/inforeg_infocoll">The Paperwork Reduction Act</a> requires that agencies obtain approval from the Office of Management and Budget before requesting most types of information from the public.</p></td>
    <td><p>Per <a href="https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/inforeg/SocialMediaGuidance_04072010.pdf">this memo</a>, our recruiting form would not trigger the Paperwork Reduction Act’s requirements so long as it only collected name and email address, mailing address, and/or phone number.</p></td>
  </tr>
  <tr>
    <td><p>The <a href="https://www.justice.gov/opcl/overview-privacy-act-1974-2015-edition">Privacy Act of 1974</a> establishes a code of fair information practices that governs the collection, maintenance, use, and dissemination of information about individuals that is maintained in systems of records by federal agencies.</p></td>
    <td><p>Design researchers must be mindful of the Fair Information Practice Principles and abide by their agency’s Privacy Program. Our team worked with the GSA Privacy Office to see if a System of Records Notices already existed for the system in which we’d collect and use recruiting data.</p></td>
  </tr>
  <tr>
    <td><p>The <a href="https://www.justice.gov/opcl/e-government-act-2002">E-Government Act of 2002</a> recognizes that technological advances have important ramifications for the protection of personal information contained in government records and systems. Section 208 of the Act stipulates that all federal agencies that develop or procure information systems which employ information in identifiable form must complete a Privacy Impact Assessment (PIA).</p></td>
    <td><p>Our use case involved recording feedback collected directly from identifiable individuals, so we needed to conduct a PIA to fully articulate and critically assess our information practices.</p></td>
  </tr>
</table>   

We began to understand that **privacy, as it relates to federal information systems, has its own vocabulary**: Depending on their collection and use of information about people, federal information systems must be accompanied by things like System of Records Notices (SORNs), Privacy Act Statements or Notices (kind of mini-SORNs), and Privacy Impact Assessments.

<figure>
  <img class="image-shadowed" src="{{site.baseurl}}/assets/blog/user-interview/four-lessons-2.png" alt="A screenshot of GSA’s Privacy Act Statement for Design Research"/>
  <figcaption>A screenshot of GSA’s Privacy Act Statement for Design Research</figcaption>
</figure>

In our case, the GSA Privacy Office helped us determine:
1. Our recruiting service **wouldn’t** need a new SORN, because it operated within our the routine uses of our existing SORN for Google Apps.
2. Our recruiting service — specifically our recruiting forms — **would** need a Privacy Act Statement. (For interested readers, that notice lives [here](https://www.gsa.gov/portal/content/162010).)
3. Our recruiting service **would** need a Privacy Impact Assessment.

### Lesson 4: Privacy Impact Assessments require close collaboration with people at all levels of the organization.

As the vision for our minimum-viable recruiting service matured, we decided to give it a more obvious name: GSA Recruiter. Soon thereafter we learned we’d need to subject the service (and the larger program of which it is a part, design research) to a privacy impact assessment (PIA).

For readers who are unfamiliar, federal agencies conduct and publish privacy impact assessments to comprehensively describe the ways in which their information systems, processes, programs, and activities comply with the [Fair Information Practice Principles](https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/OMB/circulars/a130/a130revised.pdf). This sounds straightforward — and it is — but that doesn’t make it any less daunting! As relative newcomers ourselves, we naturally looked for resources to draw on. We were particularly inspired by the Consumer Finance Protection Bureau’s (CFPB) PIA for its [Consumer Experience Research](http://files.consumerfinance.gov/f/201406_cfpb_consumer-experience-research_pia.pdf) program.

Over the next few weeks we identified additional privacy risks facing our program. We worked with Richard and his office, studied up on privacy law and norms in government, and convened a cross-agency group of stakeholders to meet every other week. Over time, we learned that **privacy impact assessments require the input and close collaboration of people at all levels of the organization.**

Slowly and steadily, things came together. We invited our Office of General Counsel and our Chief Information Security Officer to weigh in, which prompted a few final updates to [our design research participant agreement](https://methods.18f.gov/participant-agreement). You can see the results in the final [Privacy Impact Assessment for Design Research](https://www.gsa.gov/portal/getMediaData?mediaId=167954).

## Where we’re headed next

As of September, we've launched an internal pilot of the GSA Recruiter tool to support GSA’s moderated design research. We plan to test it out in close collaboration with a handful of clients over the next few months. Once we work out any kinks, we’ll create a simple landing page explaining how Recruiter works, and how federal agencies can work with GSA to recruit for moderated remote design research.

<figure>
  <img src="{{site.baseurl}}/assets/blog/user-interview/four-lessons-3.png" alt="An example of a landing page for the GSA Recruiter on the National Science Foundation’s website."/>
  <figcaption>The GSA Recruiter as it appeared on the National Science Foundation’s website.</figcaption>
</figure>

In bringing this recruiting service to life we’ve worked hard to document, share, and socialize what we’re learning. In addition to publishing the Design Research PIA and this blog post, we’ve also updated our [privacy method card](https://methods.18f.gov/#privacy) and the privacy section of our [Before You Ship guide](http://before-you-ship.18f.gov/privacy/). To further discuss this work, we’re participating in (read: asking a bunch of questions about design research and usability testing during) the [Federal Privacy Bootcamp](https://www.fpc.gov/education-and-training-sub-committee/). Over the next few months we hope to more thoroughly consider and document the ways in which simple, custom software can help streamline design research across government.

Finally, in the spirit of proactive customer service, it feels fitting to end this post with a call to action: We'd love your feedback! Please send an email to [18f-research@gsa.gov](mailto:18f-research@gsa.gov) if you’ve found this post useful, and let us know if you’ve conducted similar assessments of design research practices within your agency.

## Credit where it’s due

We wanted to take a moment to celebrate a few of the agencies, offices, and civil servants that have helped make this work possible:
- At 18F: **Elizabeth Goodman, Jeremy Canfield, Colin MacArthur** and other research guild leaders for helping us manage expectations and stay focused; **Jeremia Kimelman, Maya Benari,** and **Aidan Feldman** for helping with the initial prototype; and **John Yuda** for encouraging us to stay nimble and not overspecify.
- GSA Chief Privacy Officer **Richard Speidel** for shepherding privacy-related discussions, and Privacy Officer **Jackie Henry** for answering questions and wrangling signatures on the PIA.
- GSA IT Security Engineer **Tom Eaton** for answering our initial questions about system security boundaries.
- GSA’s Chief Customer Experience Officer, **Anahita Reilly**, and Designer **Matthew Ford** for discussing customer experience design at length.
- **The Consumer Financial Protection Bureau** for helping show the way, especially Chief Privacy Officer **Claire Stapleton** and User Research Lead **Jonathan Rubin**.
- GSA Office of General Counsel attorneys **Jessica Hawkins, Duane Smith, John Peters,** and **Alissa Schrider** for their patience, thoughtful questions, and helpful answers.

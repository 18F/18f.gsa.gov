---
title: Improving the way the U.S. Tax Court engages with the public
date: June 15, 2021
authors:
  - andrew-dunkman
  - mark-meyer
  - jessica-marine
  - mike-marcotte
  - vicki-mcfadden
tags:
  - agency work
  - data access
  - open source
  - acquisition services
  - tax court
excerpt: The United States Tax Court is an independent federal court that
  provides a forum for settling disputes between taxpayers and the Internal
  Revenue Service. After 30 years, the Court shifted the way it manages Court
  operations — here’s how 18F and the Court worked together to improve the
  public’s experience.
---
The United States Tax Court is an independent federal court that provides a forum for settling disputes between taxpayers and the Internal Revenue Service. The Court had used a modified COTS product to manage Court operations since the 1980s. Of the 25,000 to 35,000 petitions filed each year, about 60% are filed by people without lawyers, and traditionally had to be done in-person or via mail. After 30 years, the Court shifted the way it manages Court operations — here’s how 18F and the Court worked together to improve the public’s experience.

<div class="testimonial-blockquote">
Once I hit that button, it’s a done deal? That’s cool.
<span>- Calendar clerk, U.S. Tax Court </span>
</div>

The Court reached out to 18F to help write a solicitation for a new, open-source case management system that the Court can maintain into the future without stepping into a long-term, sole-source maintenance agreement with a new vendor. The Court ensured research and user needs direct the project by appointing a dedicated Product Owner, establishing clear project sponsorship, and being willing to adopt new tools and techniques to implement the new system. 

18F conducted a three-day workshop with the Court to develop the [solicitation](https://github.com/ustaxcourt/case-management-rfq) that was descriptive of the kind of work to be done but not prescriptive about how to do it, allowing ongoing adjustments based on user research as to what features were developed. The solicitation leveraged a time-and-material (T&M) contract type with a not-to-exceed ceiling to achieve this flexibility. We then helped the Court conduct market research to identify qualified companies on [GSA Schedules](https://www.gsa.gov/buying-selling/purchasing-programs/gsa-schedule) and coached the Court’s evaluation team on [what to look](https://derisking-guide.18f.gov/federal-field-guide/deciding-what-to-buy/#evaluate-contractor-proposals-based-on-industry-best-practices) for in a qualified industry partner. 

![Screenshot of the US Tax Court's DAWSON case-management application"]({{ site.baseurl }}/assets/blog/ustc-header-image.png)

The Court awarded the contract to an industry partner that brought strong software development and user-centered design skills to the project. All told, from the time the final solicitation was posted to the first commit of code, the process took 70 days. 

Since the industry partner was brought onboard, 18F has mainly provided technical subject matter expertise, allowing the development team to focus on building the best possible product. On a day-to-day basis, that means assisting the Court with per-sprint code reviews, setting up and maintaining the Court’s technical stack using cloud services, and coaching the Court on modern software development best practices so that they can more effectively work with their vendor. 

18F also supported the development of the Court’s Authority to Operate and Site Security Plan — their plans to identify, assess, and address or accept risks.

A year into development, the Court decided it wanted to increase the speed of development and add an additional scrum team to the project. Because of their [contract format](https://derisking-guide.18f.gov/federal-field-guide/deciding-what-to-buy/#use-the-agile-contract-format-to-procure-agile-software-development-services) and T&M contract type, they were able to do this quickly, without a contract modification.

The Court migrated over a terabyte of data – nearly one-million cases going back to the 1970s – from the legacy vendor’s system to the new system quickly and accurately. 

The new case management system, [DAWSON](https://dawson.ustaxcourt.gov/) (named after a [beloved judge](https://en.wikipedia.org/wiki/Howard_Dawson) known for his detailed record keeping) went live at the end of 2020, a little over two years after development started. For the first time, people without lawyers can start a new case online in an easy-to-understand process. The new system is also easier for Court staff as well – with streamlined processes and better usability. The Court continues to develop and [regularly deploy](https://github.com/ustaxcourt/ef-cms) new features to DAWSON with support from 18F.

<div class="testimonial-blockquote">
I’m now able to draft orders on my tablet from the comfort of my leather recliner.
<span>- Judge, U.S. Tax Court </span>
</div>

**The Court is hiring for a remote position**: DevSecOps Engineer. If you’re interested, please consider [applying](https://www.ustaxcourt.gov/vacancy_announcements.html)!

*Launch team – Court: Jessica Marine and Mike Marcotte; 18F: Andrew Dunkman, Mark Meyer, Julia Allen, Laura Gerhardt, Olesya Minina, and Vicki McFadden.* 

*Many thanks to the folks that have helped along the way – Court: Stephanie Servoss, Judge Buch, Jen Siegel, Mike McVicker; 18F: Waldo Jaquith, Randy Hart, Mark Hopson, Kelsey Foley, Glenn Grieves, Hannah Kane, and Torey Vanek*.
---
title: "Building an effective agile partnership between government and industry"
authors:
- rebecca-refoy
tags:
- acquisition services
- agile bpa
- department of labor
- agency work
excerpt: "The Wage and Hour Division (WHD) of the U.S. Department of Labor has been with 18F at the forefront of digital transformation and has been an outstanding early adopter. One of our latest initiatives has been an Agile Delivery Services Blanket Purchase Agreement (Agile BPA) Task Order to create the initial version of a web application tool for the Section 14(c) certificate application process."
image: /assets/blog/dol-whd-14c/certification-application.png
hero: false
---

![The application form for 14(c) applicants]({{ image | url }})

For the past two years, 18F has had the pleasure of [working with the
Wage and Hour Division (WHD) of the U.S. Department of
Labor]({{ "/2015/09/09/how-a-two-day-sprint-moved-an-agency-twenty-years-forward/" | url }}).
WHD has been with 18F at the forefront of digital transformation and has
been an outstanding early adopter. One of our latest initiatives has
been an [Agile Delivery Services Blanket Purchase
Agreement](https://pages.18f.gov/ads-bpa/) (Agile BPA) Task Order to
create [the initial version of a web application tool for the Section
14(c) certificate application process](https://dol-whd-section14c-stg.azurewebsites.net/#/).

## What is the Section 14(c) program?

[Section 14(c)](https://www.dol.gov/whd/workerswithdisabilities/)
of the Fair Labor Standards Act permits the payment of subminimum wages
— wages less than the federal minimum wage — to workers with
disabilities whose earning or productive capacity is impaired by a
disability for the work to be performed, after the employer has applied
for and received an authorizing certificate from Labor.

Section 14(c) certification is currently a paper-based process.
Applicants download PDFs of the paper application from Labor’s website,
complete the forms by hand, and submit them to WHD via regular mail.
Recognizing that this process is slow and cumbersome for both applicants
and the WHD staff responsible for reviewing and issuing section 14(c)
certificates, WHD began collaborating with 18F to modernize the process.

18F held a workshop with WHD in April 2016 to establish a vision for a
new online certification tool and to create a backlog of [user
stories](https://trello.com/b/74MUGMpP/14-c-public-backlog) for future
vendors to accomplish. Out of that workshop, together we came up with a
plan to:

-   Turn the 14(c) application system into a modern, digital-first service
-   Provide an intuitive online experience that produces complete applications
-   Ensure the product supports policy and process improvements over time

## Asking for help with the Agile BPA

To turn this vision into a prototype, we turned to the vendors on the
[Agile
BPA]({{ "/2015/08/28/announcing-the-agile-BPA-awards/" | url }}), which would allow us to see results quickly while also introducing WHD
to modular contracting and agile
development. The first hurdle to adopting modular contracting was working with the WHD team to design a plan that would give the vendor only 60 days to
complete the work, with no options to extend. This is much shorter than
typical federal contracts, but it provided a strong incentive to focus
on the minimum viable product (MVP), exactly what the Agile BPA was
designed to do. This narrow scope was challenging for our product owner
— it is difficult to meet and manage the high expectations of varying
stakeholders when a complete, polished product is not the goal of an
initial release. To keep this project moving forward, we had to work
with the product owner to educate and demonstrate the importance of
[modular contracting](https://modularcontracting.18f.gov/) and
iteration to WHD stakeholders.

WHD and 18F worked collaboratively in May and June to draft the
solicitation documents. Throughout drafting, WHD worked closely with
counterparts in Labor’s Office of the Chief Information Officer and
Procurement Counsel from the Office of Solicitor so that all parties
involved in the traditional procurement process could experience modular
contracting. This was the first step in what will be many iterations of
the section 14(c) tool, and it was important to set up the project to
work as a modular procurement from the start. After evaluating the seven
submitted proposals, we choose [Applied Information
Sciences](https://www.appliedis.com/about-ais) (AIS) to work on the
14(c) project.

## Building an effective working relationship

The collaboration between WHD, AIS, and 18F has been an excellent
example of how government and private industry can work together using
agile methodologies to produce great results. Here are a couple reasons
this relationship has been so successful:

-   **A vendor ready to work in an agile way.** AIS conducts sprint ceremonies, keeps everyone on track during stand ups, and has been flexible to the evolving needs of WHD. They’ve struck a great balance between project management work and dedicated developers focused on creating the web application tool, while also being strong supporters of usability testing.
-   **Shared responsibility for success.** A crucial value that has led to the success of this task order is that AIS and WHD are both responsible for the success of this MVP. Without the necessary engagement and involvement within WHD, the vendor cannot succeed. Similarly, WHD cannot succeed without the technical expertise of the vendor.
-   **An empowered product owner**. From the beginning, we emphasized the need to have one person dedicated and *empowered* to make critical decisions and direct the strategy. Our product owner, Elizabeth Striegel, has done a great job prioritizing the backlog, making key decisions on features, and getting items escalated to appropriate decision-makers throughout Labor. She has also been a great ambassador for WHD about agile methodology and demonstrating why it’s a better way to work.
-   **A stakeholder commitment to work in the open.** Our [repo has been public from day one](https://github.com/18F/dol-whd-14c), which includes our project management tasks. Furthermore, the user stories from the performance work statement were public on our [Trello board](https://trello.com/b/74MUGMpP/14-c-public-backlog) and have been used to inform each sprint during these 60 days. You can also see the outcome of work with the beta version of the [public prototype](https://dol-whd-section14c-stg.azurewebsites.net/#/).

## A new way to work

This task order is going to deliver great value for WHD and working code
within 60 days, but perhaps more importantly it has shown them *how* to
work in an agile and modular fashion. This hands-on experience with
agile is far more effective than if WHD had simply been told about the
benefits of agile teams. These 60 days have shown WHD quick, important
wins and have proven that being agile is better for software development
and can be better for business processes. This engagement paves the way
for Labor to bring the efficiency and effectiveness of agile procurement
to future engagements with vendors.

18F wants to reimagine how the government works with vendors. Our work
with WHD is part of a much larger effort to enable more businesses to do
agile work for the government while making the government a better
customer. We want agencies to have strong relationships with vendors who
can deliver great value to our partner agencies. The work by WHD will
serve as a great model going forward.

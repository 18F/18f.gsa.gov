---
title: Building product management capacity in government part 2 – Interview with a product manager
date: 2019-11-19
authors:
- nikki-lee
- jerome-lee
tags:
- best practices
- product
- culture change
excerpt: "This is part two in a series of posts about building product management capacity in government agencies. For this post, we chatted with Jerome Lee of the Centers for Medicare & Medicaid Services about his experience as a product manager on our current project"
image: /assets/blog/product-guide/product-manager.jpg
---

*This is part two in a series of posts about building product management capacity in government agencies. The series explores the process of helping agency staff transition into product management roles, from both the [18F perspective (part one)]({{ "/2019/08/22/building-product-management-capacity-in-government-part-1/" | url }}) and partner agency perspective. For this post, we chatted with Jerome Lee of the Centers for Medicare & Medicaid Services about his experience as a product manager on our current project. These are Jerome's opinions and are not official views of the Centers for Medicare & Medicaid Services or the US Public Health Service.*

We chatted with Jerome Lee of the Centers for Medicare & Medicaid Services (CMS) about our work helping CMS streamline the funding application process for state Medicaid agencies seeking money to improve their IT systems.

### One reason why this project has been so successful is because you’ve been really present for the team. Can you talk about how you’ve made time for this given your other duties?

This project was a priority for CMS leadership from day one. While I’ve had to balance my existing workload, CMS leadership has given me a high level of autonomy about how to do my day-to-day, but the reality of doing your day job while also adding project work requires a real effort in time management.

At the start of the project, CMS didn’t have the capacity to provide one full-time person, so we did the next best thing: provide two part-time people! For the two-employee thing to work, there's an element of interchangeability, but more importantly, there has to be trust. We had to keep an open mind about learning a new way to conduct business and be deliberate in our coordination efforts while also keeping leadership apprised of challenges we were facing from a project and workload perspective.

More recently, I’ve taken on the responsibilities as the product manager on the project, which has created a different set of time management challenges, but when you are surrounded with a great team and strong leadership support, it makes it that much easier to carve out time to keep the project moving forward - especially when you have multiple competing priorities.

### Something we often see folks struggle with is decision-making. Your decisiveness when defining the CMS product really helped us keep moving. How do you make these types of decisions?

One of the first things the 18F team provided me with was a framing document template to help us identify very specific details: the problem we were trying to solve, the project goals, and how we would measure success. This template helped us stay oriented to the high-level goals.

While working on the product, not all decisions came easily. The easy ones came from knowing our business needs and the real pain points of our state and federal partners. The harder ones came while learning to be a product manager and scoping each sprint, each release, and how to stay on track towards our goals.

In the end, we learned to trust the process of design, build, test, and iterate. It helped us test decisions and ideas early and often and get user feedback very quickly, instead of waiting until the product was close to completion like in more traditional waterfall projects. Each time we tested, we learned something new that helped us make better decisions.

Leadership needs to trust and support the team and be open-minded to changes in direction and stumbles along the way. If we make a decision or build something they don’t like, we have a process by which we can adjust and refine the work.

Transparency is also key. Because we’re developing everything in the open, leadership and other stakeholders know the direction we're headed and see us adjust our course as we develop and refine the product.

### You’ve become more comfortable writing issues, running sprints, sharing sketches, editing content, and even writing code. Many folks we work with are nervous to do these things because they haven’t done them before. Did you feel intimidated at all? How confident do you feel working in an agile way now?

I was totally intimidated! I was surrounded by designers, developers, and product managers with real-world experiences and successes in large, well-known companies, and here I was just putting on my product manager training wheels.

While I’ve read about Agile and developed software in the past, it’s another thing to actually have to *do something in a totally different
way.* Now that I’ve seen software development done in this way — through a partnership between product, design, and development teams — I can’t
imagine doing it any other way.

Testing code in minutes and hours instead of weeks and months is a real eye-opener. Integrating learning through feedback loops, user testing, and internal retros are a must. Writing user stories instead of user requirements delivers real-world value instead of real-world features. Getting feedback from an interdisciplinary team early (and often!) is way more efficient.

The 18F team was always willing to teach, prod, and gauge where I was in my journey of software development. I knew I wasn’t going to be judged negatively whenever I tried something new, whether that was writing an issue in GitHub, merging a pull request, or running a meeting.

### You’ve done a lot of work to evangelize this product and incorporate feedback from end users. This has really paid off, especially in the excitement we’re seeing from end users and internal leadership. How do you make space for this?

At the end of the day, we believe in the product so speaking about it comes naturally to us, but if we make something that nobody wants to use, we’ve failed.

I want people to tell us *why* they don’t want to use the product so we can fix it. Every conversation is an opportunity to learn. Thankfully we have several platforms to speak to our end users – webinars, email broadcasts, conferences. I don’t know if other government agencies have the same platforms, but we always ask for opportunities to connect with our users.

The forward momentum is encouraging and the fact that we built something that’s ready to go is huge. If we were years from releasing something, it’d be much harder. We’ve narrowed it down to an MVP that we can describe really well, and we’ve been able to successfully pilot the first iteration of the eAPD with real users in a relatively short period of time.

### What have been some of the challenges with this project, and how did you conquer them?

- **Team building:** As the team was forming, I think there was a general sense of divide among 18F and CMS teams. While we’re all federal employees—and it wasn’t intentional—we brought many different expectations, life experiences, and organizational cultures to the project. From a CMS perspective, I came in with very defined expectations, parameters, and timelines for the project. The 18F team was very accommodating, but it wasn’t until I realized those expectations were unrealistic and unfair did the whole team have a chance to fully flex their creative muscles and technical expertise. “One team, one dream” has become a favorite motto of mine.
- **Dealing with rejection from users:** In our first round of user testing, we received what you might call negative feedback—basically, “Why would you want to do it this way?!” I’ll never forget the disappointment on the team’s faces. Nikki of 18F rallied the team together and reminded us: this is exactly why we do user testing, and we should take the opportunity to pivot and make a better product. Dealing with any type of rejection is hard, but we trusted the process and iterated on the design and tested it again before committing development resources to a full implementation. Our next round of user testing yielded much more positive results, giving us a renewed sense that we were headed in the right direction. This experience also brought the team closer together.
- **Compliance and security:** We’ve had to navigate a lot of existing structures and processes that don’t necessarily align with this style of software development. On-demand staging servers for unit and integration testing, continuous integration and delivery with multiple code deploys to production daily, and human-centered design may be common in other sectors, but this idea can be quite foreign to teams who’ve only worked in primarily traditional waterfall-style development. When questions come up asking about changing control board procedures and resources required for a dedicated staging server, we’ve often had to serve as evangelists and educators for how we’ve approached the development of this project, while making sure we’ve done our best to work within the system as it is.
- **Work stoppages:** First I want to make clear that CMS and 18F/GSA leadership have been super supportive throughout this project. The challenge we’ve faced has been around timelines and getting our agreements renewed or amended in a timely fashion. Everyone did great work to make sure we kept moving, but we had to put the brakes on due to timing of available funds or ensuring clarity of scope within our agreements. There’s nothing like a work stoppage, even a short one, to take some momentum out of our sails. Large organizations of any kind are a complex interconnection of various legal, financial, information technology, and human resource systems, but it’s important to call out in our environment that it’s not as simple as saying “go build something.” Navigating this system takes time, energy, and work to make sure the path is clear for all parties. Having our contracting officers and legal departments in frequent communication, often with facilitation from members outside our development team, has been hugely critical to moving the project forward.

### What has been the best part of the 18F + CMS collaboration for you?

The people!

As a member of the United States Public Health Service Commissioned Corps, I’ve worked with a variety of amazing people from both public and private sectors, but working alongside 18F/GSA will always be a highlight of my time as an officer. Everyone on the team, past and present, has been so passionate about improving government through digital services. It’s contagious!

The mission of this project has never been about building a new/better widget or to take something paper and make it digital. At the heart of this project, we’re focused on a cycle of continuous improvement - to take something, evaluate it, improve it to serve the public good, then do it all over again.

Working in an Agile way, we can deliver something quickly and test if it’s actually making the lives of our state partners better as they navigate the APD process. If we can support the states in framing their requests in a more structured way—and help federal reviewers make a more expeditious, informed decision—we’ve removed at least one roadblock for states to focus on Medicaid programs to improve the lives of its beneficiaries across the country.

Change is scary and hard, but I hope we’ve inspired others to not be fearful of the journey but to take ownership of our roles in the process and work together to improve the lives of others.

---
title: "Human-centered design for IT centralization, part 4 - What
happens after you centralize"
date: 2019-05-09
authors:
- erin-strenio
- amy-ashida
tags:
- 10x
- it centralization
- best practices
excerpt: "This is Part 4 in a series of posts on the importance of
human-centered design when evaluating IT centralization. In this post,
we’ll share some helpful recommendations for navigating how to be an
in-house IT service provider in a user-centered way"
---

*This is Part 3 in a series of posts on the importance of human-centered design when evaluating IT centralization. As part of a [10x](https://10x.gsa.gov/) project, we've synthesized 18F's learnings from agency partners who’ve been through centralization efforts before and have wisdom to share. The series explores how and why taking the time to prioritize users will mitigate risks and yield services that work better for the people they serve. In this post we’ll discuss what to anticipate after a centralization roll-out.*

Let’s say the CIO of a large agency recently decided to consolidate different recruiting tools used across her agency’s different departments. We’ll call her Sandra. Previously each department was managing their own recruiting systems, processes, and data, but Sandra hoped the new arrangement would decrease the number of systems needed and reduce the burden on individual departments.

Once the organization got through the initial roll-out, Sandra realized there were expectations of the central IT office she hadn’t foreseen. Now all the departments depended on this office to make sure the system
worked. This didn’t just mean the system was up and running — the central IT team was also responsible for making sure the new system delivered on the promised value.

Whenever something went wrong, the IT office got a call. Whenever users were confused about the new system, they went to the IT office with questions. Whenever users had ideas for how things could be better? Yes,
you guessed it. They needed somewhere to go, and it became clear the central IT office was now a service provider. But what does this entail?

After interviewing several folks who’ve experienced some sort of centralization effort, we’ve developed some helpful recommendations for navigating how to be an in-house IT service provider in a user-centered
way:

1.  Commit to continuous improvement
2.  Set up feedback loops to catch issues early
3.  Communicate proactively to build user confidence
4.  Give your users choice
5.  Deliver updates quickly with DevSecOps

Because at the end of the day, if your users aren’t benefiting from the centralization, the overall confusion and complexity might eat up the proposed cost savings.

## 1. Commit to continuous improvement

You just made a big investment and your new centralized service is
available to users. Now your focus needs to shift from delivery to
follow-through. This is often referred to as Operations and Maintenance (O&M), but that sounds like the focus is just making sure things don’t break. In an agile world, delivering something to production is just the beginning.

Now it’s time to shift from asking *how do we make it happen* to *how do we make it even better?*

Continuous improvement builds off the [modular contracting approach]({{ "/2018/10/25/modular-contracting-and-working-in-the-open/" | url }}). It recognizes that there’s always room to grow and it’s often more
effective to make change in increments rather than accumulating large backlogs. This concept applies to staffing, software features, customer service requests, and bug reports.

## 2. Set up feedback loops to catch issues early

Your centralized service won’t run itself — it needs to be actively
managed to ensure the best return on investment. In order to make this shift, you may need to reshuffle roles and responsibilities on your team so they can respond to users in a timely fashion and stay on top of requests. And since needs change over time, you’ll want to stay in touch with your users.

There are two things you can do to make the feedback loops more valuable: collect and analyze.

### Collecting feedback

Setting up feedback loops doesn’t have to be hard. There are plenty of tools out there to help with this process. Here are just a few ways we’ve seen it done:

-   A well-monitored email inbox or support chat
-   A project portal for users to share suggestions
-   A ticketing system
-   Live feedback sessions (group sessions or interviews) with sticky notes
-   Regularly scheduled [interviews](https://methods.18f.gov/discover/stakeholder-and-user-interviews/)
-   Qualitative open-ended surveys (avoid “yes” or “no” questions)
-   Retrospectives
-   In-person observations to see how users interact with the service

### Analyzing feedback

Once you collect the data, it’s important to take some time to
understand what it means. Look for themes across the data to help guide your next steps.

Here are four questions to ask while analyzing feedback:

1.  **Is your service more of a burden than a help?** Keep track of themes in requests as they come in. Catching themes (did you get eight requests for the same thing?) early gives you a chance to solve issues before they become big problems — or before your users give up and your new system goes unused.
2.  **Where is your service most helpful?** Feedback doesn’t always have to be a bad thing. Asking questions about how your service is helping people can identify places to double down. It’s also good to keep an eye out for unexpected ways people are using your service.
3.  **How healthy is your relationship with your users?** The amount of time it takes your team to respond to bug reports and service requests is a good way to measure the health of this relationship. Keep in mind, it’s harder to regain your users’ trust than it is to build it from the beginning.
4.  **How is your service delivering on your intended goals?** Go back to the intended outcomes and success metrics you created in the beginning of the evaluation process to measure performance.

Keep feedback channels open so there’s a shared mindset across the team for continuous sharing, continuous iterating, and continuous improvement. Receiving feedback is only the first part; make sure you respond to your users and communicate what you learned and what you’re doing as a result so users feel heard.

## 3. Communicate proactively to build user confidence

One of the biggest things your users will care about is how centralization efforts impact their jobs. It’s important to stay transparent about all the ways you plan to replace current processes with new, updated processes. Two tools that can help with this are: roadmaps and role-based training materials.

### Share your roadmap

Roadmaps provide a vision of what service offerings look like today and what new things are going to be added or updated in the near future. Creating a roadmap will help your delivery team identify what next steps to take and keep them on the same page. Roadmaps can come in all shapes and sizes, but typically they contain the following:

-   Recent updates and releases
-   High-priority areas
-   Upcoming changes and expected delivery dates

A roadmap also helps your users understand how you’re prioritizing
changes and when to expect those changes to happen. It’s important to keep it up to date and publish it in a place your users can actually find it.

Depending on your IT service, this could be a project landing page, a wiki, a newsletter, a handbook, or even a wall in the office. Making it accessible to your users will help limit fears and frustrations about changes coming out of the blue and reassure users that you’re working to make the service better for them.

### Develop training materials

When people don’t have a common understanding for how a new service
works and what its capabilities are, they will naturally become
frustrated. It’s worth the extra time to develop training materials so users can effectively use new services. Developing these materials is also a great opportunity to put yourself into your user’s shoes and understand how they would approach the service. If you discover usability issues when writing the manual, it’s a great idea to add them to your delivery team or vendor’s backlog.

In one project, 18F worked with an agency to assess their new recruiting system. It was evident that users of the new system had difficulties determining how to perform regular tasks. Before rolling out a new service, think about how it will affect the individual people within your organization. Consider creating role-specific, not just component-specific, digital user manuals that people can easily access when they have questions.

These should be living, breathing training materials — that means it
should be someone’s responsibility to keep them updated and responsive to new issues that arise. Make sure the materials are easy to find and easy to digest, too.

## 4. Deliver updates quickly from DevSecOps

Back to Sandra. After rolling out the new recruiting system, she got her roadmap up and started collecting feedback from users. Her team quickly identified small updates they could make to the system that would bring big value to users. If they could make these updates in a reasonable timeframe, they could show users how serious they were about delivering on promises.

The only problem? They didn’t have a clear workflow with the DevSecOps team (the developers, security folks, and operations team) in place to make these updates. As mentioned in our [last post](https://docs.google.com/document/d/1Y2bQu5oHClyREgJladuS1rJiqeLpxeHCEoybYCx5EY8/edit#heading=h.kdrdr4x0nhsk), DevSecOps is the cross-team crew that will keep things running smoothly. Traditionally these teams have worked in silos. Here are ways you can deliver updates quickly:

-   **Continuous monitoring = continuous improvement**
    Using dashboards and alerts for early signs of risk will help the DevSecOps team react quickly to any signs of threat to the system. When done right, DevSecOps is running tests and security scans often and performing software updates quickly (within days hopefully; within hours ideally). From there, the central IT team can communicate these updates back to users.
-   **Weekly instead of monthly shipments**
    Instead of releasing updates in huge batches every few months, explore how quickly you can get changes to users. Even if this means weekly deployments, your users will appreciate knowing you’re on the ball.
-   **Keep an eye on analytics**
    Once the shipment goes out, see how users react with the updated version. Capture analytics — because analytics are your friend! Are the number of tickets decreasing in regards to this issue? Is it saving people time and increasing efficiency? Designate someone in the IT central office to own the analytics and report any key findings back to the DevSecOps team.

At the end of the day, getting your newly centralized service into the hands of your users is only the beginning. Proactive communication, feedback collection, and follow-through will set you up for success and allow users to continually build confidence in you. This trust is an essential building block of the success of any centralization effort.

*Next in our series, we share a case study spotlighting the U.S. Web Design System. This is a great example of centralization as it shows how a team came together to create a centralized design tool that allows agencies to build consistent digital experiences quickly and at a reduced cost.*

---
title: This is how we start a new project from scratch at 18F
date: 2015-10-06
authors:
- melody
tags:
- platforms
- federalist
- user-centered design
excerpt: "We built the first iteration of Federalist in a matter of months. Today, we’re lifting the curtain and looking at what went into building the platform, so you can get a sense of what it looks like when 18F starts a project from scratch."
image: /assets/blog/federalist/federalist-screenshot.jpg
---

We recently [launched a site]({{ "/2015/09/15/federalist-platform-launch/" | url }}) using [Federalist](https://federalist.18f.gov/), an alpha-stage content management platform that makes it easy and inexpensive for federal agencies to build secure, reliable, and accessible websites.

We built the first iteration of Federalist in a matter of months. Today, we’re lifting the curtain and looking at what went into building the platform, so you can get a sense of what it looks like when 18F starts a project from scratch.

About six months ago, Dave Cole, the lead developer on the Federalist project, first pitched the idea of creating a platform that would build static government websites to the General Service Administration's Office of Citizen Services and Innovative Technologies (OCSIT).

Dave’s [pitch](https://github.com/18F/federalist/blob/master/README.md#initial-proposal) called for a platform that contained templates for common use cases, like a departmental website, a single page report website, API and developer documentation, and a project dashboard.

“Agencies wishing to use a template [could] simply create a cloned copy of the template, add their own content, and modify it to suit their needs,” he said, noting that social, analytics, and accessibility components would be built into each site.

After receiving positive feedback from OSCIT, he sketched out what the platform might look like: It would have a web-based front end that would interface with a JSON API server that would handle authentication, managing users, building sites, and receiving webhook requests from GitHub.

Content creators across the government would not have to worry about linking up services like GitHub, a text editor, and Amazon Web Services or Microsoft’s Azure to create their static sites — Federalist would take care of that for them. And the platform would handle the publishing infrastructure in order to provide scalable, fast, and affordable static hosting for websites across the federal government.

## Coding the site

Soon after he sketched out a proof of concept for Federalist, Dave started working with Brad Nunnally, a designer; Jeremia Kimelman, a developer; and Gail Swanson, a designer and researcher, to research and code the platform.

Much of the team’s initial research came from looking at [notalone.gov]({{ "/2014/05/09/a-few-notes-on-notalone-gov/" | url }}) and [the homepage of healthcare.gov](http://www.digitalgov.gov/2013/05/01/new-healthcare-gov-is-open-cms-free/) — government websites built using similar technology stacks. By creating a platform, the Federalist team knew that lots of government agencies would be able to build similar sites without starting from the ground up.

Jeremia recalled his initial reaction to Dave’s proof of concept and the sense of purpose that underlaid the team’s MVP: “I remember Dave showing us the requirements he had laid out for building a web-based front end that would interface with GitHub and saying, ‘What’s the simplest thing we could initially build to satisfy these requirements?’” said Jeremia. “We then wrote the [initial commit](https://github.com/18F/federalist/tree/6ad14fec13826778d20a2046bdf2e41b36bec660) – which basically was a very, very simple version of what Federalist eventually became.”

After throwing up the initial code, Dave, Gail, and Jeremia sketched out priorities for the platform. The three began working on a more refined proof of concept, and had plans to then build collaboration tools (followed by scalability tools) before approaching users.

But then a client approached them about building a site — and they wanted it soon. The impending deadline shifted the group’s approach.

“At that point, the research we were doing switched into real-time,” said Dave. “As soon as we built the basic platform, we brought on users, which was really helpful. It meant we had to test as we went, and solve the needs of both developers and content creators at the same time.”

Bringing users on board early also helped inform the product’s roadmap. As Jeremia recalled, the team “needed to make sure scalability worked immediately because we had a client and they were going to launch a website.”

In addition to dealing with scalability challenges, the team also had to consider the tricky balance between creating a product for one client and creating a template that could be used by future clients.

Gail recalled the struggles inherent in this situation. “You’re constantly thinking ‘I could use a really inventive layout for this client, but that might not work for future clients.' So it was a constant back-and-forth between a specific implementation of the site and a generalized platform, and bouncing between those two to get something that satisfied on all fronts.” Ultimately, the team found a compromise that incorporated engaging, scalable features, and customizability.

Federalist launched on September 15 and has several other projects on the horizon. The key to its success, said Jeremia, was the team’s thinking in terms of platform and not websites.

“We’re always thinking ‘How do we standardize what we build so we don’t have to start from scratch each time?’” he said. “Federalist does that, and using tools that have already been reviewed for security compliance.”

Convenience, customizability, and ease of use — that’s what Federalist’s platform strives to provide to agencies. “[That’s] what we wanted to turn around and offer people,” Jeremia said, stressing that the pre-approval of components makes it easier for agencies to set up and use the platform.

To date, Federalist has enjoyed notable success, but the team isn’t resting on its laurels. They’re continually collecting feedback from users and identifying ways to make their product even more usable and user-friendly. They’d love your feedback, too: If you have thoughts to share, [you can contact the team here](https://github.com/18f/federalist/issues) or [sign up for the alpha platform here](https://docs.google.com/forms/d/1iB8aW7c9r1QH3s8XElQCrnXRGjAiPUYpWG1CMeEqGIo/viewform).

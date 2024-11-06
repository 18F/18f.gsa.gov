---
date: 2024-06-18
title: >
 Back to basics in the age of AI
authors:
  - elisa-chen
  - julia-lindpaintner
  - elyse-voegeli
tags:
- 18f
- machine learning
- ai
- design
- user-centered design
excerpt: >
 The federal government is abuzz with conversation about the way that artificial intelligence (AI) is going to change the game. Since 18F partners with agencies to drive technology modernization forward, our ability to navigate the opportunities and risks associated with AI is critical. But as we’re learning new things, we also find ourselves going back to basics. As we evaluate and use AI, we can rely on many of the same practices that we apply to any other new technology. Read on for a quick overview of AI, its place in government today, and the techniques and frameworks we’re using as we navigate this new landscape.
---

The federal government is abuzz with conversation about the way that artificial intelligence (AI) is going to change the game. Since 18F partners with agencies to drive technology modernization forward, our ability to navigate the opportunities and risks associated with AI is critical. But as we’re learning new things, we also find ourselves going back to basics. As we evaluate and use AI, we can rely on many of the same practices that we apply to any other new technology. Read on for a quick overview of AI, its place in government today, and the techniques and frameworks we’re using as we navigate this new landscape.

## Defining AI

"AI" refers to software that can do human-like tasks. For example, solving problems or "recognizing" the contents of a photograph. The phrase "artificial intelligence" can sound very futuristic and even alarming. In reality, the word "intelligence" is somewhat of a misnomer and we’ve been using forms of AI in our day-to-day work and lives for many years. A simple type of AI is a spelling or grammar checker. Big advancements in recent years have certainly created powerful new tools, but the underlying technology is familiar.

While there are many forms of AI, some of the more common ones include:
- Machine learning (ML) — the application of AI that allows computers to learn and improve on tasks without being explicitly programmed to do so
- Natural language processing (NLP) — a type of machine learning model that allows computer systems to understand digital text and spoken human language, like voice assistants or smart speakers (e.g., Siri, Alexa)
- Large-language models (LLM) — a type of machine learning model that is pre-trained on large amounts of data to predict and generate language, like the “auto-complete” feature in emails or text messages

Like with any new technological advancements, the use of AI has pros and cons. AI can automate rote tasks, reduce human error, or perform complex analysis in seconds. At the same time, AI can perpetuate biases based on the data it ingests, not recognize edge cases, be used to cheat, and contribute to disinformation (e.g., deep fakes). Like most technology, AI is neither good nor bad in and of itself — it’s all about the application and use cases.

## AI in government

In fall 2023, the Biden Administration released an [AI Executive Order](https://www.whitehouse.gov/briefing-room/presidential-actions/2023/10/30/executive-order-on-the-safe-secure-and-trustworthy-development-and-use-of-artificial-intelligence/), encouraging agencies to harness the potential of AI to solve urgent challenges, but stressing the importance of doing so responsibly and safely. That mandate has begun to be operationalized through OMB’s [first government-wide policy on AI](https://www.whitehouse.gov/wp-content/uploads/2024/03/M-24-10-Advancing-Governance-Innovation-and-Risk-Management-for-Agency-Use-of-Artificial-Intelligence.pdf), which outlines expectations for agencies to use it in smart, ethical, and equitable ways. To further support these goals, a [National AI Talent Surge](https://ai.gov/apply/) is underway.

In the meantime, [AI is already in use](https://ai.gov/ai-use-cases/) across the government. Many applications focus on increasing the government’s ability to serve the public, accelerating data analysis and synthesis, or saving time for public servants by accomplishing rote or tedious tasks.

Some specific examples of AI in action today:
- Powering chatbots. Multiple agencies are using natural language processing to power chatbots that can help the public navigate their websites and services more efficiently. For example, the Department of Education’s “[Aidan Chat-bot](https://www2.ed.gov/about/offices/list/ocio/technology/ai-inventory/index.html)” answers common financial aid questions and helps students get information about their federal aid on [StudentAid.gov](http://studentaid.gov/). In just over two years, Aidan has interacted with over 2.6 million unique customers.
- Cleaning data. Agencies are applying machine learning and natural language processing techniques to clean and normalize a variety of data. For instance, the [Department of Homeland Security uses artificial intelligence](https://www.dhs.gov/data/AI_inventory) to verify, validate, correct, and normalize addresses and identification information to help correct data entry errors, connect information about a person across datasets, and save time on investigations.
- Taking a first pass. [An application at the Department of Justice scans documents](https://www.justice.gov/open/archives/page/file/1517316/dl) and looks for attorney/client privileged information based on keywords. At the National Archives and Records Administration, [a tool is planned to automatically redact personal information](https://www.archives.gov/data/ai-inventory) from records being prepared for release through the Freedom Of Information Act. At the General Services Administration, [USAGov and USAGov en Español use AI to group data from survey comments, web searches, and more ](https://tech.gsa.gov/ai-inventory/)into topics to help identify opportunities for updates and enhancements. In each of these cases, AI is accelerating a process with human support and oversight.

You can find many other examples of AI in use at [https://ai.gov/ai-use-cases/](https://ai.gov/ai-use-cases/).

## How 18F is navigating AI

### Leaning on what we know

While AI may seem daunting and overwhelmingly technical, the good news is that many of our current design practices are still relevant in navigating AI.

Here are some of our practices and ways of thinking that we’ll be relying on as we explore AI alongside our partners.

**Examining who is involved in projects.** In real-world use, technology is not neutral — it produces what humans design it to do. Having a clear understanding of who is designing the application directly impacts what is being designed. One of the first steps to mitigating harm is to name the visible and invisible ways that power dynamics exist in our work. At 18F, we use a few different methods to examine our own positionality and the power dynamics that brings.

- Use tools that help identify [power dynamics](https://guides.18f.gov/ux-guide/research/share-power/) on your project - such as those relating to   race, gender, age, ability status, language, class, etc., and how those can lead to potential biases in what is being designed.
- [Stakeholder mapping](https://guides.18f.gov/methods/discover/stakeholder-influence-mapping/) is a way to visualize who holds influence in a project and uncover invisible or visible power dynamics that can introduce bias.

**Identifying/minimizing bias.**  Any technology — including AI — can replicate human biases, assumptions, or preconceived notions.  One of the particular risks of AI is the ability to automate or replicate these biases at very large and fast scales. At 18F, we strive to be aware of and reflective of our own biases and create avenues of accountability.

- Learn more about [how 18F identifies and minimizes bias in our UX guide](https://guides.18f.gov/ux-guide/research/bias/).

**Surfacing potential harms to groups.** Carefully thinking through potential harms to different groups of people is a critical part of engaging with AI ethically. Because of the potential scale and impact of harm through the usage of AI, it is more important than ever to be thoughtful and cognizant of unintended harmful consequences.

- Learn more about [how 18F considers ethics in our UX guide](https://guides.18f.gov/ux-guide/research/ethics/).

### Incorporating new techniques

As we continue to navigate our evolving landscape, 18F is exploring the following considerations and practices to help us more effectively and responsibly harness the powers of new technologies.

**Designing to actively protect human vulnerabilities.** Human tendencies have helped us to evolve and survive over generations — whether it's choosing sweet, fatty foods for readily available energy or following popular opinions of those around us to build stronger communities with others. Technology can easily exploit these human vulnerabilities or biases for harm, whether intentionally or unintentionally. As government practitioners, we must intentionally design solutions that protect human vulnerabilities.

The Center of Humane Technology’s [humane design guide](https://s3.amazonaws.com/com.appolearning.files/production/uploads/uploaded_file/0fd922be-3bbc-46ea-b1a2-fdeb8eb4e3d5/Humane_Tech_Design_Guide.pdf)[^1] is an activity to assess a product or feature across six categories of human vulnerabilities and to identify actions to protect or support your users.

**Thinking beyond the current context.** We often design products thinking about its use in the current context, but what we design will likely outlive that timeframe. Designing for an ever-changing world requires us to consider the potential futures in which our solution will exist.

Identifying externalities, with tools like a [Futures Wheel](https://en.wikipedia.org/wiki/Futures_wheel), before designing products, services, or features creates space to discuss any downstream consequences of our designs, whether positive or negative, intention or unintentional, or short or long term, across multiple factors.

**Going beyond the happy path.** It’s common to create and test solutions for and with people who plan to use the solution as intended. But how often do we consider and protect against adversarial actors? How might they use our design for harm?

Anti-personas are archetypes of user groups that misuse a solution, potentially creating harm for your intended audience or your organization (e.g., people who hack into a system to steal and misuse data). You can create anti-personas the same way you create [personas](https://methods.18f.gov/decide/personas/) — the key difference is exploring how adversarial actors might use your solution for harm and defining ways to mitigate.

You can test your anti-personas through situational testing practices, like [red teaming](https://csrc.nist.gov/glossary/term/red_team_exercise), where a predefined bad actor (e.g., your anti-persona) gains access to your product, feature, or service in a simulated environment and attempts to misuse it. The internal team can respond to the bad actor, practicing their internal defensive procedures. Red-teaming can also be in the form of a simple discussion of different scenarios of how anti-personas might exploit your solution before you start prototyping it. In any case, scenario-based practices are meant to surface potential risks and vulnerabilities, evaluate your team’s response in those situations, and reduce harm to your users and your organization.

## Looking ahead

While we upskill and build capacity in AI, we’re regrounding ourselves in many of our established practices while we explore newer ones. Just like us, you probably have a lot of tools you can use as you learn about and bring AI into your work — don’t disregard them!

If you’re in government, join the [AI community of practice](https://coe.gsa.gov/communities/ai.html), a space for government employees to learn and share about how the government can foster thoughtful and responsible use of AI. If you’re an AI professional, consider [bringing your talents to bear](https://ai.gov/apply/) in the federal government.

As technologists, there are 18Fers with dexterity to advise on how you might [leverage the power of AI]({{ "/AI-services/" | url }}).  [Reach out to 18F]({{ "/AI-services/" | url }}) if you’re interested in exploring what this might look like for your agency.

[^1]: The GSA.gov website includes hypertext links, or pointers, to information created and maintained by other public and/or private organizations. We provide these links as a public service only; the U.S. government, including GSA, neither endorses nor guarantees in any way the external organizations, services, advice, or products included in these website links. When you select a link to an outside website, you are leaving the GSA.gov site and are subject to the privacy and security policies of the owners/sponsors of the outside website.

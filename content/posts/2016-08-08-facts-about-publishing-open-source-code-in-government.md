---
title: "Facts about publishing open source code in government"
date: 2016-08-08
authors:
- britta-gustafson
- will
tags:
- open source
- tools you can use
excerpt: "We’ve put together a list of facts and references that will help you build the case for open source development in your team or agency and bust myths about using public code repositories. This post is based on our experiences at the federal level, but we hope it’s helpful for anyone working in government."
description: "We’ve put together a list of facts and references that will help you build the case for open source development in your team or agency and bust myths about using public code repositories."
image: /assets/blog/github-facts/wh-astronomy-night.jpg
image_figcaption: <a href="https://obamawhitehouse.archives.gov/the-press-office/2015/10/20/remarks-president-astronomy-night">President Obama and the MythBusters team welcomed students to ‎Astronomy Night‬ at the White House</a>
---

At 18F, we believe that [developing software in the open has many benefits](https://github.com/18F/open-source-policy/blob/master/policy.md), and we write about our [open source work as much as we can]({{ "/2014/07/31/working-in-public-from-day-1/" | url }}). We get questions from other people in the federal government because they’ve run into legal and practical uncertainties when seeking permission to work in the open from their agency or team.

We’ve put together a list of facts and references that will help you build the case for open source development in your team or agency and bust myths about using public code repositories. This post is based on our experiences at the federal level, but we hope it’s helpful for anyone working in government.

### Fact: Many parts of the federal government already approve use of public repositories for open source software development.

*Myth: “Public repositories are an emerging technology without widespread government use. The people using them are probably not paying full attention to compliance.”*

Developing in the open and using public commercial hosting services is an accepted practice in many agencies and offices of the federal government. For example, along with the [General Services Administration (GSA)](https://github.com/gsa) and the [Library of Congress](https://github.com/LibraryOfCongress), more than two-thirds of [Cabinet-level agencies](https://www.whitehouse.gov/administration/cabinet) maintain sets of public code repositories, including [Agriculture](https://github.com/usda), [Commerce](https://github.com/CommerceDataService), [Defense](https://github.com/deptofdefense) (and combat support agencies like [NGA](https://github.com/ngageoint) or the [Army Corps of Engineers](https://github.com/erdc)), [Education](https://github.com/usedgov), Energy (57 repositories including [NREL](https://github.com/NREL)), [EPA](https://github.com/usepa), [Office of the Director of National Intelligence](https://github.com/info-sharing-environment), [HHS](https://github.com/hhs), [Homeland Security](https://github.com/usDHS) (including [NCATS](https://github.com/dhs-ncats)), Interior (17 including [USGS](https://github.com/usgs) and [NPS](https://github.com/nationalparkservice)), [Justice](https://github.com/usdoj), [Labor](https://github.com/usdepartmentoflabor), [OMB](https://github.com/WhiteHouse), [State](https://github.com/USStateDept), Transportation (via the [FAA](https://github.com/Federal-Aviation-Administration)), [Treasury](https://github.com/fedspendingtransparency), and the [VA](https://github.com/department-of-veterans-affairs). In our own work, 18F has collaborated with more than 25 federal agencies on open source projects in public repositories.

Some parts of government also use public repositories for collaboration on content with the public. For example, the White House Office of Management and Budget uses public repositories to gather [public input on draft policies](https://github.com/WhiteHouse), including its [Federal Source Code Policy](https://obamawhitehouse.archives.gov/blog/2016/08/08/peoples-code). The National Institute on Standards and Technology (NIST) used a public repository [to solicit feedback on public previews](https://pages.nist.gov/800-63-3/#why-github) of draft guidance.

### Fact: 18F and other federal teams publicly collaborate on code while complying with relevant federal policies.

*Myth: “Agencies can’t release code on vendor-run repository hosting websites because it’s not compliant with what we’ve heard about federal requirements (for example: we don’t control the servers; everything on a .com domain must also be on a .gov domain).”*

There are several teams across government that publish helpful documentation about their internal policies and practices for compliant open source development. For example, here are details about how 18F complies with relevant requirements [in our work](https://github.com/18F):

- Our parent agency, the GSA, has a [CIO Information Technology (IT) Integration Policy](http://www.gsa.gov/portal/directive/d0/content/673470) that supports publicly releasing GSA software as open source code. For more about GSA’s support of open source, see [this list of GSA IT’s key initiatives](https://gsablogs.gsa.gov/gsablog/2015/10/13/our-gsa-it-mission-and-priorities/) and the [GSA Open Source Framework](https://github.com/GSA/opensource-framework/blob/master/Framework.md).
- 18F has a public [open source policy](https://github.com/18F/open-source-policy) and [team practices](https://github.com/18F/open-source-policy/blob/master/practice.md) that guide our development of [open source code](https://github.com/18F).
- We use a public code hosting service with Terms of Service [compatible with government use](http://www.digitalgov.gov/resources/negotiated-terms-of-service-agreements/); other government-friendly Terms of Service amendments [are listed here](http://www.digitalgov.gov/resources/negotiated-terms-of-service-agreements/).
- We comply with FISMA requirements by having all employee accounts and project teams configured in a standard way, as documented in the [FISMA Ready project](https://github.com/fisma-ready/introduction) page [here](https://github.com/fisma-ready/github). Our new hire onboarding process outlines how to configure public repository accounts to that standard, and we have [an employee handbook page](https://handbook.18f.gov/github/) that lists our public repository usage rules.
- We only use open code repositories for information that is public (such as hosting our open source code) or would not be a problem if unexpectedly made public (such as a few non-public repositories with team planning information).
- Specifically, we do not store sensitive personally identifiable information (PII), environmental configuration variables, or passwords on the service (also an industry best practice).
- We regularly export our work to comply with recordkeeping requirements and to have backups if a public repository has problems.
- We don’t endorse any vendors in our blog, website, and other internal and public materials.

Other agencies and teams publish documentation about their open source policies and guidelines, which can also inform your implementation. Here are some examples:

- The Consumer Financial Protection Bureau (CFPB) uses [this source code policy](http://cfpb.github.io/source-code-policy/) to manage [its code on public repositories](https://github.com/cfpb). The CFPB has also published a [blog post](http://www.consumerfinance.gov/blog/the-cfpbs-source-code-policy-open-and-shared/) and [talk](https://www.youtube.com/watch?v=tce1B02ZGqc) with more details.
- The Department of Defense has been a pioneer in using and releasing open source code in government, and their [Open Source Software FAQ](http://dodcio.defense.gov/OpenSourceSoftwareFAQ.aspx) has useful details about open source (including the security of releasing government code as open source).
- The Department of Homeland Security has a [Privacy Policy and Notice for collaborative development of software](https://www.dhs.gov/github-privacy-policy-and-notice).
NASA has an [open source policy](http://code.nasa.gov/#/guide) that discusses the benefits of their [incremental development in public](https://github.com/nasa).

### Fact: Public code services enable federal staff to fully control access and permissions for official repositories.
*Myth: “Public repository hosting services are social networking tools with dubious collaboration features; using them would lead to our projects getting unreliable external code mixed into our official work.”*

As an example, 18F’s staff controls and decides what code goes into our repositories. For almost all of our projects, we only allow the public to make suggestions to our official repositories (in the form of [pull requests]({{ "/2015/03/03/how-to-use-github-and-the-terminal-a-guide/" | url }})), and we carefully review those suggestions before deciding whether to accept them. We’ve also developed clear policies for work with outside-of-government collaborators, [guided by FISMA Ready standards](https://github.com/fisma-ready/github#teams).

### Fact: Agencies that do classified work can release code that isn’t sensitive.
*Myth: “All of the code we develop is sensitive and protected by security exceptions. It can’t be released in the open.”*

There are several agencies that do classified work and release code that isn’t sensitive. If your agency or team works with sensitive information and has concerns about releasing any code, we’d suggest investigating whether you have a blanket policy for all code. For example, these agencies deal with classified work and still share some non-sensitive code publicly:

- The [National Security Agency](https://github.com/NationalSecurityAgency) released code and documentation for its [System Integrity Management Platform](https://github.com/NationalSecurityAgency/SIMP).
- The [National Geospatial-Intelligence Agency](https://github.com/ngageoint) releases open source projects and [discusses them publicly](https://fcw.com/articles/2015/09/28/nga-open-source.aspx), such as its [GEOINT Pathfinder project](https://www.nga.mil/MediaRoom/PressReleases/Pages/GEOINT-Pathfinder-project-yields-new-open-source-coding-projects-available-to-public.aspx).
- The [US Army Research Laboratory](https://github.com/usarmyresearchlab) has released public projects including the [Dshell](https://github.com/USArmyResearchLab/Dshell) network forensic analysis framework.

### Fact: The White House considers open source software a priority for its [open government efforts](https://obamawhitehouse.archives.gov/open/partnership/national-action-plans). Releasing code publicly provides several benefits to agencies.
*Myth: “Releasing open source code is not a priority. Our current closed-source practices are fine.”*

Just today, [the White House released](https://obamawhitehouse.archives.gov/blog/2016/08/08/peoples-code) its [federal source code policy](https://sourcecode.cio.gov/) ([PDF link](https://obamawhitehouse.archives.gov/sites/default/files/omb/memoranda/2016/m_16_21.pdf)) that requires agencies to begin developing policies that will require releasing a portion of custom-developed code as public open source. In other words: most agencies will be required to do some open source work, so it’s helpful to start work on this soon. Prior to this, the federal government built many important projects using open source code. The Consumer Financial Protection Bureau built an open source [tool](http://www.consumerfinance.gov/find-a-housing-counselor/) using open data from the Department of Housing and Urban Development to find nearby free housing counselors for those struggling to make mortgage or rent payments. 18F and the Presidential Innovation Fellows built [notalone.gov](https://notalone.gov/) to help survivors of sexual assault can find resources and data. The [College Scorecard](https://collegescorecard.ed.gov/) and its underlying data API were also all built with open source code.


Here are a few federal explanations of the benefits of open source development:

- The [federal source code policy](https://sourcecode.cio.gov/) discusses how code reuse can have significant benefits for American taxpayers, such as reducing vendor lock-in, decreasing duplicative costs for the same code, and increasing transparency across the federal government.
- The [18F open source policy](https://github.com/18F/open-source-policy/blob/master/policy.md) explains important benefits including rapid prototyping, easy collaboration, community involvement, peer review, cost savings, and reusability.
- 18F’s Partnership Playbook explains[ why we work in the open](https://pages.18f.gov/partnership-playbook/1-build-in-the-open/) with federal partners and how our projects benefit from the open collaboration.
- The United States Digital Service created the [Digital Service Playbook](https://playbook.cio.gov/#play13), which includes the best practice of [defaulting to open](https://playbook.cio.gov/#play13).

### Fact: There are supportive resources available for federal teams who want to start working in the open.
*Myth: “Our team can’t use a commercial code hosting service without unreasonable effort. I’m not allowed to even contribute to a different agency’s repositories.”*

- It’s free to open public repositories on some platforms.
- Some public repositories have [federally compatible Terms of Service](https://www.digitalgov.gov/resources/federal-compatible-terms-of-service-agreements/). Our colleagues in the Technology Transformation Service can work with your agency to find open source code sharing services that have Terms of Service that work for your agency.
- Somebody at your agency might have already given somebody else at your agency permission to use the service. Try checking to see if your agency already has a presence on a public repository hosting service. If you don’t see an example use case, we’d suggest reaching out to someone with appropriate authority to release information, such as the head of Information Resources. We’ve learned that every agency is different; the specific path to using public code repositories may vary.
- If you run into restrictions from your agency on participating in public government projects on repository hosting services, you can [reach out to the Office of the Federal CIO](https://github.com/project-open-data/project-open-data.github.io/issues/346#issuecomment-169140589).
- If you’re trying to help your government team start working in the open but are running into barriers, you can reach out to us at [18f@gsa.gov](mailto:18f@gsa.gov). We’d like to help you if we can, such as by answering a specific question.

We hope this is useful. Please [open an issue](https://github.com/18F/18f.gsa.gov/issues) if you have another question, and [make use of our repositories]({{ "/2016/04/06/take-our-code-18f-projects-you-can-reuse/" | url }}) as much as you want!

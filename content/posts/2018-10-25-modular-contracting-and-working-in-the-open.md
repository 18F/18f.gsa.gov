---
title: "Modular contracting and working in the open"
date: 2018-10-25
authors:
- mheadd
- ed-mullen
tags:
- acquisition services
- alaska
- public benefits 
- lessons learned
- modular contracting
- open source
- state and local practice
excerpt: "Working in the open is a key component of building trust
between governments and vendor partners. Read about how the State of
Alaska is using openness and code sharing to foster greater trust
between government project teams and vendor teams as part of a large
legacy system overhaul."
image: /assets/blog/modular-contracting/i-see-what-you-did-there.jpg
---

In 18F’s work with federal and state partners on technology
procurements, we often help introduce new concepts like Agile, DevOps,
human-centered design, and product thinking to enable our partners to
engage with vendors more successfully. One of the critical strategies we
bring to these engagements is working in the open.

18F’s partners are typically coming off of a failed relationship with a
vendor. A previous project may have ended badly, failed to produce the
desired outcomes, and — sometimes — even resulted in litigation. The
bottom line is that there may often be a lack of trust between our
federal and state partners and the vendors that they must engage with to
deliver the digital solutions their constituents expect and need.

A major focus of our acquisition consulting engagements is to help
rebuild this trust, and to foster a healthy, productive relationship
between agencies and vendors.

One of [the ways that we help develop trust](https://modularcontracting.18f.gov/) and foster a more
productive relationship is by designing a collaborative process that is
built on transparency — working in the open is an essential ingredient
to building better relationships with vendors. A great example of how
openness and transparency can foster a more productive relationship
between agency and vendor can be seen in our work with the [State of Alaska]({{ "/2017/09/12/how-alaska-is-using-transparency/" | url }}).

After a monolithic contract with a vendor ended poorly, the State of
Alaska brought in the 18F team to help them develop new processes and to
implement a modular procurement strategy to modernize their legacy
public benefit eligibility system. A core component of these new
processes and the modular strategy is openness.

Early in our engagement with Alaska, we helped the team in the Division
of Public Assistance (DPA) adopt [DevOps practices]({{ "/2018/01/25/getting-devops-buy-in/" | url }}) and
to establish a [build and deployment pipeline]({{ "/2018/02/01/moving-a-legacy-microsoft-environment-to-the-azure-cloud/" | url }})
to allow the state to accept work from outside vendors. As originally
envisioned, the process for vendors to deliver work to the state was to
happen [via a pull request](https://github.com/AlaskaDHSS/RFP-Search-Unification/blob/master/2-QAP.md#procedures)
from a vendor-controlled git repo to a state-controlled git repo at the
end of each sprint. In practice, however, the process worked slightly
differently and had some unexpected positive results.

The DPA has targeted the Microsoft platform as its technology stack of
choice for its legacy system modernization efforts, and uses [Visual Studio Team Services](https://visualstudio.microsoft.com/team-services/) (VSTS) to
manage work for its CI/CD pipeline and for version control. When the
vendor for the first modular contract began work, DPA staff created a
git repository within VSTS to house all the project code, and
established a separate branch within that repo for the vendor to work
in. So, instead of the vendor using its own git repo (either locally, or
using another git-based platform like GitHub or Gitlab), they were able
to use a separate branch within the main VSTS git repository for this
work. At the end of each sprint, the vendor submitted a pull request
from their git specific branch to the branch designated by the state for
further review and acceptance.

This working arrangement provided enhanced visibility into the vendor’s
work. The DPA team could see the work that was occurring in the vendor
repo as it was committed each day by vendor staff. This helped state
staff understand what was happening during the sprint, and obviated the
need to wait until the end of each sprint to start evaluating code. This
helped DPA staff better understand what the vendor was doing, and helped
foster a sense of trust between the vendor and the state.

Several members of the state team commented on this arrangement and
noted that it helped foster a sense of trust and collaboration with the
vendor. When we conducted a post mortem after the vendor had finished
their work, the Alaska team identified [the trusting collaborative nature of the relationship](https://github.com/AlaskaDHSS/EIS-Modernization/blob/master/first-buy-postmortem.md#what-worked-well) as one of the things that went well with the project.

The lesson from this experience with the State of Alaska is that
establishing good DevOps practices and tools and embracing working in
the open are not only important to the success of a modular contracting
approach, they can help foster more trusting, productive relationships
between agencies and vendors.

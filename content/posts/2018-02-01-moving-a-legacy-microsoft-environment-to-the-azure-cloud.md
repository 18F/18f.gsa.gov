---
title: "Moving a legacy Microsoft environment to the Azure cloud"
date: 2018-02-01
authors:
- clinton-troxel
- waldo-jaquith
tags:
- encasement
- legacy
- technical guides
- modern practices
excerpt: "Securely connecting Azure with an on-premises server environment provides the benefits of a modern, cloud infrastructure, while making it trivial for application developers to interface with an on-premises legacy environment."
image:
redirect_from:
-  /2018/02/01/transitioning-a-legacy-microsoft-environment-to-the-cloud/
---

In our work with government agencies, we sometimes help them move from legacy systems to modern systems. A tricky proposition no matter how you do it, we’ve had great luck using an [encasement strategy]({{ "/2014/09/08/the-encasement-strategy-on-legacy-systems-and-the/" | url }}).

Generally, when we use an encasement strategy on legacy systems, one of our goals is to facilitate access to legacy data sources from the cloud so developers can rapidly prototype a new, modern system. Often, these legacy data sources are on an agency’s premises. For example, this might mean deploying a Node-based website to a cloud-based platform as a service that is backed by an on-premises [Adabas server](https://en.wikipedia.org/wiki/ADABAS), along with the communication and security infrastructure to connect the two. Client-side data sources might include SOAP services, a legacy RDBMS, or a custom web-service layer brokering access to a mainframe database.

As a rule, we don’t want to write any custom code that isn’t absolutely necessary. We prefer platforms and services over hand-rolled infrastructure. Writing secure system-interface software that bridges on-premises and cloud is extraordinarily difficult to do well. Custom software written needlessly is software that instantly becomes legacy software, and that leaves agencies with a shiny, new problem to replace their dusty, old problem.

Our partner in this case is running a combination of legacy mainframes and modern Microsoft Windows servers, and they want to stay within the Microsoft ecosystem. So we’ve chosen to use [Microsoft’s Azure cloud computing service](https://azure.microsoft.com/) to house their new software. To connect their legacy mainframe to this software, we’re using [Azure Hybrid Connections](https://docs.microsoft.com/en-us/azure/app-service/app-service-hybrid-connections). This is a relay that runs under the hood, requiring no customizations to the agency’s software or the software that we’re writing for them. By running Microsoft’s small Hybrid Connection Manager program on the agency’s on-premises server, we can expose host/port pairs from their intranet for access from within the Azure environment. This granularity, combined with the fact that Hybrid Connections is [certified FedRAMP High](https://www.fedramp.gov/provide-public-comment/fedramp-high-baseline/), have made discussions with the agency’s security office much simpler than they might otherwise be.

Data piped over this connection comes from different systems in a variety of formats, which is a mess for application developers to deal with. So we don’t merely expose these various data sources, but instead pipe them through simple API endpoints that convert each one from its native format to JSON. By normalizing away the complexity, we’re able to provide application developers with a straightforward interface to legacy data sources.

Securely connecting Azure with our partner’s on-premises server environment provides all of the benefits of a modern, cloud infrastructure, while making it trivial for application developers to interface with an on-premises heterogeneous legacy environment. For future engagements with agencies who are committed to using Microsoft tools, we’ll begin by proposing this split approach, unified by Hybrid Connections.

_Editor’s note: We choose to use the phrase “[encasement strategy]({{ "/2014/09/08/the-encasement-strategy-on-legacy-systems-and-the/" | url }})” rather than “strangler pattern” to refer to the technique [described by Martin Fowler](https://martinfowler.com/bliki/StranglerApplication.html). We’ve found that the word “strangler” can distract unfamiliar audiences from the substantive issues of a blog post._

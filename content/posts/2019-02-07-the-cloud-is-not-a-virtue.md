---
title: "Cloud is not a virtue"
date: 2019-02-07
authors:
- afeld
- laura-gerhardt
tags:
- lessons learned
- best practices
excerpt: "Federal agencies, like every other industry, are moving to cloud computing for their infrastructure. The economies of scale lead to a number of benefits, but unfortunately, having a server launched in the cloud does not magically make infrastructure better. Government should leverage cloud wisely to yield benefits"
---

Federal agencies, [like every other industry](https://www.forbes.com/sites/louiscolumbus/2017/04/23/2017-state-of-cloud-adoption-and-security/#564bd0841848), are moving to cloud computing for their infrastructure. The economies of scale lead to a number of benefits, but unfortunately, having a server launched in the cloud does not magically make infrastructure better. Government should leverage cloud wisely to yield benefits; **lift and shift strategies miss valuable opportunities for modernization.** What should we focus on instead?

## Pressure

Moving to the cloud has been a White House priority in both the current and previous administrations from the [Cloud First policy](https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/egov_docs/federal-cloud-computing-strategy.pdf), to the [Data Center Optimization Initiative](https://policy.cio.gov/dcoi/transition-to-cloud-datacenter/), and most recently in the [Executive Order on Strengthening the Cybersecurity of Federal Networks and Critical Infrastructure](https://www.whitehouse.gov/presidential-actions/presidential-executive-order-strengthening-cybersecurity-federal-networks-critical-infrastructure/).

Despite this pressure, [under half of government organizations are actively using cloud services.](https://www.gartner.com/smarterwithgartner/understanding-cloud-adoption-in-government/)
When agencies *do* make the move, it is **too often about checking a box rather than using cloud in a way that meets NIST’s definition of
cloud.** Recognizing this shortfall, the Federal Chief Information Officer has sought to reframe cloud migration to highlight desired outcomes.

<blockquote class="testimonial-blockquote">
  “A cloud migration strategy should not be considered a question of who owns the computing resources, data, and facility, but rather can this solution improve service delivery to citizens. Evaluating specific capabilities of services, such as automatic scalability, is useful when evaluating solutions, rather than just considering if an application is “cloud” or not.”
  <span>- From Cloud First to Cloud Smart </span>
</blockquote>

The cloud is not a virtue. Saying you are “in the cloud” is not the
point. Cloud is really about improving your agency’s ability to adapt to
changing mission needs by outsourcing common IT infrastructure problems to reliable, mature, secure, commodizided services.

## Outcomes

So what *is* important? When it comes to infrastructure, **focus on the outcomes rather than the technology.** You should optimize your system around two core benefits: agility and reliability which includes security.

### Agility

Creating new environments with the click of a button lowers the effort for iteration, thus increasing the velocity of a project. When it’s easy to test things outside of production that mirror production’s configuration, it’s less likely bugs are going to make it to production. Faster iteration also allows you to learn from the system being out in the wild. Real world use from end-users will give you insights that cannot be learned from testing, and further iteration allows you to focus on solving the next problem.

The cloud enables agility by providing:

- A suite of **optimized services** for your mission needs paid for through **commoditized pricing**
- **Self-service** to let you access those services quickly
- **Scalability** to draw up and down those services as needed

Moreover, the **broad access** of cloud software allows your team to
work from wherever they’re physically located.

**Optimized Services:** A cloud provider can provide you with a suite of services from data stores, databases, computing power, etc, to allow you to meet common computing needs. You should be able to access these a la carte and combine them **allowing your agency to focus on its core mission**, rather than maintaining costly and custom implementations of core features.

**Commodity pricing:** In a cloud, you should only have to pay for a
service as you use it. These measured services cover both the direct and indirect costs of providing you a service.

**Self-Service:** Developers and product teams can access an additional server, a new DNS configuration, or other services without human interaction or filing a help desk ticket. If you’re waiting a month to receive a single server or even for a whole cluster, you have violated the cloud virtue of agility.

**Scalability:** When managing its own hardware, an agency must supply enough computing power to meet its peak demand without concern as to how often that peak demand occurs. This often results in expensive hardware sitting idle except for a very small period (such as on April 14th for the IRS’s tax filing system). **Cloud allows an agency to better control its costs** by dynamically scaling its supply of computing resources to meet the actual demand.

**Broadly Accessible:** In an agile context, you shouldn’t be limited by where you are to access your cloud resource. You can access your service from anywhere, on your mobile phones, tablets, laptops, and workstations, and so can your customers.

### Reliability

Just like we’ve come to depend on smartphones or personal email, cloud is at a level of maturity that your hardware and operational concerns should be completely taken care of. Cloud services offer
**availability**, **security**, **recoverability** to retrieve data or restart application faults, and **audibility** to meet both compliance and debugging objectives.

**Availability:** With multiple availability zones and regions for any FedRAMPed product, uptimes claims are guaranteed to be high. If your cloud has less than 99 percent availability (down less than two hours a week on average), you aren’t receiving the benefits of the cloud. In the cloud, your hosting environment should no longer be a concern.

**Security:** Cloud service providers probably have much larger security teams than you do, and their business is built on maintaining the trust of their customers.

**Recoverability:** A side benefit of cloud scalability is its
redundancy, which allows you to swap out a flagging or failing resource easily through replicating or activating mirrored systems as well as quickly saving back-ups. Cloud systems also can be resilient against increased use by bringing online additional resources when loads increase.

**Auditability:** Cloud services can be provisioned and configured
through API’s and code, which provides a virtual paper trail of who created or
changed what in an environment and when they changed it. These actions to create and manage resources are also readily logged by cloud service providers, generating a compliance-ready manifest of infrastructure activities. A handy side benefit of these auditable actions is that they can help product teams debug and triage site bugs and performance issues.

**If you can achieve high agility and incredible reliability using a
data center or [even a
mainframe](https://www.youtube.com/watch?v=7Tcv9Jj6QmM), go for it!** Note, however, this is very difficult to do when you’re dealing with
hardware.

## Migration

If you do decide to move to the cloud, don’t treat it like a data center and let a good migration go to waste. Lift and shift is a missed opportunity. Even if you aren’t rebuilding the software, increase the level of automation around it, leverage managed services instead of running your own, and minimize the developer burden to deploy.

### Start small

Rather than trying to migrate an entire system from a data center to the cloud all at once, **start small**. Deploy the smallest component you can think of, which could be just a single line of text displayed in a browser, and work to obtain an Authority to Operate (ATO) for the prototype. Doing so will force you to **get your security and compliance teams involved early**, and view the challenges of migrating to the cloud from a compliance perspective, and limit the scope of their concerns for each assessment.

Small, iterative deployments will help you figure out the patterns that will work for your agency and team in terms of managing accounts, putting security protections in place, meeting various security controls, and the many other things that will come up. Doing a small cloud deployment all the way through will make subsequent deployments much easier.

For an example, read about how we [moved our DNS records to infrastructure as code]({{ "/2018/08/15/shared-infrastructure-as-code/" | url }}).

### Automate in-place

While automation itself is not an end goal, it’s a great way to achieve things like consistency across deployments and having services self-heal.

Rather than trying to migrate a legacy system as it stands, try doing
some automation in-place using open source tools like
[Ansible](https://docs.ansible.com/ansible/latest/index.html) or
[Chef](https://www.chef.io/chef/). This will allow the team to get
comfortable with the tooling, will improve the existing deployment, and will be useful for any new ones (cloud or not). Another bonus is that this work won’t be blocked by procurement of infrastructure.

## A better cloud experience

Cloud, like software and any other support systems, are there to help
serve the public, help public servants, and support delivery on your
mission. Users won’t know if their HTTP request is served from
Kubernetes or a server in a closet somewhere, but they will know if that response is slow, if the site hasn’t been updated since 2002, or if their data ends up compromised. Use cloud to deliver a better, safer experience to them.

*Contributions from Porta Antiporta, Bret Mogilefsky, Will Slack, and Abbey Kos.*

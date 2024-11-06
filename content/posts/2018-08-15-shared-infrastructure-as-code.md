---
title: Shared infrastructure as code
date: 2018-08-15
authors:
- afeld
tags:
- technical guides
- devops
- 18f.gsa.gov
excerpt: "At many government agencies, a central IT team manages DNS directly. Other teams must request changes using help desk tickets, which can have inconsistent turnaround times, and are susceptible to human error. Having DNS records as code and doing changes through pull requests brought turnaround time down from multiple days to under ten minutes."
---

If you follow [DevOps
trends](https://modularcontracting.18f.gov/devops/), you have likely
heard of [infrastructure as
code](https://docs.microsoft.com/en-us/azure/devops/what-is-infrastructure-as-code). Tangibly, infrastructure as code means having things like your network configuration, server attributes, access control, etc. in a machine-readable format. This code then:

- Serves as the source of truth for what the infrastructure should look like
- Can be used to recreate the infrastructure from scratch
- Is under version control
- Is modified by pull requests

[DNS](https://simple.wikipedia.org/wiki/Domain_Name_System) is a major
piece of shared infrastructure at the Technology Transformation Services
(TTS, which 18F is part of), which made it a prime candidate for
infrastructure as code. Of the many benefits, **doing DNS changes
through pull requests rather than tickets brought turnaround time down from multiple days to under ten minutes.**

## What’s DNS?

TTS manages DNS for a number of domains. When you visit somewebsite.gov,
DNS tells your browser which server to query for the website. Think of
DNS like a phone book for the internet, mapping names to numbers (in
this case, hostnames to IP addresses). As an example, the
output below shows that 18f.gsa.gov points to a CloudFront [CDN](https://en.wikipedia.org/wiki/Content_delivery_network) domain, which
in turn points to a handful of IP addresses.

```
$ host 18f.gsa.gov
18f.gsa.gov is an alias for d42vcigf8s480.cloudfront.net.
d42vcigf8s480.cloudfront.net has address 52.85.89.103
d42vcigf8s480.cloudfront.net has address 52.85.89.67
d42vcigf8s480.cloudfront.net has address 52.85.89.75
d42vcigf8s480.cloudfront.net has address 52.85.89.8
...
```

At many government agencies, a central IT team manages DNS directly.
Other teams must request changes using help desk tickets, which:

- Can have inconsistent turnaround times
- Are susceptible to human error, since the changes usually need to be copied by hand from the ticket to the DNS management console

## Enter: The DNS repository

TTS applied the principles of infrastructure as code and [open by
default]({{ "/open-source-policy/" | url }}) to DNS and placed all
of our records in [a GitHub repository](https://github.com/18F/dns).
[The records
themselves](https://github.com/18F/dns/tree/master/terraform) are
written in [Terraform](https://www.terraform.io/), an open source
language and tool for describing infrastructure resources.

Having the code public means that **anyone (inside or outside of TTS)
can go through and see immediately what domains we manage as well as how
they’re configured**, all in one place.

<figure>
  <a href="{{ "/assets/blog/dns-post/github-terraform-files.png" | url }}">
    <img src="{{ "/assets/blog/dns-post/github-terraform-files.png" | url }}" alt="Screenshot of GitHub showing a list of Terraform files. Each corresponds to a domain."/>
  </a>
  <figcaption><a href="https://github.com/18F/dns/tree/master/terraform">List of Terraform files that correspond to domains</a></figcaption>
</figure>

[Changes to records](https://github.com/18F/dns#making-changes) are
made by [pull
request](https://github.com/18F/dns/pulls?utf8=%E2%9C%93&q=is%3Apr).

<figure>
  <a href="{{ "/assets/blog/dns-post/github-pull-request.png" | url }}">
    <img src="{{ "/assets/blog/dns-post/github-pull-request.png" | url }}" alt="Screenshot of a pull request in GitHub, with an explanation of why the change is being made. It also shows that an issue from another repository links to the pull request."/>
  </a>
  <figcaption><a href="https://github.com/18F/dns/pull/273">Example pull request</a></figcaption>
</figure>

After submission, changes are checked automatically via [continuous
integration
(CI)](https://docs.microsoft.com/en-us/azure/devops/what-is-continuous-integration) in CircleCI.

<figure>
  <a href="{{ "/assets/blog/dns-post/changes-to-code.png" | url }}">
    <img src="{{ "/assets/blog/dns-post/changes-to-code.png" | url }}" alt="Two browser windows, one from GitHub showing the changes to the code, the other showing the resulting changes from Terraform in CircleCI."/>
  </a>
  <figcaption><a href="https://github.com/18F/dns/pull/267/files">Example diff</a> and <a href="https://circleci.com/gh/18F/dns/483">continuous integration</a> output</figcaption>
</figure>

While this is mostly checking for simple things like valid syntax right now, we have ideas for expanding, like [reporting unused
records](https://github.com/18F/dns/issues/176).

Before merge, someone looks over every change, even if it’s just a
sanity check. Merging a pull request triggers an automatic deploy of the new DNS settings to Amazon Route53, which is where the live DNS records (name servers) reside. While this process is like submitting a ticket, **administrators don’t need to manually enter any changes**.

**With the Terraform code in Git, we get all the benefits of version
control, particularly an auditable history, attribution, and the ability to “undo”.** (“Who changed this record? When? Why? That broke
things...let’s take it back to how it was before.”) If our live records get deleted somehow, the next deploy puts them back in place exactly as they were.

## Migration

Earlier this year, we needed to move our DNS records to a new Amazon Web Services account. Manually copying and verifying these records by hand would have been a tedious process. On top of that, we had to maintain all records in both places during the migration.

With the configuration in code and version control, we were able to
[modify our continuous
deployment](https://github.com/18F/dns/pull/178) so that every change
to the records was deployed to the old _and_ new accounts.

The
[declarative](https://tylermcginnis.com/imperative-vs-declarative-programming/)
nature of Terraform means that you tell it what state you want the
infrastructure to be in, and it figures out what changes to make to get there. On its first run against the new account, Terraform saw that none of the records were in place, so it created them. **Time from zero to hundreds of records present in the new account? A half hour.**

With the records in both accounts, we gradually transitioned our domains to point to the new nameservers in the new account. When complete, we simply [removed the code deploying to the old
account](https://github.com/18F/dns/pull/214) and deleted the old
records.

**What could have been a painful DNS migration was made calm and
confident by infrastructure as code and continuous deployment.** Better Living Through Automation!

## Do it yourself

Having TTS’ DNS specified in code in a public repository with continuous integration and deployment has been unequivocally positive. **If your organization doesn’t do infrastructure as code but is interested in trying it out, DNS is a great place to start.** Public DNS records don’t contain any [sensitive
information](https://handbook.18f.gov/sensitive-information/), it’s
easy to confirm that they are deployed correctly, and you can use
basically any continuous integration and DNS providers (that have an
API). Fork [our DNS repository](https://github.com/18F/dns) to get
started!

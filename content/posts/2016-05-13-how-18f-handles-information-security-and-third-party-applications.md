---
title: How 18F handles information security and third party applications
date: 2016-05-13
authors:
- aaron
- noah
tags:
- security
- collaboration tools
excerpt: "Today the General Services Administration’s Office of Inspector General (an independent part of our agency, entrusted with carefully inspecting agency operations) published a report on a mistake made in the configuration of Slack, an online chat tool we use. We discovered and remedied this issue a couple of months ago. We did a full investigation and to our knowledge no sensitive information was shared inappropriately."
description: "Today the General Services Administration’s Office of Inspector General (an independent part of our agency, entrusted with carefully inspecting agency operations) published a report on a mistake made in the configuration of Slack, an online chat tool we use. We discovered and remedied this issue a couple of months ago. We did a full investigation and to our knowledge no sensitive information was shared inappropriately."
image: /assets/blog/ig/slack-gdrive.jpg
hero: false
---

Today the General Services Administration’s Office of Inspector General
(an independent part of our agency, entrusted with carefully inspecting
agency operations) [published a report](https://www.gsaig.gov/sites/default/files/ipa-reports/Alert%20Report-GSA%20Data%20Breach%205.12.16.pdf) on a mistake made in the
configuration of Slack, an online chat tool we use. We discovered and
remedied this issue a couple of months ago. We did a full investigation and to our knowledge **no sensitive
information was shared inappropriately.**

To help explain what happened and what this means, we’ll share more
detail about the technical background behind the problem and how we took
care of this when we noticed it.

Sharing this story is part of our goal of working openly and
transparently while also talking about how we work in plain language. We
hope this story will be useful to everyone who needs to both work with
modern cloud-based applications and be careful stewards of information.
We appreciate the efforts of our Inspector General to ensure consistent
assessment of GSA policies and operations.

Here’s what happened
--------------------

[{% image "assets/blog/ig/slack-gdrive.jpg" "An example screenshot of what a Google Drive preview looks like in Slack" %}](https://get.slack.help/hc/en-us/articles/205875058-Sharing-Google-Drive-files-in-Slack)

In October 2015, one of our Slack administrators enabled [a Slack
option](https://get.slack.help/hc/en-us/articles/205875058-Sharing-Google-Drive-files-in-Slack)
that allowed our Slack to automatically provide document previews when
we sent each other links to our GSA Google Drive documents. In March
2016, we realized this option was active and it shouldn’t have been — so
we disabled the option and took further steps (described below) to correct the issue.

You might wonder why this was an issue at all, because this Google Drive
preview is an ordinary Slack option that many companies and groups
enable for their own Slack and Google Drive instances. For many teams
it’s a perfectly fine thing to do.

For us as part of federal government, we need to be very careful about
how we connect the services we use; we shouldn’t *automatically* connect
our Slack to our Google Drive. We only allow ourselves to share information in
our 18F Slack that would be ok to make public anyway.

In short, putting links to Google Drive files in our Slack also
put those documents on Slack's databases, so that files you import are
available in Slack for easy searching and reference. Slack makes this
happen using a protocol called [OAuth 2.0](http://oauth.net/2/), which
is an industry-standard authorization framework that helps separate
applications connect to each other in a secure way. Bottom line: It’s
not ok to let an external company automatically index and store our
Google Drive documents.

How we responded
----------------

Enabling this integration was a mistake, but the consequences were not a
data breach or hack. While roughly 100 people enabled this connection, it did not provide the full contents of their Google Drives to Slack. Only the files those people pasted into Slack were indexed, while others remained solely in Google Drive.

Upon discovering that this integration had been accidentally enabled, we
immediately removed the Google Drive integration from our Slack, and
then we reviewed all Google Drive files shared between Slack and Drive,
just to be sure nothing was shared that shouldn't have been. Our review
indicated no personal health information (PHI), personally identifiable
information (PII), trade secrets, or intellectual property was shared.

We make it a practice to regularly remind our team of their onboarding
and training, and to always read the fine print when creating an OAuth
2.0 connection — good advice for anyone. Whether you use Google Drive
for personal or professional reasons, [you should occasionally
check](https://support.google.com/accounts/answer/3466521?hl=en) if
you're comfortable with what you're sharing. Most other services that
use OAuth 2.0 have a similar setup, including
[Facebook](https://www.facebook.com/help/262314300536014/) and
[Twitter](https://twitter.com/settings/applications).

Like the Inspector General, we believe that protecting sensitive
information is an important responsibility for all government employees.
GSA puts a premium on cybersecurity and we’re continually improving the
security of our tools and products. We’re thankful that the problem
didn’t expose any sensitive or private data, and appreciate the
Inspector General’s efforts to help keep GSA efficient, effective, and
accountable.

*Editors’ note:* A report from the General Services Administration’s Office of Inspector General on [February 21, 2017](https://www.gsaig.gov/sites/default/files/ipa-reports/OIG%20EVALUATION%20REPORT_Evaluation%20of%2018F%20IT%20Security%20Compliance_JEF17-002_February%2021%202017.pdf) included the following: "after concluding a comprehensive review of the [Slack] incident in August 2016, GSA IT found that the vulnerability exposed content containing PII to unauthorized users.” This post was last updated on 2017-02-22 at 9 a.m. Pacific Standard Time. You can see the [full revision history](https://github.com/18F/18f.gsa.gov/commits/staging/_posts/2016-05-13-how-18f-handles-information-security-and-third-party-applications.md).

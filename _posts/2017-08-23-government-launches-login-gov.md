---
title: " Government launches login.gov to simplify access to public services"
date: 2017-08-22
authors:
- joel-minton
- tom-mills
tags:
- login.gov
- identity
- security
- platforms
- u.s. digital service
- product launch
excerpt: "Today, the U.S. Digital Service and 18F are excited to announce the launch of login.gov, a single sign-on solution for government websites that will enable citizens to access public services across agencies with the same username and password."
image: /assets/blog/login-gov/login-gov-launch.png
---

_Joel Minton, a member of the U.S. Digital Service, is working with GSA’s Technology Transformation Service as the director of login.gov. Tom Mills is the Chief Technology Architect at U.S. Customs and Border Protection._

In early April, the U.S. Digital Service and 18F launched [login.gov](https://login.gov/), a single sign-on solution for government websites that will enable citizens to access public services across agencies with the same username and password.

Login.gov is currently in action at the U.S. Department of Homeland Security’s Customs and Border Protection Agency (CBP), where Tom Mills is driving transformation of CBP customer experiences. Right now, it’s being used for the [CBP Jobs App](https://itunes.apple.com/us/app/cbp-jobs/id1210368989?mt=8), which allows candidates to see the status of their progress as they’re moving through the recruitment and hiring pipeline. Logging into this system was previously so cumbersome that some candidates dropped out.

We designed login.gov to transform the way people interact with the federal government online, and plan to roll it out gradually this year. There are currently hundreds of applications spread across government sites that require users to log in. Traditionally, each agency — and even bureaus within agencies — have built their own login systems from scratch with various levels of usability, security, and privacy. The result has been an inconsistent, confusing, or unreliable user experience, which is of primary concern when people are being asked to enter personally identifiable information. Americans have higher expectations for digital experiences than ever before, and government services are no exception.

The login.gov team has answered this call by creating a system that meets the design, performance, and experience people are used to having when logging into their email or any top tech industry website. Login.gov makes it easy and intuitive for users to choose a username and password, and to set up multifactor authentication by using their phone numbers or an authenticator application. Login.gov also allows agencies to protect user’s personally identifiable information by going through an identity proofing process where it verifies identities online. Once this is done, they’ll be able to use the same login to access any government site using the simplified login.gov interface.

To do this, we combined U.S. Digital Services’ and 18F’s forces on a single team of engineers, designers, user experience experts, and product managers who have all previously worked on similar authentication systems in the government and in the private sector. We did extensive research into the best login solutions the tech industry has to offer — including government systems that work well — and fine-tuned the product flow and design through continuous usability testing.

Developing a unified login system will enable the smart and secure transfer of data between agencies. For example, the visa and immigration process is managed by a number of departments and bureaus. A successful immigration system requires the seamless transfer of data from Citizenship and Immigration Services to the Department of State to Customs and Border Protection, with vital input from the Department of Labor, and eventually the Social Security Administration and the Internal Revenue Service. A traveler who becomes a student, who becomes an employee, who becomes a green card holder and later a citizen will need to maintain timely contacts with all of these agencies.

A consolidated login experience would empower these agencies to work in concert, saving costs and reducing unnecessary delay. At the same time, a seamless user experience directly improves the customer’s quality of life, engenders faith in government services, and improves security and privacy protections.

Login.gov stands to benefit agencies in several other ways. Building custom login systems for services has historically cost agencies hundreds of millions of dollars. Plus, they’ve had to spend the time and budget contracting vendors to do the work, managing the software development, and supporting customer service on an ongoing basis when people have trouble logging in. This ends up being very expensive and complex when agencies could otherwise be focused on providing high-quality services for people to use after they log in.

In addition to providing the platform, we send in small squads of integration experts to help agency developers integrate their code with login.gov in less than four hours. We’ve also empowered central USA.gov call centers to handle a variety of queries about the system, so agencies no longer have to reset lost passwords and troubleshoot on their own.

We’ve made privacy and end-to-end encryption a key focus of the login.gov platform from the very beginning. User account information is strongly encrypted, and it’s not shared to a partner agency like CBP unless a user has given express permission.

Finally, the login.gov team has [released all of the code and support documentation](https://github.com/18F?utf8=%E2%9C%93&q=identity&type=&language=) for the platform as open source. This allows us to get feedback from security and technology experts throughout the industry so we can continuously improve as we make government more accessible for everyone.

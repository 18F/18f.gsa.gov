---
agency: U.S. Forest Service
title: Moving land permits online
subtitle: Easing access to public lands
permalink: /what-we-deliver/forest-service/
excerpt: Using prototypes and modular contracting to help the Forest Service buy and develop an online permitting system.
image: /assets/blog/forrest-service/xmas-tree-permit.png
image_accessibility: Screen shot of the Christmas tree permit website
image_icon:
project_weight: 8
tag: forest service
expiration_date:
github_repo:
  - "[Project repository](https://github.com/18F/fs-online-permitting)"
  - "[U.S. Forest Service Permit Platform](https://github.com/18F/fs-permit-platform)"
  - "[ePermit Middlelayer API](https://github.com/18F/fs-middlelayer-api)"
project_url:
learn_more:
product_clients:
resources:
    - "[e-Permit API task order](https://github.com/18F/bpa-fs-epermit-api)"
    - "[e-Permit intake task order](https://github.com/18F/bpa-fs-epermit-intake)"
    - "[Christmas tree task order](https://github.com/18F/bpa-fs-xmas-trees)"
---

The U.S. Department of Agriculture’s Forest Service issues permits to the public for activities such as outfitting trips, large scale events, and Christmas trees harvests. The Forest Service wanted to make their permits and applications available online to create a more predictable application process that was not limited to regular business hours.

<div class="case-study-preheader margin-top-6">Approach</div>
### Breaking the work into modules

Before helping Forest Service hire vendors to build a permit tool, we conducted a series of workshops with the Forest Service to investigate the business process behind permit applications. With that information, we built a small prototype of an online permit tool that could address their issues. We tested this prototype with both public and Forest Service staff users and used that research to draft an RFP using 18F's Agile Blanket Purchase Agreement.

Instead of putting the entire permit application tool into one RFP, we started by procuring a team to build an API to connect to a legacy system within the Forest Service. By breaking the work into pieces (called modules), the Forest Service was able to get functionality quickly while reducing risk on each module.

The Forest Service and vendor team built the initial API module in four months. We provided technical and design guidance to the vendor as well as coaching and strategies for the Forest Service to serve as product owners.

With the API module in hand and working well, we then helped the Forest Service draft, award, and manage additional RFPs to build a public-facing application including a module to support Christmas tree permits and a module to support Special Uses permits. We also integrated the application with [login.gov](http://login.gov) so users could securely log in to the system and [Pay.gov](https://pay.gov) for credit card payment processing.

In 2018, the system received its Authority to Operate (ATO), and we deployed the Christmas tree module into production for four pilot forests so we can learn how the product works for its users. From here, we'll support the Forest Service as they expand the service to additional users.

Breaking the system into modules and using modular contracts allowed the Forest Service to see results quickly, reduce risk on each module, and deliver a service that meets the needs of users. The 18F team used each module to help the Forest Service learn new software development and contract management techniques that will help them continue to be a better buyer of technology.

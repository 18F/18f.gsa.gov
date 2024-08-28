---
title: "Buying Christmas tree permits online with Open Forest"
date: 2019-02-12
authors:
- laura-gerhardt
tags:
- product launch
- forest service
excerpt: "After a two year partnership with the Forest Service, we're excited to announce the launch of Open Forest where you can buy a permit to cut down your own Christmas tree in a National Forest."
image: /assets/blog/open-forest/open-forest-christmas-permits-front-page.png
---

Sometimes in our work, we have to see the trees for the forest, or about
6,000 trees to be precise. On November 19, 2018, the U.S. Forest Service
(USFS), in partnership with 18F, launched [Open Forest](https://openforest.fs.usda.gov/christmas-trees/forests), an online permit issuing system to help the Forest Service sell its Christmas tree
permits. With Open Forest, you can easily go online during the holiday
season, buy a permit for up to five trees, print out the permit at home,
and go cut down your tree in a National Forest. Before Open Forest,
there was no online purchasing option for these permits, limiting the
public to buying permits at mostly remote USFS district offices or
sometimes from local vendors during weekday business hours. From launch
to the end of the holiday season, Open Forest sold nearly 5,000
permits across the four pilot forests.

Though 18F has delivered many products to production since its founding
in 2014, this is our first product to include payment functionality.
Purchasers can use their credit card, debit card, or bank account number
to pay for a permit through the U.S. Department of the Treasury’s
[Pay.gov.](https://www.pay.gov/) Leveraging this existing service
helped us implement a modular approach; our product team focused on the
unique Christmas tree sale process, rather than reinventing how to make
a secure payment. For the Forest Service staff in the district offices,
it minimized the administrative burden of processing large sums of cash.

Why did we design and build a print-at-home solution rather than a
mobile one? With limited cellular service and temperatures dropping
below freezing that can quickly drain a mobile phone battery, a digital
solution might not be that durable. USFS Law Enforcement also needs to
be able to confirm legal purchase without pulling people over, so a
print-at-home permit fit the broadest number of user needs. With
print-at-home paper permits, law enforcement can spot them on the dash
of a car at a distance, and the public doesn’t have to depend on cell
service or their phone battery.

With the 2018 holiday season past, Open Forest will soon pilot its
Special Use permits, which include outfitters and many non-commercial
uses like weddings and other large-scale gatherings in a National
Forest. The Special Use project will start with the Mount Baker
Snoqualmie National Forest, and then scale to additional forests.

Check out [Open Forest](http://openforest.fs.usda.gov), or learn more
about [how our more than two year collaboration with USFS brought it to life](https://github.com/18F/fs-open-forest/wiki).

---
title: "From spreadsheet to API to app: A better contract forecasting tool"
date: 2016-05-02
authors:
- alla
- steven-reilly
tags:
- acquisition services
- procurement
- tools you can use
- general services administration
- agency work
excerpt: "Executive branch agencies of the federal government are required by law to tell vendors if and when they plan on making purchases. The General Services Administration (GSA) was forecasting using a crowded spreadsheet containing dozens of columns and hundreds of rows. 18F helped create a new, open-source tool to display contract forecasting opportunities."
description: "Executive branch agencies of the federal government are required by law to tell vendors if and when they plan on making purchases. The General Services Administration (GSA) was forecasting using a crowded spreadsheet containing dozens of columns and hundreds of rows. 18F helped create a new, open-source tool to display contract forecasting opportunities."
image: /assets/blog/osbu-forecast/forecast-tool.jpg
---

Executive branch agencies of the federal government are required by law to tell vendors if and when they plan on making purchases. Everything from printers to elevator maintenance is “forecast” out to industry so that companies can anticipate when and how to compete to do business with the government. The General Services Administration (GSA) was forecasting using a crowded spreadsheet containing dozens of columns and hundreds of rows — all of which had to be updated manually. As part of Administrator Denise Turner Roth’s [Making it Easier initiative](http://www.gsa.gov/portal/content/252215), 18F helped create a new, [open-source tool](https://github.com/18f/forecast) to display [contract forecasting opportunities](https://gsaforecast.gsa.gov) and allow for keyword search and filtering.

## Making it easier for business

The [GSA Office of Small Business Utilization](http://www.gsa.gov/portal/category/21015) (OSBU) is required to compile projections of contracting opportunities that small, disadvantaged, and women-owned businesses may be able to perform. However, GSA was only publishing their own agency data — thus requiring businesses to go to dozens of agency web sites just to find forecast information for those agencies.

{% image "assets/blog/osbu-forecast/spreadsheet.jpg" "A screenshot of a OSBU's original spreadsheet" %}
*OSBU's original vendor forecast featured thousands of rows of
complex data*

As 18F began development, we spoke with a variety of small businesses across the country to learn what information is most important to them when deciding to pursue federal contracts. The findings from this research (searching by NAICS code, filtering by location) directly informed the design and layout decisions we made when building the tool. We used the [Draft U.S. Web Design Standards](https://standards.usa.gov/) to ensure the site looked great on mobile and tablet devices.

## Performance improvements and iteration

Ultimately, 18F used an [API](https://gsaforecast.18f.gov/api/)-first approach to build a lightweight, easy-to-use Django application with a simple backend that OSBU can use to quickly update forecasts. With easy updating, vendors have up-to-date forecasting information throughout the year instead of just quarterly. During research and development, we also found that GSA and external users had a variety of unique use cases; providing an API makes integrations with and extensions of the data possible.

We also uploaded five additional agencies’ forecasting data into the tool to allow businesses to search one time to see a larger universe of results. For vendors who prefer to use the spreadsheet, the tool allows users to download filtered spreadsheets containing their specific search results.

The beta version of the site is available at [gsaforecast.gsa.gov](https://gsaforecast.gsa.gov) and you can read OSBU Director Jerome Fletcher’s announcement post about the tool [on the GSA blog](http://gsablogs.gsa.gov/gsablog/2016/03/15/new-gsa-small-business-contracting-forecast-tool-will-drive-community-economic-development/).

{% image "assets/blog/osbu-forecast/forecast-tool.jpg" "The homepage of the new OSBU forecast tool" %}
*The new GSA forecast tool is mobile optimized and allows for
keyword searching across multiple agencies.*

If you have any questions about the tool, email [forecasthelp@gsa.gov](mailto:forecasthelp@gsa.gov). Meanwhile, if you would like to stay informed about other 18F acquisition projects, sign up for [our acquisition email list](https://gsa.us9.list-manage.com/subscribe?u=6f1977de9eff4c384dc8d6527&id=e7f757afe3).

*Duane Rollins also contributed to this post.*

---
title: "Opening the nation’s crime data"
date: 2017-09-07
authors:
- ryan-sibley
tags:
- department of justice
- fbi
- open data
- agency work
- product launch
excerpt: "For more than eight decades, the Federal Bureau of Investigation has collected nationwide crime data under the Uniform Crime Reporting (UCR) Program. While the data has always been publicly available via static reports, the first release of the Crime Data Explorer makes it easier than ever for anyone to access and use the data.
"
image: /assets/blog/fbi-crime-data/fbi-hero.png
---

For more than eight decades, the Federal Bureau of Investigation has collected nationwide crime data under the [Uniform Crime Reporting (UCR) Program](https://ucr.fbi.gov/). While the data has always been publicly available via static reports, the first release of the [Crime Data Explorer](https://crime-data-explorer.fr.cloud.gov/) makes it easier than ever for anyone to access and use the data.

<figure>
	<img class="image-shadowed" src="{{site.baseurl}}/assets/blog/fbi-crime-data/crime-data-explorer-home.png" alt="The home page of Crime Data Explorer"/>
   	<figcaption><a href="https://crime-data-explorer.fr.cloud.gov/">Crime Data Explorer</a> home page</figcaption>
</figure>


The UCR Program is one of the nation’s most sought after crime datasets, and, until now, was spread across four FBI publications: _Crime in the United States, National Incident-Based Reporting System, Law Enforcement Officers Killed and Assaulted,_ and _Hate Crime Statistics_. The Crime Data Explorer brings all of those sources together in one easy-to-use interface. You can use the Crime Data Explorer to look at changes in trends over time or download specialized datasets, like drug arrests, for your own analyses. The Crime Data Explorer is also powered by an open [API](https://crime-data-explorer.fr.cloud.gov/api) (application programming interface) that can be used by others to build their own applications using UCR data.

Broadening access to this data helps people better understand crime in their communities. It also helps promote citizen engagement, improve resource allocation for communities, and will lead to more transparency and accountability within law enforcement agencies. Further, law enforcement can use this tool to benchmark their progress and see how reported crime rates compare across the nation.


<img src="{{ "/assets/blog/fbi-crime-data/az-breakdown.gif" | url }}" alt="Screen: Discovery Homepage" />


Specifically, users of the site can:

- Easily search, sort, and compare crime statistics by location (both nationwide and in each of the 50 states), time period, and type of crime using a national map or various drop down filters
- After filtering results, view charts and graphs that break down data in a variety of formats
- Display data in either summary statistics and incident-based reports (if available)
- Download tailored reports produced by queries, NIBRS information by location/year, and bulk datasets going back several decades
- Use the API to build their own web applications.


<figure>
	<img class="image-shadowed" src="{{site.baseurl}}/assets/blog/fbi-crime-data/homicide-line-graph.png" alt="A line graph of the state of Arizona's homicide rate between 2004 - 2014"/>
   	<figcaption>Breakdown of the state of <a href="https://crime-data-explorer.fr.cloud.gov/explorer/state/arizona/homicide">Arizona's homicide rate</a></figcaption>
</figure>

<figure>
	<img class="image-shadowed" src="{{site.baseurl}}/assets/blog/fbi-crime-data/homicide-bar-graph.png" alt="A bar graph depicting rates of homicide as reported by the Phoenix Police from 2004-2014"/>
	<figcaption>Homicide rates as reported by the <a href="https://crime-data-explorer.fr.cloud.gov/explorer/agency/AZ0072300/homicide">Phoenix Police from 2004-2014</a></figcaption>
</figure>

The major goals for this project included applying [open data principles](https://project-open-data.cio.gov/principles/) to UCR Program data and building the tool in a user-centered way. We wanted to make sure that the end product was useful, understandable, and accessible to everyone. We conducted user-testing sessions every two weeks to validate and optimize our work and tested the tool with nearly 150 people inside and outside of the government.

Another goal for the Crime Data Explorer is to educate users on what can and can’t be done with UCR Program data. For instance, the data provides a snapshot in time based on available reports, but can’t tell you how a case progressed or if a person was charged, convicted, or acquitted. Other limitations include varying levels of participation across the nation, as not all law enforcement agencies report UCR data, which may lead to gaps in the data.

## What’s in the data

The API makes data available for the years 1960-2015, 1960 being the year the FBI began digitizing its data. National and state estimates and all local agency data is available via the website for the years 1995-2015. The FBI plans to continue to update the CDE with new data as it becomes available. The data is machine readable and in a form that users should be able to navigate easily. We’re providing metadata packages that include dataset descriptions and a data dictionary to help users understand what they have access to.

In making this data more accessible, we’re optimistic that more agencies will participate in UCR Program and the volume and quality of the data will improve.

## Building change beyond the Crime Data Explorer

Creating the Crime Data Explorer was a bold step towards improving transparency around crime reporting for the FBI. This was an explicit goal and benefit of building this product. Additionally, the staff at the FBI’s Criminal Justice Information Services Division (the team responsible for facilitating UCR data and now the Crime Data Explorer) worked closely with 18F throughout the design and development process, participated in usability testing, and showed a lot of patience and commitment to delivering the best possible product as they adapted to new ways of working. The FBI team embraced agile software development, user-centered design, iterative releases, using plain language, and open source technology — all of which paves the way for further innovation within the Uniform Crime Reporting Program and inside the FBI.  

_Visuals by Aviva Oskow._

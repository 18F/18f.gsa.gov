---
title: A dashboard for privacy offices
date: December 15, 2020
authors:
  - andrew-hyder
  - igor-korenfeld
  - peter-rowland
tags:
  - 10x
  - data access
excerpt: Through work funded by 10x, a team from 18F investigated how technology
  can help busy privacy offices manage your PII, and make their work more
  accessible and understandable for the public.
---
One of the federal government’s highest priorities is protecting the privacy of the people it serves. Government agencies collect and maintain personally identifiable information (PII) from members of the public in order to provide services. Within all agencies, there are dedicated public servants whose mandate is to safeguard and manage this personal information within agency systems. They keep track of what data about individuals their agency collects, who those individuals are, why their agency needs it, and when that data is no longer needed by the agency and should be deleted. Privacy offices serve as stalwart defenders against potential overreach or misuse of PII. The laws that privacy offices must comply with require a lot of paperwork, and managing that paperwork takes up a lot of their time.

Through work funded by [10x](https://10x.gsa.gov/), a team from 18F investigated how technology can help busy privacy offices manage your PII, and make their work more accessible and understandable for the public. With our partners in GSA’s Privacy Office, we built a custom [solution](https://cg-9341b8ea-025c-4fe2-aa6c-850edbebc499.app.cloud.gov/site/18f/privacy-dashboard/) that saved them an estimated 300 hours of staff time dealing with paperwork this year alone, and made it easier for them to manage the PII in their systems. The next phase of our work is to explore opportunities for scaling this work across government for the benefit of all executive branch privacy offices and the public they serve.

## The problem

![Newspaper clip with the headline: "Huge C.I.A. operation reported in U.S. against antiwar forces, other dissidents in Nixon Years"]({{ site.baseurl }}/assets/blog/image1.png)

The Privacy Act of 1974 was passed in the Watergate era, at a time when scandals involving the abuse of people’s privacy by the government were in the headlines. The new law required all federal government agencies to notify the public about any information systems (Systems of Records) they operate that contain personally identifiable information about individuals (the ‘Category of Records’ in the system).

Transparency about how the government collects and stores data about the public is more important now than ever. Privacy breaches by foreign actors and misuses at home have eroded public trust in government. Many people fear that technology allows the government to cast too wide a net in collecting their private data. In response to these concerns, privacy offices have an urgent responsibility to clearly and transparently communicate the privacy protections that their agencies have in place.

The task of protecting the public’s privacy is growing more complex each day as technology evolves and legacy systems age. Today, agencies have many more systems and new types of PII to manage. Publishing and updating compliance documentation has become more difficult for privacy offices, which are often under-resourced. PDFs and pen-and-paper processes are still the medium of compliance and primary record of PII for many agencies. It is time-consuming for privacy offices to search through these documents to answer questions about their agency’s portfolio of PII across their systems. Privacy offices, especially those without resources to spare on new technical projects, could benefit from a centralized overview of the information in these important compliance documents, and a better way to manage it.

## Prototypes and research

Over four months, using rigorous user research and other agile methods, our team partnered with [GSA’s Privacy Office](http://www.gsa.gov/privacy) to build a custom dashboard inventory of the PII collected in their systems. 

Through our research, we learned that this information was only available in two privacy compliance documents: Privacy Impact Assessments (PIAs) and System of Record Notices (SORNs). Privacy offices, which are multi-disciplinary organizations, rely on system owners to provide information about their systems, which they review and then publish in the form of PIAs and SORNs. However, we learned it’s a struggle to keep PIAs and SORNs up to date, and it is difficult to use these documents to answer questions about what PII GSA collects and stores as an organization across all its systems. Our partners told us that they routinely have to ‘crosswalk’ their PIAs and SORNs manually to find answers to important questions about GSA’s privacy management, which was very time consuming.

Our initial hypothesis was that we could deliver real impact to our partners by applying text-extracting techniques to pull relevant information from PIA and SORN documents and structuring it in a way that could be presented and searched through in a dashboard. We wrote custom open-source code to scan GSA’s privacy webpage (all government agencies must have a ’/privacy’ web address at their domain), download their compliance documents, and extract the PII and other important fields we needed to build our dashboard. We took advantage of the availability of machine-readable SORNs through the Federal Register’s application programming interface (API), which allowed us to further automate the text-extraction.

Our first goal was to create a minimum viable product that our partners could use in their day-to-day work and we could learn from. We created mock-ups of a design for the dashboard and experimented with search functionality. Once we had a prototype, we populated it with extracted data. We conducted user research with GSA’s privacy office and incorporated their feedback into the design. 

In the end, we had something that looked like [this dashboard](http://cg-9341b8ea-025c-4fe2-aa6c-850edbebc499.app.cloud.gov/site/18f/privacy-dashboard/).

![Gif of the PII inventory dashboard of a user looking for the term social security number]({{ site.baseurl }}/assets/blog/image2.gif)

Our prototype was simple, but it immediately delivered impact for our partners. The dashboard saved them from having to resort to manual processes that take hours upon hours of their valuable time. It also increased their confidence in their analysis and reporting, which helped them answer questions and collaborate more effectively with other departments. 

Our partners also began using the structured data behind the dashboard in ways we had not anticipated. They are currently using it to standardize the terms used for different types of PII across their systems, and updating their processes and standards for how this information gets collected. We provided the basic search functionality, but our partners did the rest of the innovating.

We see no reason to believe that our work has already realized all of its potential. Our first partners found it useful for reasons beyond what we had intended and we believe scaling our solution to other agencies will reveal additional use cases and impact. 

In the next phase, we want to take what we’ve learned from our initial partnership and prototype and scale it to all executive branch agencies. 

## Lessons

There are a few important things that we learned through building this prototype. First, it is important to meet partners where they are and give them tools that are immediately useful. It was important to us not to make life more difficult for GSA’s privacy office by making them learn a new tool. Instead, we made the decision to use Google Sheets as the backend for this prototype, which meant that our partners could make changes to the data behind the tool without our assistance. 

![Steps for data to go into dashboard: First a google sheet with backend data store and edit access is created, then updated in Github, and finally published though Federalist]({{ site.baseurl }}/assets/blog/image3.png)

Next, we learned that taking a ‘compliance hacking’ approach to building a prototype was an effective way to deliver a tool that our partners can continue to use after we leave. Because our technical stack is made of components that have already been given the Authority to Operate (ATO), our partners can continue to use the tool in their regular work without further investment. Though an ATO will be required for the version of this tool that we build at scale, this approach allowed us to provide real value to our partners first and prove that there is a demand for our tool before going through the ATO process.

Finally, we learned that prototype technologies like our dashboard can provide essential,  positive encouragement to change agency practices by demonstrating their value and their potential first. Privacy offices have known for a long time that they must start keeping PII inventories and collect PII data in a more structured way. Our dashboard provided a tangible and useful example of one of the many things that could be developed with structured data. We hope our dashboard continues to encourage the adoption of creative, modern technology to safeguard the public’s privacy. 

## Next steps

10x believes in this idea and recently approved our team for phase four funding. We are the fourth out of more than 100 10x projects to receive funding to scale our project for the rest of the government. We are excited about the potential our tool has for privacy offices across all federal agencies, and for the public.

In the next phase, we are going to use the [Federal Register](https://www.federalregister.gov/) as our main data source. We are creating a pipeline to process all current SORNs available in the Federal Register, structure the information contained in them, and present it in a comprehensive privacy dashboard. We believe our dashboard can save privacy offices time and money, reduce the risk of audits, and directly benefit the public. We know that we will have succeeded when our tool not only gives government privacy offices more capacity, but also gives the public a better understanding of government privacy practices by making them more transparent and approachable. 

**\
If your agency is interested in helping support this effort, please get in touch with us: [privacy_devops@gsa.gov](mailto:privacy_devops@gsa.gov)**

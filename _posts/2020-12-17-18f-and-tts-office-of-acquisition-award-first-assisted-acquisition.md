---
title: 18F and TTS Office of Acquisition award first assisted acquisition
date: December 17, 2020
authors:
  - laura-gerhardt
  - miatta-myers
  - christine-bath
  - selena-juneau-vogel
  - brian-burns
tags:
  - procurement
  - how we work
  - public benefits
  - hhs
  - user research
excerpt: The Administration for Children & Families’ Office of Family
  Assistance, TTS, and the vendor community worked together to improve the TANF
  Data Reporting System (TDRS) to make it easier and faster for States, Tribes,
  and Territories to support low income families
---
When 18F and the [Administration for Children & Families’ Office of Family Assistance (OFA)](https://www.acf.hhs.gov/ofa) interviewed users of the over 20 year old data reporting system for the Temporary Assistance for Needy Families (TANF) program, we observed that the process was frustrating, both for the States, Tribes, and Territories (STTs) who report information through the system and for the OFA team who review the reports. STTs spent a considerable amount of time getting the data ready for submission: cleaning and formatting data, pulling together data from multiple sources, and internally collaborating on submission. OFA team members were also burdened with providing feedback manually via email. Now, OFA is on the path to a more streamlined, efficient submission experience for both the STTs and their own team, working with 18F to replace its legacy data reporting system through product management training, user research and an assisted acquisition.

OFA distributes $16.6 billion annually to STTs to provide income support and services to low income families with children. TANF grantees are legislatively-mandated to report to OFA on the characteristics and work participation of their TANF cash assistance caseload. This reporting is done through the TANF Data Reporting System (TDRS). OFA aggregates the data to:

*  analyze program outcomes;
*  understand which TANF families are working, training or looking for work; and
*  oversee State-level administration.

The current TDRS application was developed in the late 1990s and doesn’t take advantage of modern technology or best practices. The system is inflexible to changing requirements, is not automated, has no real user interface, doesn’t validate data effectively, and doesn’t provide OFA with full ownership of the inputted data. This puts a disproportionate amount of burden on all users of the system — both federal staff and the state, local, and tribe grantees — and has led to a painful user experience and often untimely or incomplete data.

## User research

Over the last year, [18F conducted user research with OFA](https://github.com/HHS/TANF-app/blob/main/docs/User-Research/Overview%20of%20Research%20Activities.md) staff and the STT users that interact with the current system to better inform our procurement. We identified who uses the current system and how they navigate TANF data reporting. We learned, as noted above, that the legacy system required a high level of effort to submit data and that data validation could improve the speed and ease of reporting. We also prototyped alternative data entry and upload tools to uncover how the grantees collect the data for submission. We then evaluated the feasibility of these prototypes to reduce both product and procurement risk.  Our intent was to provide as much information to vendors as possible in the solicitation so vendors had enough information to submit strong proposals and so they would be able to build on that research after the contract was awarded.

## Assisted acquisition

At the same time that we were doing research, 18F and the TTS Office of Acquisition were working with our OFA partner to award a [contract to build a new user-centered TANF reporting system](https://github.com/18F/tdrs-app-rfq), using 18F’s assisted acquisition authority, which allows a contracting office to acquire goods and services on behalf of another federal agency.  We targeted the contract’s request for quotation (or RFQ) to small business software development companies on GSA Schedules IT 70 with experience in open source development and user research, to make sure that this team could deliver a great product centered around the STT and OFA’s needs.  

We released the draft RFQ (in the form of a request for information or RFI) , so that we could understand vendors' perspectives on the requirements, which vendors were interested and whether they understood user research, and received responses from 37 companies. This method of using RFI gives an opportunity to engage with vendors thoughtfully early. 

After two rounds of RFIs, 18F and OFA evaluated the nine vendor submissions we received in response to the final RFQ. Our evaluation practice builds on 18F’s experience with the Agile BPA and acquisition consulting with other government agencies. We used a phased evaluation approach to ensure the team that were selected would be able to perform user research and conduct open source, iterative software development aligned with industry standards.  We reviewed a five page technical approach, a three page staffing plan, and at least one sample of open source code from past work in our first phase of evaluation. We invited the vendors who we were  confident could deliver on development and user research to remote 60-minute interviews to better understand their submissions.  

In July 2020, TTS OA awarded the contract to a small business vendor. The OFA and 18F team conducted a week-long kickoff meeting with the vendor to help them understand the business requirements of the system and the user research conducted to date. After the award, the vendor kicked off an agile Sprint 0 to prepare for upcoming user research and tailor the existing prototype environment to user needs. 

Following Sprint 0, the vendor and OFA Product Owner (the product team) prioritized functionality work against the [product roadmap](https://github.com/HHS/TANF-app/blob/main/docs/Product-Strategy/Roadmap-and-Backlog.md), using [product considerations](https://github.com/HHS/TANF-app/blob/main/docs/Product-Strategy/Considerations-and-Planning.md) we developed. With this prioritized backlog, the team is iteratively building cloud-based open-source software to replace the existing system. Concurrently, the vendor team is conducting user research with the OFA team and grantees to understand how users will prepare and submit their data. 

18F participates alongside the product as we transition the technical aspect of vendor management to the OFA partner. To do so, we ensure that the vendor delivers against our [quality assurance surveillance plan](https://github.com/18F/tdrs-app-rfq/blob/main/Final-RFQ/FINAL-TDRS-software-development-RFQ.md#32-quality-assurance-surveillance-plan-qasp) each sprint. The deliverables in our QASP help ensure that what is delivered meets the product owners vision, is informed by user needs, and follows the best practices of open source software development to minimize future maintenance costs and ensure security. 18F supports the OFA Product Owner on quality assurance of submitted code, specific technical questions that may arise and communicates with the ACF Office of the Chief Information Officer (OCIO) to make sure the product is secure, compliant, and able to receive an authority to operate (ATO) for our partner.

All this work supports OFA in ensuring their new system will make the data submission process easier for STTs, provide better transparency into when the data was submitted, and increase OFA’s confidence in the submitted data, ultimately supporting the economic security of the recipients of TANF cash assistance.

If you are interested in how we can help your agency navigate legacy transformation through user research and assisted acquisition, reach out via [inquires@18f.gov](mailto:inquires@18f.gov).

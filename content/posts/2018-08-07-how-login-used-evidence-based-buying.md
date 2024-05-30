---
title: "How login.gov used evidence-based buying to find identity
proofing software"
date: 2018-08-07
authors:
- jon-prisby
tags:
- identity
- security
- procurement
- testing
excerpt: "As part of our work building login.gov, a single sign on
service for government, we’ve been looking at ways to effectively verify
people’s identity online. Not only did we need to find a technology
solution to meet this need, we need to find a solution in a stack of
brand new possibilities."
---

“If I were given one hour to save the planet, I would spend 59 minutes
defining the problem and one minute resolving it.” - **Albert Einstein**

As part of our work building [login.gov](https://www.login.gov/), a
single sign on service for government, we’ve been looking at ways to
effectively verify people’s identity online. Once upon a time, identity
verification could only be done in person or over the phone, and it
involved presenting multiple pieces of documentation that together
proved you are who you say you are. Think of the day you started your
job. You needed to bring your government ID and Social Security card
with you. Those two documents, presented by you, were used to verify
that you are actually you.

As more government services move online, we also need to be able to
verify a person’s identity on the web in a secure and usable manner. For
login.gov, this introduces a problem that is two fold. Not only did we
need to find a technology solution to meet this need, we need to find a
solution in a stack of brand new possibilities.

To help us solve this difficult procurement problem, we used this
strategy: define the requirements and metrics, test the software with
representative data and measure the results. If you’re looking to solve
a new technical problem, we think this strategy can help ensure you find
the right solution through using data.

## The goal

Our goal was to acquire and implement a solution that allows us to
verify a wide range of documents and ensure the person on the ID is the
same person holding the ID. The U.S does not have a single government
issued ID. There are hundreds of types of valid photo IDs between the
number of photo ID issuers (states, territories, federal government,
tribes, etc). The diversity of photo IDs and how they can be verified,
such as by taking a photo/video or wirelessly for IDs that have a chip,
meant we needed to take a flexible approach.

For decades, identity proofing has been done in person by presenting a
government-issued photo ID to a trained person to inspect the document
itself and to compare the photo on the ID to the person presenting it.

New software solutions move this process online, usually involving
someone using their smartphone to take a photo of their document and a
selfie of their face. Then the software analyzes the photo of the
document to see if it’s genuine, and compares the selfie with the photo
ID to see if it’s the same person.

Because technologies like this are so new, it can be difficult to
understand how well they work, knowing what metrics to use to evaluate
them, and even to know exactly what to use them for. The [Gartner Hype
Cycle](https://www.gartner.com/smarterwithgartner/top-trends-in-the-gartner-hype-cycle-for-emerging-technologies-2017/)
captures the issue nicely: new technology usually arrives on the market
with high, even inflated, expectations, while its actual usefulness is
understood much later.

To avoid buying technology that we don’t need and to make sure that we
truly understand the problem presented by the growing world of digital
transactions, the login.gov team sought to learn from experts and test
potential solutions. We participated in forums such as the Document
Security Alliance (DSA), market research meetings with industry vendors,
and partnered with government experts.

The goal was to address the following questions:

1.  How to test whether travel documents are genuine, altered, or counterfeit?
2.  How accurate are current solutions in comparing an image of the person on the document and image(s) of the person holding the document?

## Testing travel documents

To help determine if we were buying effective software, we used a
representative set of genuine, altered, and counterfeit documents to see
if the software could correctly distinguish genuine documents from
counterfeit or altered documents and identify why the documents were not
genuine. The test used only visible light (not multispectral), since the
devices the general public has (smartphones, tablets, computers) do not
have infrared or ultraviolet emitters. Results from the test gave the
team a baseline for accuracy and specific places to research further for
improving accuracy and understanding the limitations of
visible-light-only analysis.

## Assessing the accuracy of current proposed solutions

The systems we tested ask the user to take photos of documents and then
a selfie. One challenge is that their ID’s photo could be years out of
date. Photos can be used for as long as 10 years after they’re taken.
Many factors can make matching more challenging, such as weight gain or
loss, changes in facial hair, injuries to the face, changing hair color,
and the fact that some travel photos like those issued in [Washington
D.C.](https://dmv.dc.gov/service/dc-dmv-real-id-driver-license) are
taken in black and white with security features embedded in them. We
used a selection of images of the same person over time, and different
people of the same national origin, biological sex, and approximate age
to approximate the use case of travel and identity documents. The
results of the test can be found at the [NIST FRVT
website](https://www.nist.gov/programs-projects/face-recognition-vendor-test-frvt-ongoing).

## Agency Partners

Beyond conducting a test, we wanted to make sure we were considering the
best data available when looking for a solution. By partnering with
other agencies, we were able to get expert advice and access to
resources that were not available within GSA. The federal government is
a large place that has experts in almost any field who can provide a
wealth of information. Below are two partners who were an immense help
on this project.

The **Intelligence Advanced Research Projects Activity (IARPA)** has a program
relevant to this space called
[ODIN](https://www.iarpa.gov/index.php/research-programs/odin), which
focuses on biometric presentation attack detection, also known as
spoofing. Spoofing occurs when someone tries to physically beat a system
by pretending to be someone else through actions like printing a 3D
mask, using a photo of a person, using software to manipulate images and
video, or working around the limits of different sensors and the
differences between capturing still photos vs videos.

<blockquote class="testimonial-blockquote">
  Finding the right solution is a mixture of technology, policy, and operational factors. IARPA welcomes collaboration with GSA and others. Working together as a collective government team we are able to ensure effective, safe, and user friendly solutions for the American people.
  <span>- Dr. Chris Boehnen, Senior Program Manager, IARPA </span>
</blockquote>

The other partner, the **National Institute of Standards and Technology**, runs an ongoing program called the [Facial Recognition
Vendor Test
program](https://www.nist.gov/programs-projects/face-recognition-vendor-test-frvt-ongoing),
which evaluates commercial software for face recognition technologies.

These partners helped the login.gov team learn more about the metrics,
terms of art, the existing state of technology, and what guidelines we
should use to set realistic expectations. For example, our test only
used visible light to examine documents. While many documents have
covert security features that show up under ultraviolet light, it was
unrealistic to include that in our test since very few devices (phones,
tablets, computers) emit ultraviolet light.

## Outcome

We took what we learned from the agency partners, forums, and market
research and put them into a draft statement of work that we issued as
part of a request for information. We then took the feedback we received
from the request for information and incorporated it into the final
[request for
quote](https://www.fbo.gov/index?s=opportunity&mode=form&tab=core&id=66ce42a96d8e4459309749b86dad84dd).
The RFQ has the requirements, metrics, and targets we used during this
project.

Testing vendors gave the login.gov team a clearer understanding of the
performance of software under the specific use case conditions of our
consumers. It also helped us establish relationships with partner
agencies for future testing and a framework for iterating and balancing
usability, privacy, and security for when asking people to use photos
for identity proofing. Next, the team will be working with cloud
providers to determine proof of concepts and finding other ways to
partner with industry and other agencies to deliver a secure, usable
solution for the public.

If your agency is also looking to explore a new technology area, we
strongly recommend finding partners around government to help you set up
a rigorous test of any new technology.

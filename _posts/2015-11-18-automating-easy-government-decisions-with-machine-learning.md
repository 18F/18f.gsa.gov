---
title: "Automating easy government decisions with machine learning"
date: 2015-11-18
layout: post
authors:
- anthony-garvan
tags:
- machine learning
- best practices
- data access

excerpt: "Machine learning is a subfield of computer science that focuses on the problem of learning from data. We think there’s a big opportunity to make government more efficient by using the massive paper trail that government agencies have been creating over the decades as datasets for machine learning algorithms."
image: /assets/blog/machine-learning/computer-motherboard.jpg
---

Should I get married? What is my calling? Should I eat gluten? A lot of decisions in life are hard. We spend months or years collecting information from different sources, mulling them over many restless nights, talking them over with friends and family. Those hard decisions are a big part of what makes you who you are, and everyone makes them in a slightly different way.

And then, there’s the decision over whether transaction \#39000946 is a duplicate of transaction \#39000843. Or deciding whether or not a document entitled “Ideas for the Advancement of the State Department” relates to the State Department. These are easy decisions — not in the sense that they’re cheap or instantaneous for a person to make, but in the sense that, given all the data and proper training, everyone will reach the same conclusion. All the data required to make them is right in front of you, and there’s a clear answer for that decision given that data.

## Programmed by data

Since the dawn of the digital age, scientists have been striving to make a “thinking machine,” endowed with a human-like ability to solve any problem in any domain. That effort has had the same success as nuclear fusion: it’s always 25 years away. However, that doesn’t mean there hasn’t been a lot of progress. Since the ‘90s, researchers and businesses have started to use algorithms that are programmed by organically-created data — such as a list of financial transactions or an archive of U.N. transcripts. This approach — called machine learning — has proven to be very successful for these types of “easy” decisions, capable of nearing or matching human performance, but at orders of magnitude greater speed and dramatically reduced cost.

For example, it’s pretty easy for you to place that email entitled “You’re a Winner!” into your spam folder, but so many clutter your inbox everyday that they cumulate into a serious distraction. Having your email provider’s staff manually read your email wouldn’t just be creepy, it would be unfeasibly expensive. And, since spam is ever-evolving, it’s nearly impossible to write a fixed set of rules that does a good job. That’s why, when you flag a message as spam, [you are actually programming a machine learning algorithm](http://www.smithsonianmag.com/smart-news/how-google-keeps-your-spam-out-of-your-inbox-58828900/?no-ist). And machine learning isn’t new to government, either: the U.S. Postal Service was one of the early pioneers in implementing machine learning at a large scale. When you send a letter through the USPS, the address is read by an algorithm that has learned to turn images into text by training on a wide variety of handwritten addresses. Writing rules for every type of handwriting would be a nightmare — much better to program it by just showing it the data. Now, the system [reads 98 percent of the addresses perfectly](http://mentalfloss.com/article/53599/how-do-postal-workers-decipher-really-sloppy-handwriting), but when it gets stumped, the postal service still has handwriting experts on staff to step in. Reading an address is generally easy, but reading 160 billion of them every year is quite a chore.

## A little better on each sample

Machine learning is a subfield of computer science that focuses on the problem of learning from data. A “model” is an algorithm for making a prediction, paired with some way to train it — that is, a way to modify its prediction parameters to fit them to the data set. The training process is not magic: in many cases, the algorithms just tweak the parameters after each sample to do a little bit better next time. Once the model is trained, you can use it to make predictions on new data that’s in the same format you trained it on — that’s it!

For example, American Express has access to a long list of transactions from their customers, along with what transactions were reported as fraudulent. In the past, they would write out a long list of rules for determining if a transaction is fraudulent — for example, “if the transaction is in a different country and greater than $1,000, it is fraudulent.” These rules were written by human analysts that studied patterns in the data, but that approach proved to be expensive and difficult to manage.

Now, [they use a machine learning approach](https://www.mapr.com/blog/machine-learning-american-express-benefits-and-requirements#.Vhba6o93mRt): programmers define a model that takes in a transaction, and predicts whether or not the transaction is fraudulent. It starts out with random parameters that make terrible predictions, but by adjusting the parameters a little bit for each transaction to get closer to the right answer, it gets better and better. Eventually, it presents a short list of fraudulent transactions to an AmEx representative, and they give you a call asking if you just bought $2,500 worth of Pez dispensers. Machine learning is responsible for the success of fraud detection, spam filtering, Google Translate, driverless cars, and much more. When there is not enough data available, or where legal or regulatory constraints are at play, handwritten rules can still be used alongside the machine learning approach.

## Machine learning and government

Here at 18F, we think **there’s a big opportunity to make government more efficient** by using the massive paper trail that government agencies have been creating over the decades as datasets for machine learning algorithms. For example, payments made by an agency may be flagged as “improper” — by utilizing the history of transactions and flags, a machine learning system may be able to automatically filter down the list of transactions to those most likely to be improper. Or, if an agency has a large body of documents, we could build a tool to explore and organize them using modern search and natural language processing. Or, a machine learning system could be used to reduce duplicate entries in an database — recognizing that “two” businesses with a similar address and the same phone number probably refer to the same real-life entity.

In most cases, it will be a human making the final decision on whether or not to take action, but even then the system can be used to organize and accelerate the process. Machine learning systems are tools that allow more focus on the hard problems of government, not robotic overlords. And they don’t have to be time consuming or expensive to build: by leveraging the outstanding advances in open source machine learning software, a small team can put together a functional prototype in several weeks. You don’t necessarily need a ton of data, either: in most cases a couple thousand samples is sufficient to determine if machine learning will work in your application. If you’re curious about how machine learning or other data services could be used in your agency, feel free to reach out to us at [inquiries18f@gsa.gov](mailto:inquiries18f@gsa.gov).

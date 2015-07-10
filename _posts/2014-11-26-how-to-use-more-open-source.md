---
title: "How to use more open source in your next federal IT aquisition" 
layout: post

authors:
 - robert
 - eric

tags:
- longread
- open source
- federal acquisitions


description: The history of open source software is a record of steadily turning tremendously expensive custom-built solutions into freely available infrastructure that you can simply take for granted. What once were astoundingly sophisticated, expensive human endeavors have become open source tools you can drop into place in your project on a whim.

---

The history of open source software is a record of steadily turning tremendously expensive custom-built solutions into freely available infrastructure that you can simply take for granted. What once were astoundingly sophisticated, expensive human endeavors have become open source tools you can drop into place in your project on a whim.

<!-- more -->

Open source has changed what it means to make software today. As Gunnar Hellekson has [argued](https://atechnologyjobisnoexcuse.com/2014/08/an-agency-that-learns/) "You can't run an organization today without knowing how to use open source." It's important that every federal CIO, CTO, architect, and program manager seeking to build or procure new IT projects understand that open source exists, that it can be of high quality and highly reusable, and how to use it securely.

In this post, we'll lay out the story of how software tools become open source commodities, how to make use of open source in your projects, and how to think about the security dynamics of open source software.

## Understanding commoditization trends

The federal knowledge worker who shares responsibility for an IT project cannot escape the need to understand trends in the commoditization of information technology.

By commoditization, we mean the relentless evolution of technology: from a unique idea, to custom-built usage, to a widely used Commercial Off-The Shelf (COTS) product, into a Free Open Source Software (FOSS) commodity. By commodity, we mean a product, function, or service that is broadly and cheaply available. It is natural for important software systems to eventually become commodities.

The end point of this evolution is always a freely available, reliable, open source software project supported by a large, accommodating community. In other words, a broadly supported Free Open-Source Software (FOSS) project is the ultimate commoditization of a Commercial Off-The Shelf (COTS) project. FOSS is COTS, whether a firm ever offers paid support for it or not.

As projects become more stable and widely used, they develop communities of supporters and users. These communities prevent the negative aspects of being dependent upon, or locked-in to, a single entity for support. No federal project should be handcuffed to a tiny, unproductive development community. The best way to harness the innovative effort of a large number of people is to use a mature, commoditized project that many people are actively contributing to---and that means using open source.

Let us illustrate these evolutionary processes by considering specific examples of two of the most important tools in information technology: the relational database system and full-text search engines.

### The commoditization of relational databases and full-text search engines by example

We can mark important events in the evolution of the relational database for end-users:

1. 1970: Codd published "A relational model of data for large shared data banks."
1. 1985: Michael Stonebraker begins Postgres project.
1. 1992: Linux becomes available on x86 architecture.
1. 1996: Postgres95 becomes an open source project.
1. 2004: At least one firm provides commercial support.
1. 2007: PostgreSQL either comes with a Linux distribution or can be installed in 20 minutes.
1. 2014: PostgreSQL can be installed in five minutes, is more convenient to use, and is a common backbone of 18F's projects and many commercial firms.

<img alt="ThirtyYearHistoryOfPostgresAndLucene (1).png" src="/assets/images/2014/11/25/image00.png" style="width: 624.00px; height: 468.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title="">


The above graph shows our subjective evaluation of the usefulness of PostgreSQL relative to its total cost of ownership. This "geometrically" increasing usefulness is familiar from hardware performance curves plotted against time, but in this case owes very little to that phenomenon. Rather, it represents the typical commoditization of software. The community of users and developers drive important software tools from unique inventions to broadly available tools. Along the way, the tool usually becomes a commercial product, and then becomes available as an open source alternative.

The same diagram also plots the even more rapid evolution of a an open source full-text search engine, called Lucene.

1. 1999: Doug Cutting writes Lucene and makes it available at SourceForge.
1. 2001: Lucene becomes part of Jakarta.
1. 2005: Lucene becomes top-level Apache Foundation project
1. 2008: SOLR 1.3 released
1. 2007: A firm begins providing commercial support for Lucene, SOLR, and related technology.
1. 2010: A different firm raises $10M in venture capital.
1. 2013: SOLR and ElasticSearch widely used by Presidential Innovation Fellows, the Consumer Financial Protection Bureau, and other government teams.

[Simon Wardley](http://blog.gardeviance.org/) has articulated and popularized the [Wardley-Duncan map](http://blog.gardeviance.org/2013/03/basics-repeated-again.html), a visual representation of evolution and value for general systems. The Wardley-Duncan maps below subdivides the __Evolution axis__ to reflect the general evolution and commoditization of open source software. We observe that software naturally evolves through stages, which in a federal context we name:

1. Unique/agency owned
1. Custom/contractor written and closed source
1. Productized into COTS
1. Commoditized FOSS, which is also a form COTS
1. Broadly supported, meaning having commercial support or having a very large support communitymaking it practically risk-free and very convenient, or in other words, a utility

On the __Value Chain axis__, we have inserted the [standard three-tier architecture](https://en.wikipedia.org/wiki/Multitier_architecture), consisting of a Persistence Layer, Business Logic Layer, and Presentation Layer.

<img alt="PostgresTemplateOpenSourceThreeLayerWithDecorations (1).png" src="/assets/images/2014/11/25/image03.png" style="width: 624.00px; height: 468.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title="">

_The evolution of PostgreSQL_

<img alt="LuceneTemplateOpenSourceThreeLayerWithDecorations (1).png" src="/assets/images/2014/11/25/image04.png" style="width: 624.00px; height: 468.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title="">

_The evolution of Lucene_

We can now use these modified maps to understand the evolution of PostgreSQL and Lucene in greater detail, and therefore the evolution of relational databases and full-text search engines.

## How to use the Wardley-Duncan map

Simon Wardley has written extensively about how business people can use maps to understand a competitive landscape and succeed at business. We now recap his basic approach, particularly aimed at the federal program manager, acquisition officer, or executive responsible for a software system.

__First, identify the 10 most important software components of your system.__ Analyze them in terms of whether they are part of the Persistence, Business Logic, or Presentation layers. In messy legacy systems, a component might be smeared across several layers, which can be represented as an oval that touches several layers.

__Now take each component and analyze it in terms of the evolution axis.__ That is, was it written by your agency, or by a contractor? Or are you using a COTS component which is not open source? Are you using open source components, and if so, are they broadly supported or not? In many systems, you will find a mix of these categories. For example, most systems will have a small amount of custom code. Systems vary widely in terms of how many open source components they utilize.

__Now draw a draft Wardley-Duncan map of our your system.__ A large whiteboard with sticky notes is a convenient way to do this, but you can also print out our basic disposable diagram by following this [link](https://18f.gsa.gov/consulting/docs/open_source_wardley_duncan_map_printable.pdf) to this diagram:

<span style="overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 624.00px; height: 468.00px;"><img alt="PrintableOpenSourceWardleyDuncanMap (2).png" src="/assets/images/2014/11/25/image02.png" style="width: 624.00px; height: 468.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title=""></span>

Now that you have analyzed your system, ask yourself if any "moves" are possible. A move would be a change to your system that changed the position of one of your components. For example, can you identify a part of your system which was written by a contractor whose function has now been mostly subsumed by the increasing power and commoditization of software? Are you using a product that has an open source equivalent? __In general, any move to the right on this diagram represents a chance to make your system more secure, robust, easier to support, and to save the taxpayer money.__

Often you can only "make a move" by splitting a component into two or more components. For example, you might currently have a search function which combines some sort of highly application-specific filtering with a word search that could be accomplished with a full-text search engine. If you split the search component into these two separate components, one of them could be moved to the right: the full-text search engine. Unfortunately, you can't split this node if you do not have someone technical enough to realize this possibility, and many program managers find themselves woefully understaffed of technical resources. 18F provides technical brainstorming services to assist with this through 18F Consulting

__Another type of move is to move "upward" by offering new functionality which does not currently exist.__ For example, the FDA recently created an open API to its adverse drug effects database. This was the creation of a component or node at the Presentation Layer where none existed previously. The creation of GUIs for administration of relational databases and full-text search engines is another example of adding value.

## If you're building a new system

If you have the luxury of building a new, so-called "green field" system, try to keep each component of your system as highly evolved as possible. You can read more about this in the [US Digital Service Playbook](https://playbook.cio.gov/) plays numbered [5](https://playbook.cio.gov/#play5), [8](https://playbook.cio.gov/#play8), and [13](https://playbook.cio.gov/#play13). [Play #9](https://playbook.cio.gov/#play9), "Deploy in a flexible hosting environment" can be seen as recommending the same thing in deployment environment by using "cloud computing," which is really just the commoditization of _running_ software systems, as opposed to the commoditization of software _programs._

## A checklist of highly commoditized components

Take a full, uninterrupted afternoon to apply this checklist to your system. It will help if you have drawn a fully analyzed Wardley-Duncan map of your system, or at least a good list of your components. Ask yourself how each of the following highly commoditized technologies could be applied to your project, and how you can take advantage of the commoditization of each of these to lower costs and mitigate risk by using more evolved (read: open source) versions:

1. The cloud (commoditized running computer systems)
1. Content management Systems (for example, Drupal, WordPress, GitHub Pages)
1. Full-text search engines (for example, SOLR, Elasticsearch, Lucene)
1. GUI frameworks (for example, Bootstrap, PureCSS, Kube)
1. Application frameworks (for example, Rails, Django, Express)
1. No-SQL databases (for example, MongoDB, Redis)
1. Relational databases (for example, Postgres, MySQL)

If you have a legacy system, you may very well have to imagine decomposing one of your existing components into several components. For example, if you are storing documents in your relational database today, in order to take advantage of a Content Management System you might have to split your database into two components, one of which stores structured data, and the second of which may be implemented with a content management system.

The cloud is just other people's computers. For operating computer systems, the end point of commoditization is cloud computing, or in other words, the convenient, elastically and inexpensively available computing resources in the form of complete running computers as a service. 18F is developing "Infrastructure as a Service" to make this even easier for Feds by reselling access to managed servers at cost.

## Using more open source software

We have asserted that open source software represents the endpoint of a commoditization trend which must be reckoned with to properly serve the U.S. taxpayer.

The open source community and the availability of open source code appears to be growing explosively. At the end of 2013, GitHub [announced that they had 10 million repositories](https://github.com/blog/1724-10-million-repositories), and published this chart:

<span style="overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 624.00px; height: 349.33px;"><img alt="68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f343438332f313830333636372f62306564363634652d366332342d313165332d393535392d6535373032323135633437612e706e67 (1).png" src="/assets/images/2014/11/25/image01.png" style="width: 624.00px; height: 349.33px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title=""></span>

However, in the words of Theodore Sturgeon defending science fiction, "90% of everything is crud." Most of the repositories (or "repos") at GitHub, are simple copies of more important repos. Moreover, most of the projects at GitHub do not have any great importance or an active enough community to be particularly noteworthy for our purposes. Nonetheless, the tiny fraction of these 10 million systems that remain are an enormous number of valuable projects which can be used as building blocks to construct larger systems. In a sense, this explosion of the number of combinable projects represents the fulfilment of the [Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy), which Doug McIlroy has expressed as:

> Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface.

Writing today in 2014, he might have written: "Write programs to handle [JSON](https://en.wikipedia.org/wiki/JSON), which has now become a de facto standard for web APIs."

The practice of programming at the enterprise or system level has changed since 30 years ago. Then, a programmer's primary job was to write algorithms and data structures. Today, we spend most of our time figuring out how to reuse code that other people wrote. In this way, the Unix Philosophy, or as we more colorfully prefer to think of it, the Coming Open Source Singularity (COSS), makes us more productive. We believe from personal experience that we and other open source programmers are becoming something like 20% more productive every year, precisely because of the evolution of the open source code which we are able to reuse. This increase in productivity occurs for other programmers not working so completely with open source, but at a lower rate.

There is no more powerful force than compound interest. Twenty per-cent compounds explosively. The fact that the open source community is making each member of the community more productive so astoundingly rapidly impacts federal program managers and Acquisition Officers highly. Each year, the cost and time to develop software is going down, and the usefulness and reliability of this software is going up.

It may be difficult to perceive this transition in federal IT for two main reasons. The most significant is the deep outsourcing of technical expertise. The second is the complex nature of acquisition practices, some of which are forced by law and regulation, and some by habit. But the use of more open source software in the federal government can help to offset these two problems, and as good stewards, it is our duty to do so where possible.

There are two senses in which we may use open source in our programs.

1. The first is to reuse open source software from established projects.
1. The second is to make the software written on our behalf open source.
1. Although in principle similar, in practice these two uses require distinct considerations.

### How to reuse open source software

Clearly, reusing existing commoditized open source software can save the taxpayer's money, even if we purchase support from a commercial firm for the software. This is true whether the overall project is controlled directly by the agency, or, more commonly, the agency contracts outside firms to construct large programs.

However, open source software should not be reused willy-nilly, or to prove that it can be done, or to lend panache to the project. A project should be reused specifically to accomplish some purpose, generally to save having to write code oneself. Moreover, reusing a project represents a risk of bugs, bloat, and maintenance cost, just as writing your own code does. In general, we do not reuse a project unless it saves us about 20 lines of code.

Here are some rules of thumb to decide whether or not you should reuse a certain module, or insist that your contractors do so:

- Is the reuse saving us more than 20 lines of code?
- Is the project supported by a community whose size is proportional to the project size and complexity?
- If the project is on a socially-enable source code platform such as GitHub, look at its social activity: was it updated recently? Are there many contributors? Have many people "starred" the repository?
- Is it small enough that we can code review it ourselves, or is the community so large that we don't feel the need to directly code review it?
- Is it something which is unlikely to require frequent (more than a year) updates, and, if so, does it have a community which is producing updates in a disciplined way?

In other words, taking note both of the minor expense of reusing the project and the major expense of writing lines of code ourselves: __is the use of the project saving me time, risk, and money, rather than costing me time, risk and money?__

Ben Balter has written a summary of the [factors](http://fcw.com/articles/2014/09/30/9-things-to-look-for-in-an-open-source-project.aspx) [to consider](http://ben.balter.com/2014/06/02/how-to-identify-a-strong-open-source-project/) in evaluating an open source project. OSS Watch has published on [evaluating the sustainability](http://opensource.com/life/14/1/evaluate-sustainability-open-source-project) of an open source project. Although these considerations should be weighed and may seem difficult, it is important to note that with experience a software engineer can make a decision about a given open source module or repository in a few minutes. Such decisions can be easily reversed if new knowledge comes to light. The burden of deciding when to use an open-source module in your code is tiny compared to the coding time and bug fixing time that it saves you.

### How to use open source for your own code

In practice, the code which your agency writes or contracts to be written indirectly must be considered separately from the reuse of previously existing projects.

There are compelling security reasons that your application will be more secure if you insist that it be released to the public under an open source license from the time the [first line is written](https://18f.gsa.gov/2014/07/31/working-in-public-from-day-1/), which we discuss in the Security section below.

However, even beyond security, there are several reasons to make your code open source:

- Code which is open source by definition is not the private property or even private expertise of a single vendor. Open source prevents vendor lock-in.
- Like it or not, you are writing the legacy system of a decade from now, and the cost of maintaining it and eventually rewriting it will be much, much lower if it is written as open source from the start. Any contract written for the future maintenance or modification of the code will be based on complete knowledge of the code, which decreases uncertainty and therefore the risk to the bidder.
- Programmers do a better job when they know that their code is essentially becoming a matter of public record. Everyone hates embarrassment, and most programmers wish to be seen as craftspersons who take pride in their work.
- Finally, the US Taxpayer deserves to see and reuse the code that they are paying for, if they choose to do so. Even if the chances that what you write will be reused by the public is low, we should let them be the judge or that.

It is our hope that ten years from now there may be many people contributing to federal open source projects under tight code review.Today, the public is contributing more to libraries produced by the government than to applications.

## Security and open source

> "System security should not depend on the secrecy of the implementation or its components."

-- [Guide to General Server Security](http://csrc.nist.gov/publications/nistpubs/800-123/SP800-123.pdf), National Institute of Standards and Technology

A codebase is a terrible secret.

Because a codebase is so large, it cannot easily be changed. Furthermore, it must be known, or at least knowable, to the large number of people who work on it, so it cannot be kept secret very easily. This is represented at the bottom of figures two and three. Therefore "[security through obscurity](https://en.wikipedia.org/wiki/Security_through_obscurity)" is a terrible idea when it comes to a codebase. In most cases your system will consist of code which you reuse as well as code that your write yourself. Therefore both of these types of code should be open.

Of course, your system will have secrets in most cases -- keys, passwords, and the like -- but you should assume they have been discovered and change them often. We call these secrets a "red thread", because, like a red thread in a white handkerchief, they should be as vivid and thin as possible. By making them thin, such as a single password, you make them very easy to change and keep secret. Although these secrets are tiny, they must be managed carefully and conscientiously. We believe this concept is so important that we have placed it on our reusable version of the Wardley-Duncan map linked to above.

There are risks of defects and complexity associated with using open source modules indiscriminately. There are also security vulnerabilities to any system, either through negligence or by the intention of a bad actor. __The key to preventing this is code review.__

You must make sure that each component you use is code reviewed. In practice this means either that you must use very popular projects whose code is looked at by a large number of people on a regular basis, or you must use small projects which your team can code review itself. In practice, the criteria for making this decision for reused components is similar to the rules of thumb that we have already laid down for managing risk.However, you may need to adjust these rules of thumb based on how often you plan to update the component.

For example, a small component which is very stable need not be updated at all. If it is small and you can code review it or pay a team to code review it, then you may use it. On the other hand if the project has frequent updates, your team will have to decide how to manage these updates. A large project may have both stable and experimental branches. In general your team will want to update as frequently as the major number of the branch. If the project is very active and many people are looking at it, this does not represent a security risk. If however a project is changing rapidly and producing many releases and your team does not have the resources to ensure that each new release is code reviewed and you do not trust the community to do so, then you probably should not use that component.

With an open source component, it is at least possible to understand how much code review it is receiving.We know of no way to do this for closed source code kept as a secret.A firm which is asked to maintain the security of the code that it has written is placed in a conflict of interest. It isn't in its short-term interest to spend resources on this code review, and it is not in its short-term interest to admit defects.

### Security of your own code

Make all your code open and examinable from the start. Moreover, it is best to encourage as many people to look at it, because the more people who seriously review the code the more likely a security flaw is to be found. Programmers will code more securely when theircode is in the public's eyefrom the beginning.

Code that you write or contract to have written should be open source from the start, because it relieves you of the terrible risk and burden of maintaining the secrecy of the codebase. This means not only that it is published under an open source license as explained in our [open source policy](https://github.com/18F/open-source-policy/blob/master/policy.md), but that it is published in a [modern source code control system](http://ben.balter.com/2014/09/29/our-code-deserves-better/).

## 18F Consulting

The key to reuse is simple, but beyond the scope of this article: a modular architecture. In recent years, much of the technical expertise has been outsourced from the federal government procurement process. We created [18F Consulting](https://18f.gsa.gov/consulting/) to provide this much needed technical expertise on a consultative basis at cost to guide federal programs toward a modular architecture using agile methodologies. Please [contact us](mailto:18f@gsa.gov) for more information.

## Glossary

<table cellpadding="0" cellspacing="0" class="c34">
	<tbody>
		<tr >
			<td colspan="1" rowspan="1">18F</td>
			<td colspan="1" rowspan="1">An <a href="https://18f.gsa.gov/">incubator</a> using modern software development techniques for the federal government.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">18F Consulting</td>
			<td colspan="1" rowspan="1">A <a href="https://18f.gsa.gov/consulting/">consultancy</a> within 18F that provides services to federal program managers and other leaders who need assistance with designing and managing software acquisitions that use modern development techniques (e.g., agile, lean, open source).</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">application framework</td>
			<td colspan="1" rowspan="1">A software system that facilitates the construction of an application, such as a web application (e.g. <a href="http://rubyonrails.org">Rails</a>, <a href="https://www.djangoproject.com/">Django</a>, <a href="http://sailsjs.org/#/">Sails.js</a>.)</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">civic hacking</td>
			<td colspan="1" rowspan="1"><a href="http://hackforchange.org">Programming</a> for the public good in <a href="http://www.huffingtonpost.com/lily-liu/when-hacking-is-actually-_b_3697642.html">cooperation</a> with government.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">cloud computing</td>
			<td colspan="1" rowspan="1"><a href="https://en.wikipedia.org/wiki/Cloud_computing">Using</a> other people's computers.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">content management system</td>
			<td colspan="1" rowspan="1">A <a href="https://en.wikipedia.org/wiki/Computer_program"></a><a href="https://en.wikipedia.org/wiki/Content_management_system"> computer application</a> that allows publishing,editing and modifying <a href="https://en.wikipedia.org/wiki/Content_%28media%29"></a>content, organizing, deleting as well as maintenance from a central interface.</span></p><p class="c0 c7"><span ></span></p>
			</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">Elasticsearch</td>
			<td colspan="1" rowspan="1">Elasticsearch is a search server based on <a href="https://en.wikipedia.org/wiki/Lucene"></a><a href="https://en.wikipedia.org/wiki/Lucene">Lucene</a>.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">FISMA</td>
			<td colspan="1" rowspan="1">The <a href="https://en.wikipedia.org/wiki/Federal_Information_Security_Management_Act_of_2002">Federal Information Security Management Act of 2002</a>.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">full-text search engine</td>
			<td colspan="1" rowspan="1">A way to find things using <a href="https://en.wikipedia.org/wiki/Full_text_search">words </a>that occur in them.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">GUI framework</td>
			<td colspan="1" rowspan="1">A body of code which facilitates implementing a modern web-based and mobile interface (e.g. <a href="https://github.com/twbs/bootstrap">bootstrap</a>).</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">GitHub</td>
			<td colspan="1" rowspan="1">GitHub is a <a href="https://en.wikipedia.org/wiki/Git_%28software%29"></a><a href="https://en.wikipedia.org/wiki/Git_%28software%29">Git </a>repository <a href="https://en.wikipedia.org/wiki/Shared_web_hosting_service"></a> <a href="https://en.wikipedia.org/wiki/Shared_web_hosting_service">web-based hosting service</a> which offers all of the <a href="https://en.wikipedia.org/wiki/Distributed_revision_control"></a><a href="https://en.wikipedia.org/wiki/Distributed_revision_control">distributed revision control</a> and <a href="https://en.wikipedia.org/wiki/Revision_control"></a><a href="https://en.wikipedia.org/wiki/Revision_control">source code management</a>(SCM).</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">green-field</td>
			<td colspan="1" rowspan="1">A project <a href="https://en.wikipedia.org/wiki/Greenfield_project">unconstrained</a> by a legacy of past work.</td>

		</tr>
		<tr >
			<td colspan="1" rowspan="1">NoSQL database</td>
			<td colspan="1" rowspan="1"><a href="https://en.wikipedia.org/wiki/NoSQL">(Not Only SQL)</a> Data retrieval not based strictly on tables, such as key-value pair look up.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">Lucene</td>
			<td colspan="1" rowspan="1">Apache <a href="https://en.wikipedia.org/wiki/Lucene">Lucene</a> is a free open source<a href="https://en.wikipedia.org/wiki/Information_retrieval"></a>full-text search engine.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">open source</td>
			<td colspan="1" rowspan="1"><a href="https://en.wikipedia.org/wiki/Open-source_software">Open source</a> software (OSS)is <a href="https://en.wikipedia.org/wiki/Software">computer software</a> with its <a href="https://en.wikipedia.org/wiki/Source_code">source code</a> made available with a <a href="https://en.wikipedia.org/wiki/Open-source_license">license</a> in which the <a href="https://en.wikipedia.org/wiki/Copyright">copyright</a> holder provides the rights to study, change and distribute the software to anyone and for any purpose</span></p><p class="c0 c7"><span ></td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">PostgreSQL</td>
			<td colspan="1" rowspan="1">A widely used open source <a href="http://www.postgresql.org/about/history/">relational database management system</a>.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">relational database</td>
			<td colspan="1" rowspan="1">A <a href="https://en.wikipedia.org/wiki/Relational_database">relational database</a> stores information about both the data and how it isrelatedbased on tables.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">SOLR</td>
			<td colspan="1" rowspan="1"><a href="https://en.wikipedia.org/wiki/Apache_Solr">Solr</a> (pronounced "solar") is an <a href="https://en.wikipedia.org/wiki/Open-source_software">open source</a><a href="https://en.wikipedia.org/wiki/Enterprise_search"> enterprise search </a>platform from the Apache <a href="https://en.wikipedia.org/wiki/Lucene">Lucene</a> project.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">SourceForge</td>
			<td colspan="1" rowspan="1">A web-based source code sharing <a href="https://en.wikipedia.org/wiki/SourceForge">platform</a> of many project repositories.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">TechFAR</td>
			<td colspan="1" rowspan="1">A <a href="https://github.com/WhiteHouse/playbook/blob/gh-pages/_includes/techfar-online.md">Handbook</a> for procuring services using agile process</td>

		</tr>
		<tr >
			<td colspan="1" rowspan="1">Unix Philosophy</td>
			<td colspan="1" rowspan="1"><a href="https://en.wikipedia.org/wiki/Unix_philosophy">Write</a> small, recombinable programs.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">USDS</td>
			<td colspan="1" rowspan="1">The <a href="http://www.washingtonpost.com/blogs/the-switch/wp/2014/08/11/white-house-launches-u-s-digital-service-with-healthcare-gov-fixer-at-the-helm/">U.S. Digital Service</a>, which seeks to drive innovation and technical excellence.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">USDS playbook</td>
			<td colspan="1" rowspan="1">A concise <a href="https://playbook.cio.gov/">guide</a> to best practices for federal program managers and acquisition officers.</td>
		</tr>
		<tr >
			<td colspan="1" rowspan="1">Wardley-Duncan map</td>
			<td colspan="1" rowspan="1">A <a href="http://blog.gardeviance.org/2013/03/basics-repeated-again.html">chart</a> of components using evolution and closeness to end-user as axes.</td>
		</tr>
	</tbody>
</table>

## Further reading

- Codd, E. F. (1970). ["A relational model of data for large shared data banks"](http://www.seas.upenn.edu/~zives/03f/cis550/codd.pdf). Communications of the ACM13(6): 377.[doi](https://en.wikipedia.org/wiki/Digital_object_identifier): [10.1145/362384.362685](http://dx.doi.org/10.1145%2F362384.362685).
- Liu, Lily (2013) "When Hacking is Actually a Good Thing: The Civic Hacking Movement" [http://www.huffingtonpost.com/lily-liu/when-hacking-is-actually-_b_3697642.html](http://www.huffingtonpost.com/lily-liu/when-hacking-is-actually-_b_3697642.html)
- Lee, Gwanhoo, and Xia, Weidong (2010) "Toward Agile: An Integrated Analysis of Quantitative and Qualitative Field Data on Software Development Agility" MIS Quarterly Vol. 34 No. 1, pp. 87-114/March 2010
- Wardley, Simon (2013) "Basics … repeated … again …" [http://blog.gardeviance.org/2013/03/basics-repeated-again.html](http://blog.gardeviance.org/2013/03/basics-repeated-again.html)
- Balter, Ben (2011) "Towards a More Agile Government" [http://ben.balter.com/2011/11/29/towards-a-more-agile-government/](http://ben.balter.com/2011/11/29/towards-a-more-agile-government/)
- Balter, Ben (2014) "Why Isn't All Government Open Source" [http://ben.balter.com/2014/08/03/why-isnt-all-government-software-open-source/](http://ben.balter.com/2014/08/03/why-isnt-all-government-software-open-source/)
- Balter, Ben (2014)"9 things to look for in an open-source project" Federal Computer Weekly [http://fcw.com/articles/2014/09/30/9-things-to-look-for-in-an-open-source-project.aspx](http://fcw.com/articles/2014/09/30/9-things-to-look-for-in-an-open-source-project.aspx), September 30, 2014
- Hellekson, Gunnar (2014) " An Agency that Learns", [https://atechnologyjobisnoexcuse.com/2014/08/an-agency-that-learns/](https://atechnologyjobisnoexcuse.com/2014/08/an-agency-that-learns/), August 14, 2014.

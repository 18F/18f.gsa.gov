---
title: Structure the content
sidenav: our-approach
sticky_sidenav: true
parent_title: Content Guide
parent_permalink: /guides/content/
redirect_from:
  - /faqs
  - /how-users-read/
subnav:
  - text: Important information first
    href: '#important-information-first'
  - text: Short, punchy paragraphs
    href: '#short-punchy-paragraphs'
  - text: Descriptive headings
    href: '#descriptive-headings'
  - text: Heading tags
    href: '#heading-tags'
  - text: Lists
    href: '#lists'
  - text: Tables
    href: '#tables'
  - text: "Don’t use FAQs"
    href: '#dont-use-faqs'
---

It can be a little confusing when we talk about the structure of content: most writers think of the structure of their writing along the lines of chapters, sections, headings and paragraphs. But we know that people read web content a little differently than, for example, a magazine essay. And HTML gives us tools to build pages that support readers, especially those who use assistive technologies.

In this section, we will explain how to make it easier for all users to read your content.

Reams of research tell us that people don’t read web pages; they scan them. It’s understandable — most often, people are trying to accomplish a task when they visit your site, rather than trying to educate themselves about the mission of your organization.

So how do you support users that are just trying to get something done?

## Important information first
Online, people tend to scan text until they find the information they need. No matter how carefully you craft your content, most people will only read 25 percent of it. This statistic isn’t meant to dishearten; rather, we believe it underscores the importance of getting content right.

We recommend using the “inverted pyramid” style, putting the most important information at the beginning, and the second most important second, until the very least important information is delivered in the last thought. Hopefully you will have the research you need about your users to tell you what’s most important to them. Plan for user testing after launch to make sure you’ve got it right.

## Short, punchy paragraphs
You might think of webpages as a series of little inverted pyramids, so that, as the reader’s eye lands on a particular chunk of text, they see the information that (we believe) is most important to them.

## Descriptive headings
When readers are scanning your short paragraphs, it’s helpful for them to see a header that lets them know what they will find there. It’s better to be clear than clever here; your readers will be grateful that you saved them time by showing them where to find the thing they were looking for.

## Heading tags
HTML offers critical help in guiding users to the information they are looking for. Heading tags, such as `<h1>`, `<h2>`, and so forth, allow you to describe a hierarchy of information on the page; these tags should be used for the descriptive headings you’ll want to use to introduce short and punchy paragraphs. Designers can assign visual styling to these headings, and people who use assistive technologies can skip from heading to heading as a kind of table of contents to find the thing they are looking for.

## Lists
If you find yourself using several commas in a paragraph to separate items in a list, or if you repeat the same phrase over and over in a paragraph, you should probably use a bulleted list instead. Lists are easily scannable, and [studies have shown that our eyes naturally gravitate to list items](https://www.nngroup.com/articles/f-shaped-pattern-reading-web-content-discovered/). Assistive technologies, such as screen readers, will identify list items and read out the number of items in a list before reading out the list itself. If you’re listing several items, using an unordered (`<ul>`) or ordered (`<ol>`) list will benefit all users.

That said, try to keep your lists as simple as possible. If you have several levels in your list, the complexity might overwhelm the benefits of using a bulleted list. If that’s the case, try using a table instead.

## Tables
If you’re wrangling a lot of data, tables can help you visually organize that content. Long paragraphs cluttered with numbers or dates are more difficult to scan than, for example:

<table>
    <thead>
        <tr>
            <th>Report type</th>
            <th>Dates covered</th>
            <th>Due</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan="4">Quarterly (Form <a href="http://www.fec.gov/pdf/forms/fecfrm3i.pdf">3</a>, <a href="http://www.fec.gov/pdf/forms/fecfrm3i.pdf#page=19">3Z</a>, <a href="http://www.fec.gov/pdf/forms/fecfrm3li.pdf">3L</a>)</td>
            <td>January 1–March 31</td>
            <td>April 15</td>
        </tr>
        <tr>
            <td>April 1–June 30</td>
            <td>July 15</td>
        </tr>
        <tr>
            <td>July 1–September 30</td>
            <td>October 15</td>
        </tr>
        <tr>
            <td>October 1–December 31</td>
            <td>January 31</td>
        </tr>
    </tbody>
</table>

## Don’t use FAQs

Like our peers at GDS, we [strongly discourage writing FAQs](https://www.gov.uk/guidance/content-design/writing-for-gov-uk#do-not-use-faqs), or Frequently Asked Questions.

FAQs:

* Are hard to read and search for
* Duplicate other content on your site
* Are usually not questions asked by the public
* Mean that content is not where people expect to find it—it needs to be in context

If you’re thinking about posting FAQs, review the related content on your site and look for ways to improve it. Take the necessary steps to [give users the best possible experience](http://alistapart.com/article/no-more-faqs-create-purposeful-information-for-a-more-effective-user-experi#section3).

Ask yourself:

* Is the content organized in a logical way?
* Can you group similar topics together?
* Is it easy to find the right answer?
* Is it clear and up-to-date?

If people are asking similar questions, the existing content isn’t meeting their needs. Perhaps you need to rewrite it or combine several pieces of content. Pay attention to what users are asking for and find the best way to guide them through the process.

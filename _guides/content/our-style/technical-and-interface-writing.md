---
title: Technical and interface writing
sidenav: our-style
sticky_sidenav: true
parent_title: Content Guide
parent_permalink: /guides/content/
subnav:
  - text: Basics
    href: '#basics'
  - text: Guidelines
    href: '#guidelines'
---

At 18F, we often write technical documentation, guides, forms, and interface messages. In most of these cases, it’s safe to say the reader is learning something new or troubleshooting. These guidelines will help you write clear, concise instructions, which will provide your reader with the best possible experience.

## Basics

### Do the hard work to make it simple

Help the reader follow along. Break instructions or processes down into individual steps. Use short, simple sentences with words people use in everyday conversation.

Refer to navigation labels, buttons, and menus as they appear in the app or website. Verify the spelling and capitalization as you write. Be specific.

Instead of:

> Open a new meeting invitation.

Use:

> In Google Calendar, click **Create**.

### Direct the reader

Start your sentences with active verbs or clear objectives.

Instead of:

> Help us understand what kind of help you need by [creating an issue in GitHub](https://github.com/18F/content-guide/issues/new/).

Use:

> [Create an issue](https://github.com/18F/content-guide/issues/new/) with details about your request.

Or:

> To get started, [create an issue](https://github.com/18F/content-guide/issues/new/) in GitHub with details about your request.

Focus on what the reader can do rather than what they can’t. (This is known as using positive language.)

Instead of:

> You cannot continue without signing in.

Use:

> Sign in to continue.

## Guidelines

### Titles and headings

Be consistent with how you phrase titles. If your guide or tutorial has several pages, stick to the same naming convention for scannability, such as:

* Nouns: _Policies_, _Teams_, _Offices_
* Verbs: _Create an account_, _File a report_, _Download our data_

[Use sentence case]({{ "/our-style/capitalization#headings" | relative_url }}) for headings. (If you’re writing articles for the 18F Handbook or 18F Pages, the table of contents will auto-generate based on your `<h2>`, `<h3>`, and `<h4>` tags or Markdown headings.)

### Introduction

Include a short two- or three-sentence summary about the document to help the reader confirm whether they’re in the right place, and improve search engine indexing.

### Code

Use [backticks](https://help.github.com/articles/basic-writing-and-formatting-syntax/#quoting-code) to style text and code snippets readers may want to copy and paste. For example:

>  Use the `legend` element to offer a label within each form element.

> Copy and paste `mkdir /home/foo/doc/bar && cd $_` into Terminal.

In the first example, `legend` is an HTML element and should be styled as code. “Element” is a technical concept and shouldn't be marked up as code. “Label” is both a concept and an HTML element but is used here in the former sense and should not be styled as code.

Do not capitalize code elements, even at the start of a sentence, unless the term is capitalized in the code itself.

Use [fenced code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) for multi-line code snippets, and specify the language to enable [syntax highlighting on GitHub](https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting):

> In JavaScript, to get the current value of a `select` element with an `id` of  `mySelect`, use this:
>
> ```javascript
> var el = document.getElementById("mySelect");
> var value = el.options[el.selectedIndex].value;
> ```

Use [straight quotes](http://smartquotesforsmartpeople.com/) within code blocks rather than curly (or smart) quotes.

#### Code-like elements

The same rules apply to pieces of text that must be used exactly as presented, such as passwords or Wi-Fi network names:

> `someCl3v3rN4me` is the name of our Wi-Fi network.
> Your password is `PleaseChangeMeSoon`.

### Interface elements

Use clear verbs to tell readers how to interact with interface elements:

* _Choose_ from drop-down menus.
* _Select_ or _deselect_ checkboxes and radio buttons.
* _Click_ or _tap_ buttons.
* _Follow_ or _open_ links.

In the 18F Handbook, we emphasize the name of the interface label like so:

> 1. In the **File** menu, choose **Save**.
> 2. Select **I agree**.
> 3. Click **Continue**.

### Tables

Tables are generally suitable only for data: two or more “objects” (rows) that share two or more “values” (columns). In tables, column widths are the same for all rows, which can make them easier to scan visually. Tables are [easily navigable for sightless users](http://webaim.org/techniques/tables/) so long as the content is organized in a logical way. Here are some other guidelines to consider:

* When listing numbers, it’s good practice to align them to the right of their cell, with the same decimal precision (“40.50” and “1.00”) so that the numbers are easier to compare while scanning.
* Always align column headings up with the values in the columns. For example, numeric column headings should be aligned right if the values are, too.

### Links and additional resources

It’s rare that a document lives on its own. Tell people where to go for help if they have questions.

For documentation and guides, you might say:

> For more information, see the [18F Code of Conduct](https://github.com/18F/code-of-conduct).

To refer the reader to a Slack channel, follow this format from the 18F Handbook:

> Still have questions? Ask in [#newcomers](https://18f.slack.com/archives/newcomers).

If your work relates to several other documents, pick the most important ones or gather the links in a section at the bottom.

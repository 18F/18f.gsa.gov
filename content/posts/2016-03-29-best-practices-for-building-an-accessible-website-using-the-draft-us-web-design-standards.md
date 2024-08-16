---
title: "Best practices for building an accessible website using the Draft
U.S. Web Design Standards"
date: 2016-03-29
authors:
- maya
- julia
- nick
tags:
- best practices
- web design system
- accessibility
excerpt: "When you work for the federal government, accessibility isn’t simply a nice-to-have — it’s the law. That’s why the Draft U.S. Web Design Standards set developers on the path of creating websites that anyone can use. The Draft Standards feature documentation that can help you keep your websites accessible, even after you make modifications."
description: "TWhen you work for the federal government, accessibility isn’t simply a nice-to-have — it’s the law. That’s why the Draft U.S. Web Design Standards set developers on the path of creating websites that anyone can use. The Draft Standards feature documentation that can help you keep your websites accessible, even after you make modifications."
image: /assets/blog/web-design-standards/color-palette.jpg
---

When you work for the federal government, accessibility isn’t simply a
nice-to-have — [it’s the law](http://www.section508.gov/). That’s why
the [Draft U.S. Web Design
Standards](https://playbook.cio.gov/designstandards/) set developers on
the path of creating websites that anyone can use. The Draft Standards
feature documentation that can help you keep your websites accessible,
even after you make modifications.

Every UI component of the Draft Standards is coded and designed to meet
Section 508 standards. Below, we offer some best practices for building
an accessible website using the Draft Standards.

## Start with HTML5 with ARIA

We recommend using HTML5 with
[ARIA](http://w3c.github.io/html/dom.html#wai-aria). HTML5 gives
developers a lot of role elements out of the box, but it doesn't offer
everything ARIA does for accessibility. HTML5 with ARIA provides greater
accessibility across a wider range of accessible technology. Here is an
example of how we do this with the [footer
element](https://playbook.cio.gov/designstandards/footers/):

```
<footer role=”contentinfo”>
...
<svg width="26" height="39" role="img" aria-label="Facebook">
<title>Facebook</title>
<image xlink:href="{{ site.baseurl
}}/assets/img/social-icons/svg/facebook25.svg" src="{{ site.baseurl
}}/assets/img/social-icons/png/facebook25.png" width="26" height="39"
/>
</svg>
….
</footer>
```

By combining both the footer element and aria-label we have created a
more explicit and accessible way for folks to determine that there is a
Facebook image link in the footer element of the page.

## Testing Section 508 features

We maintain an [accessibility
checklist](https://pages.18f.gov/accessibility/checklist/) and have a
list of recommended tools that you can use to ensure Section 508
compliance.

During development, using automated tools like
[HTML_CodeSniffer](http://squizlabs.github.io/HTML_CodeSniffer/) or
the Google accessibility [audit
tools](https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb?hl=en)
is a solid start to make sure you catch common pitfalls in accessibility
standards.

We recommend following the Paciello Group Web Components [punch
list](https://www.paciellogroup.com/blog/2014/09/web-components-punch-list/).

For a final release, a manual review is the only way to ensure a quality
user experience. We recommend using a screen reader and an accessibility
API inspector tool such as Microsoft’s Inspect tool, available in the
Windows SDK, or Mac OS X's built-in screen reader, VoiceOver.

## Developed with WCAG 2.0 AA in mind

We developed the Draft Standards with [WCAG 2.0
AA](https://www.w3.org/WAI/WCAG20/quickref/) in mind. The upcoming
Section 508 Standards refresh references WCAG 2.0, which covers a wide
range of recommendations for making web content more accessible.

## Working with the CIOC Accessibility Community of Practice

We were able to [correct an accessibility
citation](https://github.com/18F/web-design-standards/issues/823)
quickly with the help of John Sullivan, the Section 508 Program
Director. We’re looking forward to working more closely with the Access
Board to monitor the state of accessibility in the Draft Standards.

## Documentation

Copying and pasting code without changing ARIA attributes for your use
case is just as bad than leaving them out completely. To combat this, we
included documentation with every component that includes how and when
to modify the code to ensure it stays accessible, along with general
best practices that apply to something thematically, like forms
templates.

## Colors (In relation to WCAG AA 2.0)

A flexible, yet distinctly American palette was designed to communicate
warmth and trustworthiness while meeting the highest standards of color
contrast requirements. Our colors meet WCAG AA with examples of how to
use them in combinations. People may need to change colors for their
agency’s needs so we encourage them to test the combinations themselves.
Teams can use [WebAIM's Color Contrast
Checker](http://webaim.org/resources/contrastchecker/))
to test foreground and background options and adjust their lightness and
darkness until they pass contrast requirements.

{% image "assets/blog/web-design-standards/color-palette.jpg" "Neutral text on a variety of color backgrounds." %}

By implementing these practices and leveraging the Draft Standards, we
hope to help create guidelines that will set you on the path to creating
accessible websites for everyone to use. If you have suggestions or
questions, please feel free to leave us feedback on
[GitHub](https://github.com/18F/web-design-standards/issues/new).

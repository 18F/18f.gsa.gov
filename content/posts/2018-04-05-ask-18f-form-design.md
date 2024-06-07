---
title: "Ask 18F — Can you share any tips or suggestions on designing surveys and forms?"
date: 2018-04-05
authors:
- elaine
- austin-hernandez
tags:
- ask 18f
- design
excerpt: "Ask 18F is an advice column that answers questions sent in by federal employees. Our technical experts aim to provide you helpful resources and a good starting point to tackle your problem. Got a question? No matter how small the task or how big the project, email us at 18f@gsa.gov"
---

_Ask 18F is an advice column that answers questions sent in by federal employees. Our technical experts aim to provide you helpful resources and a good starting point to tackle your problem. Got a question? No matter how small the task or how big the project, email us at [18f@gsa.gov](mailto:18f@gsa.gov)._

## Dear 18F: Can you share any tips or suggestions on designing surveys and forms?

### Austin Hernandez – Visual designer

#### UI design tips on designing surveys and forms

Form design is not just a User Interface (UI) or Visual Design question. A good form requires elements of [User Experience](https://uxplanet.org/10-rules-for-efficient-form-design-e13dc1fb0e03) (UX), [research](http://www.pewresearch.org/methodology/u-s-survey-research/questionnaire-design/), content, and development. It’s what you ask, how you ask it, what information you’re collecting, and what you intend to do with it. It’s also about how you build it, implement it, and store that information.

For the UI design, I usually start from a boilerplate like the [U.S. Web Design System](https://designsystem.digital.gov/components/form-templates/) because a lot of best-practice principles are built in. It’s accessible and works on desktop and mobile. When I design a new form from scratch, I use principles from Luke Wroblewski’s [Best Practices for Form Design](https://static.lukew.com/webforms_lukew.pdf). 

For languages that read left to right and top to bottom, here are some simple ways to design a form that will generally help with reducing reading errors and decreasing the time it takes to complete:

- **Align text and form elements to the left so a user's eyes don’t have to dart across their screen and arraign them in one vertical line.**
	- Stack the labels on top of the form fields.
	- Align the primary call to action (usually `submit` or `next` button) to the left, underneath the forms and labels.
- **Make the form easy to fill out and _appear_ easy to fill out.**
	- Reduce visual noise, clutter, and extraneous information.
	- Use white space and generous vertical space between elements.
	- Add [typographic hierarchy](https://webdesign.tutsplus.com/articles/understanding-typographic-hierarchy--webdesign-11636).
	- Group content sections together.
- **Make the form [accessible](https://a11yproject.com/checklist#forms).** 
	- Don’t rely solely on color to indicate required fields or error messages.
	- Make sure there is enough color contrast between the background and text.
	- Use attributes like `tabindex` so user actions are keyboard-friendly instead of requiring a mouse to navigate through a form.
	- Use tags like `<label>` so content types can be distinguished by a screen reader.
	- Consider adding helper text above an input field so it can be read by a screen reader in a logical order.
- **Make content a priority.**
	- Keep questions to the point, and ordered logically.
	- If your form has a lot of questions that are absolutely necessary, you could try a multi-page design, just make sure users know where they are in the process.
	- Write labels and instructions clearly using plain language.
	- Structure your questions so you get the best data.
	- Consider the input type you are using to collect responses (for example long form field vs. radio button vs. short form field vs. checkbox, etc.) 
- **Keep it human-centered and test with your users!**

You can also start off with a out-of-the-box solution like [Survey Monkey]( https://www.surveymonkey.com) or [Google forms](https://www.google.com/forms/about/) — a lot of research has gone into making those platforms successful. Also, nothing beats usability testing to make sure you’re designing a form for your specific user and business needs.

Here is an example of a form that applies principles like text alignment, grouping, and typography hierarchy.

<figure>
  {% image_with_class "assets/blog/advice/form.png" "image-shadowed" "An example of a form. Three sections all numbered from one to three. Each section has two text forms. At the bottom is a blue submit button and a cancel hyperlink that is red" %}
</figure>

#### Helpful links and examples:
- [Designing UX: forms](https://www.uxmatters.com/mt/archives/2017/05/designing-ux-forms.php)
- [Designing more efficient forms: assistance and validation](https://uxplanet.org/designing-more-efficient-forms-assistance-and-validation-f26a5241199d)
- [Plainlanguage.gov](https://www.plainlanguage.gov/)
- [FOIA’s request form](https://www.foia.gov/request/agency-component/25d63aa1-021a-4ff1-8ece-43fdea022601/#main) (based on [USWDS](https://designsystem.digital.gov/components/form-templates/), visual design by 18F’s Aviva Oskow): 
- [A11y](https://a11yproject.com/)
- [10 Best Practices for Designing User-Friendly Forms](https://www.uxmatters.com/mt/archives/2017/05/designing-ux-forms.php)

---
title: 18F UI style guide
subpage: Cards
permalink: /styleguide/cards/
---

The card component is used as a preview for project pages, but could be adapted to meet additional needs if necessary. The design is unique to [18f.gsa.gov](https://18f.gsa.gov), but leans heavily on the stylistic foundation of the U.S. Web Design Standards and 18F Brand guidelines.

{% capture styleguide_card %}{% raw %}
<section class="usa-grid-full usa-section">
  {% include card-project.html project='fec-gov' %}
  {% include card-project.html project='hhs-states' %}
  {% include card-project.html project='doi-every-kid-in-a-park' %}
</section>
{% endraw %}{% endcapture %}

{% capture card_description %}
To use cards, reference the file path slug in the _projects directory. Use another project as a template to fill in all of the necessary fields.

Each project card has a number of properties. The only required properties are:
* `image_src`: the project `image` field, and is the image portion of the card
* `image_alt`: the project `image_accessibility` field. Will be used to set the `alt` attribute on the provided image
* `agency`: the project `agency` field. This will be the uppercase text
* `tagline`: the project `subtitle` field and what appears to be the title of the card
* `description` the project `excerpt` and what appears as the body of the card
* `link`: the project `permalink`. This is where clicking on the card will take you
* `columns`: How many columns the cards should occupy. The only valid options are `2` and `3`. If nothing is specified, the cards will default to `3` columns
{% endcapture %}
{% include details-code.html
   title='cards'
   description=card_description
   content=styleguide_card
%}

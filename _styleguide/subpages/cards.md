---
title: 18F site UI style guide
subpage: Cards
permalink: /styleguide/cards
---

{% capture styleguide_card %}{% raw %}
<section class="usa-grid-full usa-section">
  {% include card-project.html project='fec-gov' %}
  {% include card-project.html project='hhs-states' %}
  {% include card-project.html project='doi-every-kid-in-a-park' %}
</section>
{% endraw %}{% endcapture %}

{% include details-code.html
   title='cards'
   description='To use cards, reference the file path slug in the _projects directory. Use another project as a template to fill in all of the necessary fields.'
   other_ref='https://github.com/18F/18f.gsa.gov/tree/master/_plugins'
   content=styleguide_card
%}

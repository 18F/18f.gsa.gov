---
title: 18F UI style guide
subpage: Buttons
permalink: /styleguide/buttons/
---


### Anatomy
<section class="usa-grid">
  <img src='{{ site.baseurl }}/assets/img/styleguide/button-anatomy.png'
       class='usa-width-one-third'
       alt='Image of the dimensions and padding of a button on the 18F site' />
</section>

{% capture styleguide_buttons %}
### Style on white
<section class="usa-grid">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>

### Style on dark
<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>

### Using anchor tags instead of buttons
<a class="usa-button usa-button-secondary" href="{{ dead_end_link }}">Normal</a>
{% endcapture %}


{% include details-code.html
   title='buttons'
   description='Our button styles closely resemble those defined by the U.S. Web Design Standards. We have overriden them in places to more closely align the look and feel with the 18F Brand.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/buttons.scss'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/elements/_buttons.scss'
   content=styleguide_buttons
%}


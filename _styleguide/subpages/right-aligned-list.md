---
title: 18F UI style guide
subpage: Right aligned list
permalink: /styleguide/right-aligned-list/
---

This attribute is found in the contact and project pages on the 18F site. This feature provides at-a-glance information. 

{% capture right_aligned_list %}{% raw %}
<div class="usa-grid-full usa-grid-reversed">
<aside class="usa-grid usa-section usa-grid-reversed-right usa-width-one-third section-info section-info-gray">
  <ul>
    <li class="section-info-list-item">
      <div class="section-info-header">Section header</div>
      <p>Supporting subheader</p>
    </li>
    <li class="section-info-list-item">
      <div class="section-info-header">List of helpful reference links</div>
      <ul>
        <li>link to agency 1: <a href="">agency1.gov</a></li>
        <li>link to more info: <a href="">More info</a></li>
        <li>Twitter: <a href="">@agency</a></li>
        <li>GitHub: <a href="">link to repo</a></li>
      </ul>
    </li>
  </ul>
</aside>
<div class="usa-grid usa-section usa-width-two-thirds">

{% markdown %}

### Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
{% endmarkdown %}

{% endraw %}{% endcapture %}

{% capture right_list_description %}
How to goes here
{% endcapture %}
{% include details-code.html
   title='right-list'
   description=right_list_description
   content=right_aligned_list
%}
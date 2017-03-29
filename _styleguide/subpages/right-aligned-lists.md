---
title: 18F UI style guide
subpage: Right aligned lists
permalink: /styleguide/right-aligned-lists/
---

This attribute is found in the [contact]({{ site.baseurl }}/contact) and [project pages]({{ site.baseurl }}/what-we-deliver/federalist/) on the 18F site. This feature provides at-a-glance information.

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
    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
{% endraw %}{% endcapture %}

{% capture right_list_description %}
- The right aligned list should be placed first in the HTML before the main content on the left.
- In the `<aside>` tag we use the `usa-grid-reversed-right` class. This class reverses the order in which the HTML is displayed so that the content that would normally appear on the left will appear on the right instead. The order is not reversed in mobile.

{% endcapture %}
{% include details-code.html
   title='right-list'
   description=right_list_description
   content=right_aligned_list
%}

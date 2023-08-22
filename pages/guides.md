---
title: Guides
permalink: /guides/
layout: primary
lead: Principles and standards that shape our work
banner_cta: true
---

{% capture intro %}
18F’s work with other agencies is built on user-centered development, testing to validate hypotheses, shipping often, and deploying products in the open. Below are the technical guides that bring those principles into our day-to-day&nbsp;work.
{% endcapture %}

{% capture public_domain %}
Beyond helping 18F staff do their best work, we hope these guides will inspire other federal agencies to adopt new practices. 18F’s projects with other federal agencies show that these techniques can help projects stay within budget, provide excellent value to the public, and fulfill federal rules.

These guides, and all of 18F's work, are in the [worldwide public domain](https://github.com/18F/18f.gsa.gov/blob/main/LICENSE.md){:.usa-link--alt}. You are free to copy and adapt them as you choose. If you see something amiss or want to suggest a change, there are links at the bottom of each guide to help you contribute.
{% endcapture%}

<section class="usa-section usa-section--dark section-padding-sm bg-primary-darker">
  <div class="grid-container">
    <div class="grid-row">
      <div class="grid-col-12 font-sans-lg">
        {{ intro | markdownify }}
      </div>
    </div>
    <div class="grid-row grid-gap margin-top-5">
      {% for guide in site.data.guides %}
        <div class="tablet:grid-col-6 margin-bottom-5">
          {% include card-with-image.html 
             text_content=guide.name
             link_url=guide.link
             image_path=guide.image.dark
             image_side="right"
          %}
        </div>
      {% endfor %}
    </div>
    <div class="grid-row">
      <div class="grid-col-12">
        {{ public_domain | markdownify }}
      </div>
    </div>
  </div>
</section>


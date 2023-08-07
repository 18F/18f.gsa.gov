---
title: Our work
permalink: /our-work/
layout: primary
lead: See how we’ve helped agencies deliver value to the American people.
content_wide: true
content_focus: false
redirect_from:
  - /what-we-deliver/
  - /consulting/
  - /what-we-deliver/military-onesource/
  - /what-we-deliver/every-kid-in-a-park/
  - /what-we-deliver/micro-purchase-marketplace/
  - /what-we-deliver/ready-2-serve/
  - /what-we-deliver/new-ten/
banner_cta: true
gridless: true
---

<section class="bg-primary-darker usa-section--dark"> 
<div class="grid-container usa-section">
  <div class="grid-row">
    <div class="grid-col-12 margin-bottom-4">
      <p class="font-sans-lg">
        Since 2014, 18F has worked with federal, state, and local agencies to improve the user experience of government. Get in touch to talk about how we can work together.
      </p>
    </div>
    <div class="grid-col-12">
      <a class="usa-button a18f-button--accent"
         href="{{ site.baseurl }}/contact/"
       >Get in touch
       </a>
    </div>
  </div>
</div>
</section>

<section class="usa-section case-section bg-base-lightest">
    <div class="grid-container">
      <div clas="grid-row"> 
          <h2 class="margin-bottom-5">Case studies</h2>
      </div>
      <div class="grid-row grid-gap">
      <ul class="usa-card-group">
        {% assign featured_services = site.data.featured_services %}
        {% assign projects_list = site | find_collection: 'services_projects' | weighted_sort: 'project_weight', 'title' %}
        {% for featured in featured_services %}
          {% assign featured_project = projects_list | where: "agency", featured.agency | first %}
          {% include card.html project=featured_project.slug %}
        {% endfor %}
      </ul>
      </div>
    </div>
    {%- comment -%} <p>
      <a class="link-arrow-right post-link-continue_reading" href="{{ '/work-with-us/' | prepend: site.baseurl }}">
        See all case studies
        {% include svg/icons/arrow-right.svg %}
      </a>
    </p> {%- endcomment -%}
</section>

{% include testimonial.html
 quote="18F’s philosophy to build everything openly by default has been a key success factor in our ability to build credibility with the external stakeholders who have been critical of us previously. More importantly, this way of building facilitates innovation in an eco-centric manner as opposed to just within the government or a few entities."
 attribution="Christina Ho"
 position="Former Deputy Assistant Secretary"
 organization="Office of Accounting Policy & Financial Transparency, Department of the Treasury"
 agency_image="treasury.svg"
 %}

<div class="usa-section bg-base-lightest">
  <section class="grid-container">
    {% assign agency_partners = site.data.agencies %}
    {% assign partner_groups = agency_partners | in_groups: 3 %}
    <ul class="grid-row grid-gap usa-list--unstyled">
      {% for partner in agency_partners %}
      <li class="tablet:grid-col-4 display-flex flex-align-center margin-top-3">
            <img
              class="margin-right-105 maxw-7"
              src="{{ partner.logo | prepend: site.baseurl }}"
              alt=""
            />
            {% if partner.agency_url %}
            <a
              class="list-images-text"
              href="{{ partner.agency_url | prepend: site.baseurl }}"
              >{{ partner.name }}</a
            >
            {% else %}
            <span class="list-images-text">{{ partner.name }}</span>
            {% endif %}
        </li>
      {% endfor %}
    </ul>
    {% comment %}
    <h2 id="some-agencies-weve-worked-with">Some agencies we’ve worked with</h2>
      <ul class="agency-lists grid-row grid-gap">
      {% for group in partner_groups %}
        <li class="tablet:grid-col-4">
          <ul class="agency-lists list-images">
          {% for partner in group %}
            <li class="list-images-item">
              <img class="list-images-image" src="{{ partner.logo | prepend: site.baseurl }}" alt="" />
              {% if partner.agency_url %}
                <a class="list-images-text" href="{{ partner.agency_url | prepend: site.baseurl }}">{{ partner.name }}</a>
              {% else %}
                <span class="list-images-text">{{ partner.name }}</span>
              {% endif %}
            </li>
          {% endfor %}
          </ul>
        </li>
      {% endfor %}
      </ul>
     {% endcomment %}
  </section>
</div>

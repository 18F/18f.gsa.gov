---
title: What we deliver
permalink: /what-we-deliver/
layout: primary
lead: Strategies and services that help agencies provide excellent value to the public.
content_wide: true
content_focus: false
redirect_from:
  - /consulting/
  - /what-we-deliver/military-onesource/
  - /what-we-deliver/every-kid-in-a-park/
  - /what-we-deliver/micro-purchase-marketplace/
  - /what-we-deliver/ready-2-serve/
  - /what-we-deliver/new-ten/
banner_cta: true
gridless: true
---
<div class="grid-container usa-section break-bottom-gray">
  <section class="grid-row">
    <div class="tablet:grid-col-8">
      <p>
        18F partners with federal agencies to improve the user experience of government 
        services by helping them build and buy technology. If you're looking to implement 
        a requirement, update a public-facing website, or digitize a process, 18F can work with 
        you to build a product or craft and execute an effective agile acquisition strategy.
      </p>
    </div>
  </section>
</div>

<div class="grid-container">
  <section class="usa-section break-bottom-gray">
    <div class="usa-section-bottom">
      <h2>Case Studies</h2>
      <div class="grid-row grid-gap">
        {% assign featured_services = site.data.featured_services %}
        {% assign projects_list = site | find_collection: 'services_projects' | weighted_sort: 'project_weight', 'title' %}
        {% for featured in featured_services %}
          {% assign project = projects_list | where: "agency", featured.agency | first %}
          {% include card.html
          image_src=project.image
          image_alt=project.image_accessibility
          image_icon=project.image_icon
          agency=project.agency
          tagline=project.title
          description=project.excerpt
          link=project.permalink
          %}
        {% endfor %}
      </div>
    </div>
    {%- comment -%} <p>
      <a class="link-arrow-right post-link-continue_reading" href="{{ '/how-we-work/' | prepend: site.baseurl }}">
        See all case studies
        {% include svg/icons/arrow-right.svg %}
      </a>
    </p> {%- endcomment -%}
  </section>
</div>

<section class="grid-container usa-section break-bottom-gray">
  <section class="pad-right-left">
    <div class="home-testimonial">
      18F’s philosophy to build everything openly by default has been a key success factor in our ability to build credibility with the external stakeholders who have been critical of us previously. More importantly, this way of building facilitates innovation in an eco-centric manner as opposed to just within the government or a few entities.
      <span>
        - Christina Ho, Former Deputy Assistant Secretary, Office of Accounting Policy & Financial Transparency, Department of the Treasury
      </span>
    </div>
  </section>
</section>

<div class="usa-section background-gray">
  <section class="grid-container">
    {% assign agency_partners = site.data.agencies %}
    {% assign partner_groups = agency_partners | in_groups: 3 %}
    <h2 id="some-agencies-weve-worked-with">Some agencies we’ve worked with</h2>
    <div>
      <ul class="list-columns grid-row grid-gap">
      {% for group in partner_groups %}
        <li class="tablet:grid-col-4">
          <ul class="list-columns list-images">
          {% for partner in group %}
            <li class="list-images-item">
              <img class="list-images-image" src="{{ partner.logo | prepend: site.baseurl }}" alt="{{ partner.logo }} logo" />
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
    </div>
  </section>
</div>

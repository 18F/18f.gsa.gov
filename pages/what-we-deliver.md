---
title: What we deliver
permalink: /what-we-deliver/
layout: primary
lead: Strategies, services, and products that help agencies provide excellent value to the public.
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
<div class="usa-grid usa-section break-bottom-gray">
  <section>
    <div class="usa-width-two-thirds">
      <h2>Services &amp; products</h2>
      <p>
        18F partners with federal agencies to improve the user experience of government
        services by helping them build and buy technology. If you're looking to implement
        a requirement, update a public-facing website, or digitize a process, 18F can work
        with you to build a product or craft and execute an effective agile acquisition
        strategy.
      </p>
      <p>
        In addition to 18F's custom services, we also operate products that you can use
        to reduce costs and improve the security and usability of your services.
      </p>
    </div>
  </section>
</div>

<div class="usa-grid">
  <section class="usa-section break-bottom-gray">
    <div class="usa-section-bottom">
      <h2>Services</h2>
      <div class="usa-flex usa-flex-wrap">
        {% assign projects_list = site | find_collection: 'services_projects' | weighted_sort: 'project_weight', 'title' %}
        {% for project in projects_list %}
          {% if forloop.index < 7 %}
            {% include card.html
            image_src=project.image
            image_alt=project.image_accessibility
            image_icon=project.image_icon
            agency=project.agency
            tagline=project.title
            description=project.excerpt
            link=project.permalink
            %}
          {% endif %}
        {% endfor %}
      </div>
    </div>
    <p>
      <a class="link-arrow-right post-link-continue_reading" href="{{ '/how-we-work/' | prepend: site.baseurl }}">
        See all case studies
        {% include svg/icons/arrow-right.svg %}
      </a>
    </p>
  </section>
</div>

<section class="usa-grid usa-section break-bottom-gray">
  <section class="pad-right-left">
    <div class="home-testimonial">
      18F’s philosophy to build everything openly by default has been a key success factor in our ability to build credibility with the external stakeholders who have been critical of us previously. More importantly, this way of building facilitates innovation in an eco-centric manner as opposed to just within the government or a few entities.
      <span>
        - Christina Ho, Former Deputy Assistant Secretary, Office of Accounting Policy & Financial Transparency, Department of the Treasury
      </span>
    </div>
  </section>
</section>

<div class="usa-grid">
  <section class="usa-section">
    <div class="usa-section-bottom">
      <h2>Products</h2>
      <div class="usa-flex usa-flex-wrap">
        {% assign projects_list = site | find_collection: 'products_projects' | weighted_sort: 'project_weight', 'title' %}
        {% for project in projects_list %}
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
  </section>
</div>

<div class="usa-section background-gray">
  <section class="usa-grid">
    {% assign agency_partners = site.data.agencies %}
    {% assign partner_groups = agency_partners | in_groups: 3 %}
    <h2 id="some-agencies-weve-worked-with">Some agencies we’ve worked with</h2>
    <div class="usa-grid-full">
      <ul class="list-columns">
      {% for group in partner_groups %}
        <li class="usa-width-one-third">
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

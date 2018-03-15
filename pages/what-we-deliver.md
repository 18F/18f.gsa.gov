---
title: What we deliver
permalink: /what-we-deliver/
layout: primary
lead: Websites, applications, and strategies that help agencies provide excellent value to the public.
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

<div class="usa-grid">
  <section class="usa-section">
    <div class="usa-section-bottom">
      <h3> Services </h3>
       <p>We partner with federal agencies to build, buy, and share digital services that improve the user experience of government. With help from 18F, agencies have moved manual paper processes online, greatly increased data access and usability, saved millions on cloud hosting, and implemented new acquisition techniques. Here are a few examples of the projects we’ve worked on with more than 50 offices and agencies.</p>
      <div class="usa-flex usa-flex-wrap">
        {% assign projects_list = site | find_collection: 'services_projects' | weighted_sort: 'project_weight', 'title' %}
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
    <h3> Products </h3>
     <p>In addition to 18F’s custom services, we also operate a number of products that agencies can use to reduce costs and improve the security and usability of their services. These products work together to make building and releasing systems easier, and they can integrate with your existing services.</p>

    <div class="usa-flex usa-flex-wrap">
      {% assign projects_list = site | find_collection: 'products_projects' | weighted_sort: 'project_weight', 'title' %}
      {% for project in projects_list %}
        {% include card.html
         image_src=project.image
         image_alt=project.image_accessibility
         image_icon=project.image_icon
         tagline=project.title
         description=project.excerpt
         link=project.permalink
        %}
      {% endfor %}
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

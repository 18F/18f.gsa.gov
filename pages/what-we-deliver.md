---
title: What we deliver
permalink: /what-we-deliver/
layout: default-intro
lead: We help federal agencies build, buy, and share modern digital services to improve the user experience of government.
content_wide: true
content_focus: false
redirect_from:
  - /consulting/
banner_cta: true
gridless: true
---

<div class="usa-grid">
  <section class="usa-section">
    <div class="usa-section-bottom">
      <div class="small-caps small-caps-no-margin">Projects</div>
      <h3>We’ve worked with more than 50 offices and agencies on more than 200 engagements.</h3>
      <p>All our projects support agencies in transforming how they deliver digital services and technology products. Here are a few of the projects we’ve worked on.</p>
    </div>
    <div class="usa-flex usa-flex-wrap">
      {% assign projects_list = site | find_collection: 'projects' | weighted_sort: 'project_weight', 'title' %}
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
    <h2 id="agencies-weve-worked-with">Agencies we’ve worked with</h2>
    <div class="usa-grid-full">
      <ul class="list-columns">
      {% for group in partner_groups %}
        <li class="usa-width-one-third">
          <ul class="list-columns">
          {% for partner in group %}
            <li>
              {% if partner.agency_url %}
                <a href="{{ partner.agency_url | prepend: site.baseurl }}">{{ partner.name }}</a>
              {% else %}
                {{ partner.name }}{% if partner.acronym %} ({{ partner.acronym }}){% endif %}
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

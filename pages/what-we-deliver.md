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
    <div class="usa-flex usa-flex-wrap">
      {% assign projects_list = site | find_collection: 'projects' | sort: 'title' %}
      {% for project in projects_list %}
        {% include card.html
         image_src=project.image
         image_alt=project.image_accessibility
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
    {% assign agency_partners = site | find_collection: 'projects' | where_obj: 'agency' | sort: 'agency' %}
    {% assign partner_groups = agency_partners | in_groups: 3 %}
    <h2>Agencies we’ve worked with</h2>
    <div class="usa-grid-full">
      <ul class="list-columns">
      {% for group in partner_groups %}
        <li class="usa-width-one-third">
          <ul class="list-columns">
          {% for partner in group %}
            <li>
              {% if partner.agency_url %}
                <a href="{{ partner.agency_url | prepend: site.baseurl }}">{{ partner.agency }}</a>
              {% else %}
                {{ partner.agency }}
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

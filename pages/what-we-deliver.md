---
title: What we deliver
permalink: /what-we-deliver/
layout: default-intro
lead: We help federal agencies build, buy, and share modern digital services to improve the user experience of government.
content_wide: true
redirect_from:
  - /consulting/

---
<section class="usa-section">
  <h2>Who and how we've helped</h2>
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

<section class="usa-section">
  {% assign agency_partners = site | find_collection: 'projects' | where_obj: 'agency' | sort: 'agency' %}
  {% assign partner_groups = agency_partners | in_groups: 3 %}
  <h2>Agency Partners and public offerings</h2>
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
</section>

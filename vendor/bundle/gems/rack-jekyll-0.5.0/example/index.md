---
layout: default
---

# Rack-Jekyll Demo

Blog posts:

<ul>
  {% for post in site.posts %}
  <li>
    <span class="date">{{ post.date | date_to_string }}:</span>
    <a href="{{ post.url }}">{{ post.title }}</a>
  </li>
  {% endfor %}
</ul>

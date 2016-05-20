---
title: "18F IRL Spring 2016"
year: 2016
season: spring
permalink: /irl/spring-2016/
---
## Day 1: May 4, 2016
{% for session in site.irl | sort:"date" %}{% if session['day'] == 1 %}
  <h3>{{ session['title'] }}, {{ session['date'] | date: "%I:%M %p"}}</h3>
  {{ session['content'] | markdownify }}
{% endif %}{% endfor %}

## Day 2: May 5, 2016
{% for session in site.irl | sort:"date" %}{% if session['day'] == 2 %}
  <h3>{{ session['title'] }}, {{ session['date'] | date: "%I:%M %p"}}</h3>
  {{ session['content'] | markdownify }}
{% endif %}{% endfor %}

---
permalink: /feed.xml
skip_index: true
---
{% assign selected_posts = collections.posts | reverse | slice:0, 10 %}
<feed xmlns="http://www.w3.org/2005/Atom">
<link href="{{ site.host }}/feed.xml" rel="self" type="application/atom+xml"/>
<link href="{{ site.host }}/" rel="alternate" type="text/html"/>
<updated>{{ selected_posts[0].date | date_to_xmlschema }}</updated>
<id>{{ site.host }}/feed.xml</id>
<title type="html">{{ site.title }}</title>
<subtitle>{{ site.description }}</subtitle>
{% for post in selected_posts %}
  <entry>
    <title type="html"><![CDATA[ {{ post.data.title | escape | strip_newlines }} ]]></title>
    <link href="{{ site.host }}{{ post.url }}" rel="alternate" type="text/html" title="{{ post.data.title | escape | strip_newlines }}"/>
    <published>{{ post.date | date_to_xmlschema }}</published>
    <updated>{{ post.date | date_to_xmlschema }}</updated>
    <id>{{ site.host }}{{ post.url }}</id>
    <content type="html" xml:base="{{ site.host }}{{ post.url }}">
      <![CDATA[ {{- post.content | strip_newlines -}} ]]>
    </content>
    {% for author in post.data.authors -%}
    <author>
      <name>{{ author }}</name>
    </author>
    {% endfor -%}
    {% for term in post.data.tags -%}
    <category term="{{ term }}"/>
    {% endfor -%}
    <summary type="html">
      <![CDATA[ {{- post.data.excerpt | strip_newlines -}} ]]>
    </summary>
    {% if post.data.image -%}
    <media:thumbnail xmlns:media="http://search.yahoo.com/mrss/" url="{{ site.host }}{{ post.data.image }}"/>
    <media:content xmlns:media="http://search.yahoo.com/mrss/" medium="image" url="{{ site.host }}{{ post.data.image }}"/>
    {% endif %}
  </entry>
{% endfor %}
</feed>
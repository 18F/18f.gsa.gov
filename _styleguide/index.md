---
title: 18F site styleguide
permalink: /styleguide/
nav_items:
 - text: Atoms
   permalink: /styleguide/#atoms
   collections: ['styleguide']
   in_subnav: true
   children:
     - text: Buttons
       permalink: /styleguide/#buttons
       collections: ['styleguide']
       in_subnav: true
       children:
     - text: Embeds
       permalink: /styleguide/#embeds
       collections: ['styleguide']
       in_subnav: true
       children:
 - text: Molecules
   permalink: /styleguide/#molecules
   collections: ['styleguide']
   in_subnav: true
 - text: Organisms
   permalink: /styleguide/#organisms
   collections: ['styleguide']
   in_subnav: true
   children:
     - text: Hero banner – centered text
       permalink: /styleguide/#hero-banner-centered-text
       collections: ['styleguide']
       in_subnav: true
     - text: Card
       permalink: /styleguide/#card
       collections: ['styleguide']
       in_subnav: true
     - text: Posts
       permalink: /styleguide/#posts
       collections: ['styleguide']
       in_subnav: true

---

{% assign dead_end_link = page.permalink | prepend: site.baseurl %}


## Atoms

### Buttons
<section class="usa-grid">
<img src="{{ site.baseurl }}/assets/img/styleguide/button-anatomy.png" class="usa-width-one-third" alt="Image of the dimensions and padding of a button on the 18F site" />
</section>

#### Button style light – .usa-button

{% capture codeblock %}
<section class="usa-grid">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=codeblock
   lang="html"
%}

#### Button style on dark – .usa-button-secondary

{% capture codeblock %}
<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=codeblock
   lang="html"
%}

### Embed

Here is an example embed and how

{{ "https://www.youtube-nocookie.com/embed/8wcFK2jYlWw" | embed: "Acquisition Gateway Homepage Redesign" }}

```liquid
{% raw %}{{ "https://www.youtube-nocookie.com/embed/8wcFK2jYlWw" | embed: "Acquisition Gateway Homepage Redesign" }}{% endraw %}
```

## Molecules

## Organisms

### Hero banner – centered text
{% capture hero_banner %}
<section class="background-dark usa-section">
  <div class="usa-grid content-focus align-center">
    <h2>We work with federal agencies to approach technology projects in new ways</h2>
    <a href="{{ dead_end_link }}"><button class="usa-button usa-button-big usa-button-secondary">Our work</button></a>
  </div>
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=hero_banner
   lang="html"
%}

### Hero banner – left aligned with image
{% capture hero_banner_image %}
<section class="background-dark usa-section">
  <div class="usa-grid content-focus align-center">
    <h2>We work with federal agencies to approach technology projects in new ways</h2>
    <a href="{{ dead_end_link }}"><button class="usa-button usa-button-big usa-button-secondary">Our work</button></a>

    {% include feature-image.html
               image='/assets/img/page-feature/hire-us.jpg' %}
  </div>
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=hero_banner_image
   lang="html"
%}


### Card

{% capture card %}
<section class="usa-grid usa-section">
    {% include card-project.html
       project='fec-gov'
    %}
    {% include card-project.html
       project='hhs-states'
    %}

    {% include card-project.html
       project='doi-every-kid-in-a-park'
    %}
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=card
   lang="html"
%}


### Posts

{% capture styleguide_post %}
  <section class="usa-grid usa-section posts_feature">
  {% include post.html
    date='January 6, 2017'
    title='Dummy title'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
  </section>
{% endcapture %}


{% include details-code.html
   text="See code"
   content=styleguide_post
   lang="html"
%}


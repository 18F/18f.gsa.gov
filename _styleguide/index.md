---
title: 18F site styleguide
permalink: /styleguide/
nav_items:
 - text: Atoms
   permalink: /styleguide/#atoms/
   collections: ['styleguide']
   in_subnav: true
   children:
     - text: Buttons
       permalink: /styleguide/#buttons
       collections: ['styleguide']
       in_subnav: true
       children:
 - text: Molecules
   permalink: /styleguide/#molecules/
   collections: ['styleguide']
   in_subnav: true
 - text: Organisms
   permalink: /styleguide/#organisms/
   collections: ['styleguide']
   in_subnav: true
   children:
     - text: Hero banner – centered text
       permalink: /styleguide/#hero-banner-centered-text
       collections: ['styleguide']
       in_subnav: true
       children:


---

{% assign dead_end_link = page.permalink | prepend: site.baseurl %}


## Atoms

### Buttons

<img src="{{ site.baseurl }}/assets/img/styleguide/button-anatomy.png" class="usa-width-one-third" />

#### Button style light – .usa-button
<section class="usa-grid">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>

#### Button style on dark – .usa-button-secondary
<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>

## Molecules

## Organisms

### Hero banner – centered text

<section class="background-dark usa-section">
  <div class="usa-grid content-focus align-center">
    <h2>We work with federal agencies to approach technology projects in new ways</h2>
    <a href="{{ dead_end_link }}"><button class="usa-button usa-button-big usa-button-secondary">Our work</button></a>
  </div>
</section>


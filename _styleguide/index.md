---
title: 18F site UI styleguide
permalink: /styleguide/
nav_items:
 - text: Typography
   permalink: /styleguide/#typography
   in_drawer: true
 - text: Color
   permalink: /styleguide/#color
   in_drawer: true
 - text: Buttons
   permalink: /styleguide/#buttons
   in_drawer: true
 - text: Embeds
   permalink: /styleguide/#embeds
   in_drawer: true
---

{% assign dead_end_link = page.permalink | prepend: site.baseurl %}

## Typography
<section class="usa-grid-full">
    <div class="usa-width-two-thirds">
        <span class="intro-font">$font-sans: Helvetica Neue (Helvetica, Arial, sans serif)</span>
        <h5> $color-base (#000000) </h5>
    </div>
    <div class="usa-width-one-half">
        <h1>h1 3.6 rem, 36px*</h1>
        <h2> h2 3.2 / 4.16rem (32/41.6px)</h2>
        <h3> h3 2.4 / 1.3rem (24/31.2px)</h3>
        <h4> h4 2rem, 20px </h4>
        <h5> h5 1.4rem, 14px </h5>
        <p> p 1.8 / 1.5 rem (18 / 27px) </p>
    </div>
    <div class="usa-width-one-half stylguide-links">
          <a class="styleguide-links"> Link </a>
          <a class="styleguide-links visited"> Visited </a>
        {% capture codeblock %}
          <a class="link-arrow-right styleguide-links">
            Link
            {% include svg/icons/arrow-right.svg %}
          </a>
          <a class="link-arrow-left styleguide-links">
            {% include svg/icons/arrow-left.svg %}
            Back
          </a>
          <a class="styleguide-links link-arrow-right visited">
            Visited
            {% include svg/icons/arrow-right.svg %}
          </a>
        {% endcapture %}

        {% include details-code.html
           text="See code"
           content=codeblock
           lang="html"
        %}
    </div>
</section>
## Color

<section class="usa-grid-full">
  <div class="usa-width-one-half">
      <div class="color-box-group">
        <div class="color-box cb-dark"></div>
        $color-dark | #1c304a
      </div>
      <div class="color-box-group">
        <div class="color-box cb-medium"></div>
        $color-medium | #046b99
      </div>
      <div class="color-box-group">
        <div class="color-box cb-medium-hover"></div>
        $color-medium-hover | #034c6d
      </div>
      <div class="color-box-group">
        <div class="color-box cb-bright"></div>
        $color-bright | #00cfff
      </div> 
  </div> 
  <div class="usa-width-one-half">
      <div class="color-box-group">
        <div class="color-box cb-bright-hover"></div>
        $color-bright-hover | #00a7ce
      </div>
      <div class="color-box-group">
        <div class="color-box cb-light"></div>
        $color-light | #b3efff
      </div>
      <div class="color-box-group">
        <div class="color-box cb-gray"></div>
        $color-gray | #5b616b
      </div>
      <div class="color-box-group">
        <div class="color-box cb-gray-lightest"></div>
        $color-gray-lightest | #f1f1f1
      </div>
    </div>
</section>

## Font Family

<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <p>Helvetica Neue, Regular</p>
    <span class="text-huge"> Aa </span>
    <p class="text-tiny">A B C D E F G H I J K L M N O P Q R S T U V W Z Y Z</p>
    <p class="text-tiny">a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
    <p class="text-tiny">0 1 2 3 4 5 6 7 8 9</p>
  </div>
  <div class="usa-width-one-half p-bold">
    <p>Helvetica Neue, Bold</p>
    <span class="text-huge"> Aa </span>
    <p class="text-tiny">A B C D E F G H I J K L M N O P Q R S T U V W Z Y Z</p>
    <p class="text-tiny">a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
    <p class="text-tiny">0 1 2 3 4 5 6 7 8 9</p>
  </div>
</section>

## Backgrounds 


## Buttons
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

## Embeds

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


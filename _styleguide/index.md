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
 - text: Cards
   permalink: /styleguide/#cards
   in_drawer: true
 - text: Posts
   permalink: /styleguide/#posts
   in_drawer: true
---

{% assign dead_end_link = page.permalink | prepend: site.baseurl %}

## Typography

<section class="usa-grid-full">
  <div class="usa-width-two-thirds top-typography">
      <span class="intro-font">$font-sans: Helvetica Neue (Helvetica, Arial, sans serif)</span>
      <h5>$color-base (#000000) </h5>
  </div>
  <div class="usa-width-one-half">
{% capture codeblock %}{% raw %}
<h1>h1 – 3.8rem, 38px</h1>
<h2>h2 – 3.4rem 34px</h2>
<h3>h3 – 2.3rem 23px</h3>
<h4>h4 – 2.1rem, 21px </h4>
<h5>h5 – 1.4rem, 14px </h5>
<p>p – 1.8rem, 18px) </p>
{% endraw %}{% endcapture %}
{% include details-code.html
   title='typography'
   text="Code"
   content=codeblock
   lang="html"
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L2-L15'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L2-L14'
%}
  </div>
  <div class="usa-width-one-half">
{% capture codeblock %}{% raw %}
<div class="styleguide-links-section">
  <a> Link </a>
  <a class="visited"> Visited </a>
</div>
<div class="styleguide-links-section">
  <a class="link-arrow-right">
    Link
    {% include svg/icons/arrow-right.svg %}
  </a>
  <a class="link-arrow-left">
    {% include svg/icons/arrow-left.svg %}
    Back
  </a>
  <a class="link-arrow-right visited">
    Visited
    {% include svg/icons/arrow-right.svg %}
  </a>
</div>
{% endraw %}{% endcapture %}
{% include details-code.html
   title='links'
   text="Code"
   content=codeblock
   lang="html"
%}
  </div>
</section>
---
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

{% include details-code.html
   title='colors'
   description='We are using variables defined in the USWDS and our own personal overrides.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L25-L35'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L24-L74'
%}
---
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

{% include details-code.html
   title='fonts'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L20-L21'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L17-L18'
%}
---
## Backgrounds
<section class="usa-grid-full">
  <div class="usa-width-one-third">
    <div class="background-box banner-footer-box">
      <div class="p-bold">
        <p>#F1F1F1</p>
        <p>Banner & Footer</p>
      </div>
      <p>Font: #000000</p>
    </div>
  </div>
  <div class="usa-width-one-third">
    <div class="background-box navigation-box">
      <div class="p-bold">
        <p>#FFFFFF</p>
        <p>Navigation, Fields, Page</p>
      </div>
      <p>Font: #000000</p>
    </div>
  </div>
  <div class="usa-width-one-third">
    <div class="background-box hero-header-box">
      <div class="p-bold">
        <p>#1C304A</p>
        <p>Hero, Header</p>
      </div>
      <p class="highlight">Highlight:#00CFFF</p>
      <p>Font: #FFFFFF</p>
    </div>
  </div>
</section>
---
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
   title='buttons-light'
   text="Code"
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
   title='buttons-dark'
   text="Code"
   content=codeblock
   lang="html"
%}
---
## Embeds

Here is an example embed and how to use it

{% capture embed_codeblock %}{% raw %}{% oembed https://www.youtube.com/watch?v=8wcFK2jYlWw %}{% endraw %}{% endcapture %}


{% include details-code.html
   title='embeds'
   text="Code"
   content=embed_codeblock
   lang="liquid"
%}

<!-- --- -->
<!-- ### Hero banner – centered text -->
{% capture hero_banner %}
<section class="background-dark usa-section">
  <div class="usa-grid content-focus align-center">
    <h2>We work with federal agencies to approach technology projects in new ways</h2>
    <a href="{{ dead_end_link }}"><button class="usa-button usa-button-big usa-button-secondary">Our work</button></a>
  </div>
</section>
{% endcapture %}

<!-- {% include details-code.html
   text="Code"
   content=hero_banner
   lang="html"
%} -->

<!-- ### Hero banner – left aligned with image -->
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

<!-- {% include details-code.html
   text="Code"
   content=hero_banner_image
   lang="html"
%} -->

---
## Cards

{% capture card %}{% raw %}
<section class="usa-grid-full usa-section">
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
{% endraw %}{% endcapture %}

{% include details-code.html
   title='cards'
   text="Code"
   content=card
   lang="html"
%}

---
## Posts

{% capture styleguide_post %}{% raw %}
<section class="usa-grid-full usa-section posts_feature">
  {% include post.html
    date='January 6, 2017'
    title='Dummy title'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
  {% include post.html
    date='January 7, 2017'
    title='Dummy title 2'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
  {% include post.html
    date='January 8, 2017'
    title='Dummy title 3'
    excerpt='This is an example of a post with plenty of example text to give it length'
    url=dead_end_link
  %}
</section>
{% endraw %}{% endcapture %}


{% include details-code.html
   text="Code"
   title='posts'
   content=styleguide_post
   lang="html"
%}


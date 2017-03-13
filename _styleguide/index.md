---
title: 18F site UI styleguide
permalink: /styleguide/
nav_items:
 - text: Typography
   permalink: /styleguide/#typography
   in_drawer: true
 - text: Colors
   permalink: /styleguide/#colors
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
 - text: Post previews
   permalink: /styleguide/#post-previews
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
   content=codeblock
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L2-L15'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L2-L14'
%}
  </div>
  <div class="usa-width-one-half">
{% capture codeblock %}{% raw %}
<div class="styleguide-links-section">
  <a>Link</a>
  <a class="visited">Visited</a>
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
   description='To use a link, specify the text, direction that the arrow is pointing, and reference the SVG file for the corresponding arrow.'
   title='links'
   content=codeblock
%}
  </div>
</section>
---
## Colors

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
   description='We are overriding the font used by the US Web Design Standards.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L20-L21'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L17-L18'
%}
---
## Backgrounds
{% capture styleguide_background %}{% raw %}
<section class="usa-grid-full">
  <div class="usa-width-one-fourth">
    <div class="background-gray styleguide-bg-box">
      <div class="p-bold">
        <p>#F1F1F1</p>
        <p>Banner & Footer</p>
      </div>
      <p>Font: #000000</p>
    </div>
  </div>
  <div class="usa-width-one-fourth">
    <div class="background-white styleguide-bg-box">
      <div class="p-bold">
        <p>#FFFFFF</p>
        <p>Navigation, Fields, Page</p>
      </div>
      <p>Font: #000000</p>
    </div>
  </div>
  <div class="usa-width-one-fourth">
    <div class="background-medium styleguide-bg-box">
      <div class="p-bold">
        <p>#FFFFFF</p>
        <p>Navigation, Fields, Page</p>
      </div>
      <p>Font: #000000</p>
    </div>
  </div>
  <div class="usa-width-one-fourth">
    <div class="background-dark styleguide-bg-box">
      <div class="p-bold">
        <p>#1C304A</p>
        <p>Hero, Header</p>
      </div>
      <p class="section-heading">Highlight: #00CFFF</p>
      <p>Font: #FFFFFF</p>
    </div>
  </div>
</section>
{% endraw %}{% endcapture %}
{% include details-code.html
   title='backgrounds'
   content=styleguide_background
   lang='html'
   description="We are not overriding the US Web Design Standards background classes. Ours follow a similar pattern, but do not contain a `usa-` prefix."
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss#L121-L189'
%}
---
## Buttons

<section class="usa-grid">
  <img src='{{ site.baseurl }}/assets/img/styleguide/button-anatomy.png'
       class='usa-width-one-third'
       alt='Image of the dimensions and padding of a button on the 18F site' />
</section>


{% capture styleguide_buttons %}
<section class="usa-grid usa-section">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>

<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>
{% endcapture %}


{% include details-code.html
   title='buttons'
   description='We are overriding the styles for styles set by the US Web Design Standards.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/buttons.scss'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/elements/_buttons.scss'
   content=styleguide_buttons
%}

---
## Embeds

Here is an example embed and how to use it

{% capture embed_codeblock %}{% raw %}{% oembed https://www.youtube.com/watch?v=8wcFK2jYlWw %}{% endraw %}{% endcapture %}


{% include details-code.html
   title='embeds'
   content=embed_codeblock
   lang="html"
   description='We are using a Jekyll plugin called `jekyll_oembed`.'
   other_ref='https://github.com/18F/jekyll-oembed#usage'
%}

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
   description='To use cards, reference the file path slug in the _projects directory. Use another project as a template to fill in all of the necessary fields.'
   other_ref='https://github.com/18F/18f.gsa.gov/tree/master/_plugins'
   content=card
%}

---
## Post previews

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
   title='posts'
   description='Post previews are generated dynamically throughout the site. Each preview requires a few attribtues: `date`, `title`, `excerpt`, and `url`.'
   content=styleguide_post
%}


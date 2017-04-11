---
title: 18F UI style guide
subpage: Colors
permalink: /styleguide/colors/
---
### Palette
<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="color-box-group">
      <div class="color-box cb-black"></div>
      <strong>$color-black</strong> | #000000
    </div>
    <div class="color-box-group">
      <div class="color-box cb-dark"></div>
      <strong>$color-dark</strong> | #1c304a
    </div>
  </div>
</section>
<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="color-box-group">
      <div class="color-box cb-medium"></div>
      <strong>$color-medium</strong> | #046b99
    </div>
    <div class="color-box-group">
      <div class="color-box cb-bright"></div>
      <strong>$color-bright</strong> | #00cfff
    </div>
  </div>
  <div class="usa-width-one-half">
    <div class="color-box-group">
      <div class="color-box cb-medium-hover"></div>
      <strong>$color-medium-hover</strong> | #034c6d
    </div>
    <div class="color-box-group">
      <div class="color-box cb-bright-hover"></div>
      <strong>$color-bright-hover</strong> | #00a7ce
    </div>
  </div>
</section>

<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="color-box-group">
      <div class="color-box cb-light"></div>
      <strong>$color-light</strong> | #b3efff
    </div>
    <div class="color-box-group">
      <div class="color-box cb-gray"></div>
      <strong>$color-gray</strong> | #5b616b
    </div>
    <div class="color-box-group">
      <div class="color-box cb-gray-lightest"></div>
      <strong>$color-gray-lightest</strong> | #f1f1f1
    </div>
    <div class="color-box-group">
      <div class="color-box cb-inverse"></div>
      <strong>$color-inverse</strong> | #ffffff
    </div>
  </div>
</section>

{% capture colors_description %}
We are primarily using [18F Brand colors](https://pages.18f.gov/brand/color-palette/).

Site-specific colors, `$color-medium-hover` and `$color-bright-hover` were created as web-specific extensions of the 18F Brand.

U.S. Web Design standards colors, `$color-gray` and `$color-gray-lightest`, were pulled for utility use.
{% endcapture %}

{% include details-code.html
   title='colors'
   description=colors_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L25-L35'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L24-L74'
%}

---

### Backgrounds
{% capture styleguide_background %}{% raw %}
<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="background-dark styleguide-bg-box">
      <div class="p-bold">
        <p>$color-dark
          <br>Hero, Header</p>
      </div>
      <p class="section-heading">Highlight: $color-bright</p>
      <p>Text: $color-inverse</p>
    </div>
    <div class="background-medium styleguide-bg-box">
      <div class="p-bold">
        <p>$color-medium
          <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $color-inverse</p>
    </div>
  </div>
  <div class="usa-width-one-half">
    <div class="background-gray styleguide-bg-box">
      <div class="p-bold">
        <p>$color-gray-lightest
        <br>Banner & Footer</p>
      </div>
      <p>Text: $color-black</p>
    </div>
    <div class="background-white styleguide-bg-box">
      <div class="p-bold">
        <p>$color-inverse
        <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $color-black</p>
    </div>
  </div>
</section>
{% endraw %}{% endcapture %}

{% capture backgrounds_description %}
We are using the [18F Brand](https://pages.18f.gov/brand/color-palette/) color palette for our background colors.

Instead of overriding the SCSS classes and variables used by the U.S. Web Design Standards, we have created a parallel set of background color classes and variables.

CSS class | SCSS variable
--- | ---
`background-dark` | `$color-dark`
`background-medium` | `$color-medium`
`background-gray` | `$color-gray`
`background-white` | `$color-inverse`
{% endcapture %}
{% include details-code.html
   title='backgrounds'
   content=styleguide_background
   lang='html'
   description=backgrounds_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss#L121-L189'
%}

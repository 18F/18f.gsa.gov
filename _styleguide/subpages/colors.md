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
      <strong>$theme-color-base</strong> | #000000
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
      <strong>$theme-color-secondary-dark</strong> | #046b99
    </div>
    <div class="color-box-group">
      <div class="color-box cb-bright"></div>
      <strong>$theme-color-secondary</strong> | #00cfff
    </div>
  </div>
  <div class="usa-width-one-half">
    <div class="color-box-group">
      <div class="color-box cb-medium-hover"></div>
      <strong>$theme-color-secondary-darker</strong> | #034c6d
    </div>
    <div class="color-box-group">
      <div class="color-box cb-bright-darker"></div>
      <strong>$theme-color-secondary-darker</strong> | #00a7ce
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
      <strong>$theme-color-base-lightest</strong> | #f1f1f1
    </div>
  </div>
</section>

{% capture colors_description %}
We are primarily using [18F Brand colors](https://pages.18f.gov/brand/color-palette/).

Site-specific colors, `$theme-color-secondary-darker` and `$theme-color-secondary-darker` were created as web-specific extensions of the 18F Brand.

U.S. Web Design System colors, `$color-gray` and `$theme-color-base-lightest`, were pulled for utility use.
{% endcapture %}

{% include details-code.html
   title='colors'
   description=colors_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_core/variables.scss#L25-L35'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_libs/wds/stylesheets/core/_variables.scss#L24-L74'
%}

---

### Backgrounds
{% capture styleguide_background %}{% raw %}
<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="bg-primary-darker styleguide-bg-box">
      <div class="p-bold">
        <p>$color-dark
          <br>Hero, Header</p>
      </div>
      <p class="section-heading">Highlight: $theme-color-secondary</p>
      <p>Text: $color-inverse</p>
    </div>
    <div class="background-medium styleguide-bg-box">
      <div class="p-bold">
        <p>$theme-color-secondary-dark
          <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $color-inverse</p>
    </div>
  </div>
  <div class="usa-width-one-half">
    <div class="background-gray styleguide-bg-box">
      <div class="p-bold">
        <p>$theme-color-base-lightest
        <br>Banner & Footer</p>
      </div>
      <p>Text: $theme-color-base</p>
    </div>
    <div class="background-white styleguide-bg-box">
      <div class="p-bold">
        <p>$color-inverse
        <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $theme-color-base</p>
    </div>
  </div>
</section>
{% endraw %}{% endcapture %}

{% capture backgrounds_description %}
We are using the [18F Brand](https://pages.18f.gov/brand/color-palette/) color palette for our background colors.

Instead of overriding the SCSS classes and variables used by the U.S. Web Design System, we have created a parallel set of background color classes and variables.

CSS class | SCSS variable
--- | ---
{% endcapture %}
{% include details-code.html
   title='backgrounds'
   content=styleguide_background
   lang='html'
   description=backgrounds_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/main/_sass/_components/layout.scss#L121-L189'
%}

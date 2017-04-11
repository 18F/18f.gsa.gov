---
title: 18F UI style guide
subpage: Typography
permalink: /styleguide/typography/
---

### Font family
<section class="usa-grid-full">
  <section class="usa-grid-full">
    <div class="usa-width-two-thirds usa-section">
      <div class="box-base-wrapper">
        <span class="intro-font">$font-sans: Helvetica Neue (Helvetica, Arial, sans serif)</span>
        <div class="h5">$color-base: #000000</div>
      </div>
      <div class="box-rem-wrapper" style="">
        <div class="box-rem"></div><span>1rem = 10px</span>
      </div>
    </div>
  </section>
  <div class="usa-width-one-half">
    <p>Helvetica Neue, Regular</p>
    <div class="text-huge"> Aa </div>
    <p>A B C D E F G H I J K L M N O P Q R S T U V W Z Y Z</p>
    <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
    <p>0 1 2 3 4 5 6 7 8 9</p>
  </div>
  <div class="usa-width-one-half p-bold">
    <p>Helvetica Neue, Bold</p>
    <div class="text-huge"> Aa </div>
    <p>A B C D E F G H I J K L M N O P Q R S T U V W Z Y Z</p>
    <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
    <p>0 1 2 3 4 5 6 7 8 9</p>
  </div>
</section>

{% include details-code.html
   title='fonts'
   description='We are overriding the font used by the [U.S. Web Design Standards](https://standards.usa.gov/components/typography/) with the font used by the [18F Brand](https://pages.18f.gov/brand/typography/).'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L20-L21'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L17-L18'
%}

---

### Typesetting

{% capture codeblock %}{% raw %}
<h1>h1 – 3.8rem, 38px</h1>
<h2>h2 – 3.4rem, 34px</h2>
<h3>h3 – 2.3rem, 23px</h3>
<h4>h4 – 2.1rem, 21px</h4>
<h5>h5 – 1.4rem, 14px</h5>
<p>p – 1.8rem, 18px</p>
{% endraw %}{% endcapture %}

{% capture type_description %}
To use headers, either use the semantic element, or reference it with a dot-delimited class.

For example:

`<p class =".h1"></p>` would render the same as `<h1></h1>`.

For size reference:

Element | Font size (rem) | Font size (px)
--- | --- | ---
h1 | 3.8rem | 38px
h2 | 3.4rem | 34px
h3 | 2.3rem | 23px
h4 | 2.1rem | 21px
h5 | 1.4rem | 14px
p | 1.8rem | 18px

{% endcapture %}
{% include details-code.html
   title='typography'
   content=codeblock
   description=type_description
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L2-L15'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L2-L14'
%}

---

### Font weights

There are only two font weights used on 18f.gsa.gov.

{% capture codeblock %}{% raw %}
<p class="p-bold">Bold</p>
<p>Normal</p>
{% endraw %}{% endcapture %}

{% capture weight_description %}
Font weight is directly inherited from the U.S. Web Design Standards.

**Quick usage reference:**

SCSS variable | CSS class | Font weight
-- | -- | ---
**$font-bold** | **`p-bold`** | **700**
$font-normal | `p-normal` (only needs to be used to be used to override another class) | 400
{% endcapture %}
{% include details-code.html
   title='type-weight'
   content=codeblock
   description=weight_description
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L20-L21'
%}

---

### Links

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

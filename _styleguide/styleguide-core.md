---
title: 18F site styleguide core
permalink: /styleguide/core
---

{% assign dead_end_link = page.permalink | prepend: site.baseurl %}

### Typography

$font-sans: Helvetica Neue (Helvetica, Arial, sans serif)
##### $color-base (#000000)

# h1 3.6 rem, 36px*
## h2 3.2 / 4.16rem (32/41.6px)
### h3 2.4 / 1.3rem (24/31.2px)
#### h4 2rem, 20px
##### h5 1.4rem, 14px

p 1.8 / 1.5 rem (18 / 27px)

<section class="usa-grid">
	<a> Link </a> 
	<a> Visited </a>
</section>

{% capture codeblock %}
<section class="usa-grid">
	<a class="link-arrow-right">
		Link
		{% include svg/icons/arrow-right.svg %}
	</a>
	<a class="link-arrow-left">
		{% include svg/icons/arrow-left.svg %}
	 	Back
	</a>
</section>
{% endcapture %}

{% include details-code.html
   text="See code"
   content=codeblock
   lang="html"
%}
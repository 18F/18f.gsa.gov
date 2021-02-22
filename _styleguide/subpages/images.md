---
title: 18F UI style guide
subpage: Images
permalink: /styleguide/images/
image: /assets/img/page-feature/hire-us.jpg
image_alt: Example of hero image
image_figcaption: Example caption. This caption will be the same for all pages that have image_figcaption specified in their front matter.
---

Images are used heavily throughout the site, but using them isn't always straightforward. Below is some guidance on how we use images of various formats throughout the site.

---

### Image lists

This pattern associates text with an icon to break up text blocks improve user understanding.
{% capture icon_list_codeblock %}{% raw %}
<ul class="icon-list-wrapper">
  <li class="icon-list">
    <figure class="icon-list-image">{% include svg/icons/respect-icon.svg %}</figure>
    <div class="icon-list-text">
      <p class="p-bold">Respect for government workers</p>
      <p>Civil servants have tremendous knowledge about what it takes to achieve their agency’s mission. We help clear technical and governmental hurdles to better serve the public.</p>
    </div>
  </li>
  <li class="icon-list">
    <figure class="icon-list-image">{% include svg/icons/user-centered-icon.svg %}</figure>
    <div class="icon-list-text">
      <p class="p-bold">Human-centered design</p>
      <p>We listen to real users to understand their needs and build things that will be useful to them — without sacrificing technical or regulatory requirements.</p>
    </div>
  </li>
</ul>
{% endraw %}{% endcapture %}

{% include details-code.html
   title='icon-list-catalog'
   content=icon_list_codeblock
   lang="markdown"
   description='This component is not available as a Jekyll include. To use it, copy the code snippet above and update the icon, title, and body text accordingly.'
   scss_ref="https://github.com/18F/18f.gsa.gov/blob/main/_sass/_components/icon-list.scss"
%}

---

### Project page images

It really helps to have good pictures to help us highlight project work — but you might need a little more guidance about how to get pictures that will tell a story best. Here are some helpful tips:

**If possible:**

1. Image should relate to the project title, the department, or the process (in order of preference)
1. Show real users that benefit from this project
1. Show a screenshot from the project
1. Mix it up! Look at the current project list. Do you see too many of the same type of image (for example, mostly screenshots, mostly brainstorming sessions)

**Consider accessibility and try to avoid images that:**

* Are low-contrast
* Have wording on them

**Consider the audience (government employees and potential partners!) and try to avoid images with the following:**

* Sensitive subject material (for example, children when writing about Child Protective Services)
* Uninteresting subjects
* Super meta imagery (too much of a cognitive leap when relating to subject matter)

**Size:**

* Banner: Size 1300x866

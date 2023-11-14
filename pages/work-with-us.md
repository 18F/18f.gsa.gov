---
title: Work with us
permalink: /work-with-us/
lead: As federal employees, we share your dedication to serving the American&nbsp;public.
redirect_from: /how-we-work/
hide_footer_rule: true
---

{% capture intro %}
Because [87% of large government IT projects don't succeed](https://derisking-guide.18f.gov/), government’s approach to this work needs to change. We believe that projects have the best chance for success when agency leaders and staff themselves are closely involved in developing the solutions they need. We can help.
{% endcapture %}

{% capture ask-qs %}
## Ask the right questions, solve the right problems

We take the time and have the experience to understand the specific mission of your organization. In an 18F engagement, we work together to understand what problem you need to solve.

18F has [deep expertise in _talking to people_](https://18f.gov/guides). When you talk to users and staff, you get to the heart of the problem by learning how people use your services and technology. That's how we uncover insights and find new solutions.
{% endcapture %}

{% capture mission-path %}
## Choose the path that’s best for your mission and your users

We don’t offer one-size-fits-all solutions. Instead, we work with you to design the right path for your organization and ensure that you feel confident about each step. We believe in “demos not memos” and everything we do is intended to be a step toward working software.

Some software projects are the right size and shape for 18F to build with you; others will require you to hire an outside vendor. We can help you to hire a vendor that can respond to your changing needs and deliver working software to you on a regular basis.
{% endcapture %}

{% capture tech-adapt %}
## Tech that adapts and grows with your needs

18F engagements are designed to end. Since we're part of the federal government, we don't have a vested interest in extending engagements unnecessarily or selling you things you don't need.

Instead, we involve your team in creating solutions and ensure they have everything they need to maintain and improve systems long after we're gone.
{% endcapture %}


<section class="usa-section usa-section--dark bg-primary-darker section-padding-6">
<div class="grid-container">
  <div class="grid-row">
    <div class="grid-col">
      <h2>Transform the way you work</h2>
      <div class="font-sans-lg">
        {{ intro | markdownify}}
      </div>
    </div>
  </div>
</div>
</section>

<section class="usa-section bg-base-lightest">
  <div class="grid-container">
    <div class="grid-row grid-gap">
      <div class="tablet-lg:grid-col-7">
        {{ ask-qs | markdownify }}
      </div>
      <div class="tablet-lg:grid-col-5">
        <img src="{{ site.baseurl }}/assets/img/work-with-us/work-with-us-illo-1.svg"
        alt=""
        >
      </div>
    </div>
    <h3 class="text-normal"> Feel empowered to continue with our guides</h3>
    <p class="font-sans-lg"> We want agencies to be able to do the work themselves. Here are some free guides that help. </p>
    <div class="grid-row grid-gap-md">
      <div class="grid-col-12 tablet:grid-col-4 margin-top-3 tablet:margin-top-0">
      {% include card-with-image.html
         card_color="dark"
         text_content="Accessibility"
         link_url="https://accessibility.18f.gov/"
         image_path="/assets/img/guides/accessibility-lightest.svg"
      %}
      </div>

      <div class="grid-col-12 tablet:grid-col-4 margin-top-3 tablet:margin-top-0">
      {% include card-with-image.html
         card_color="dark"
         text_content="Agile"
         link_url="https://agile.18f.gov/"
         image_path="/assets/img/guides/agile-lightest.svg"
      %}
      </div>

      <div class="grid-col-12 tablet:grid-col-4 margin-top-3 tablet:margin-top-0">
      {% include card-with-image.html
         card_color="dark"
         image_path="/assets/img/guides/content-lightest.svg"
         link_url="https://content-guide.18f.gov/"
         text_content="Content"
      %}
      </div>
    </div>
   <a href="{{ site.baseurl }}/guides/" class="usa-button usa-button--outline margin-top-3">
     Browse our guides
   </a>
  </div>
</section>

<section class="usa-section">
  <div class="grid-container">
    <div class="grid-row">
      <div class="tablet-lg:grid-col-7">
         {{ mission-path | markdownify }}
      </div>
      <div class="tablet-lg:grid-col-5">
        <img src="{{ site.baseurl }}/assets/img/work-with-us/work-with-us-illo-2.svg"
        alt=""
        >
      </div>
    </div>
    <h3 class="text-normal"> Feel empowered to continue with our guides</h3>
    <p class="font-sans-lg"> We want agencies to be able to do the work themselves. Here are some free guides that help. </p>
    <div class="grid-row grid-gap-md">
      <div class="grid-col-12 tablet:grid-col-6 margin-top-3 tablet:margin-top-0">
      {% include card-with-image.html
         card_color="dark"
         image_path="/assets/img/guides/state-guide-lightest.svg"
         link_url="https://derisking-guide.18f.gov/state-field-guide/"
         text_content="State Software Budgeting Handbook"
      %}
      </div>

      <div class="grid-col-12 tablet:grid-col-6 margin-top-3 tablet:margin-top-0">
      {% include card-with-image.html
         card_color="dark"
         image_path="/assets/img/guides/federal-guide-lightest.svg"
         link_url="https://derisking-guide.18f.gov/federal-field-guide/"
         text_content="Federal Field Guide"
      %}
      </div>
    </div> <a href="{{ site.baseurl }}/guides/" class="usa-button usa-button--outline margin-top-3">
     Browse our guides
   </a>
  </div>
</section>

<section class="usa-section bg-base-lightest">
  <div class="grid-container">
    <div class="grid-row">
      <div class="tablet-lg:grid-col-7">
         {{ tech-adapt | markdownify }}
      </div>
      <div class="tablet-lg:grid-col-5">
        <img src="{{ site.baseurl }}/assets/img/work-with-us/work-with-us-illo-3.svg"
        alt=""
        >
      </div>
    </div>
    <h3 class="text-normal">Read related case studies</h3>
    <p class="font-sans-lg">Read short project summaries demonstrating how we’ve helped some of the largest federal agencies.</p>
    <div class="grid-row grid-gap-md">
    {% assign projects = 'fec-gov, treasury-data-act' | split: ", " %}
    {% for project in projects %}
      {% assign project_details = site | find_collection: 'services_projects' | where: 'slug', project | first %}
      {% assign project_agency = site.data.agencies | where: "name", project_details.agency | first %}
      {% assign project_link = site.baseurl | append: project_details.permalink %}
      <div class="grid-col-12 tablet:grid-col-6 margin-top-3 tablet:margin-top-0">
        {% include card-with-image.html
           image_path=project_agency.logo
           image_alt_text=project_agency.name
           image_size="md"
           link_url= project_link
           text_content=project_details.mini_excerpt
        %}
      </div>
    {% endfor %}
    </div>
   <a href="{{ site.baseurl }}/our-work/" class="usa-button usa-button--outline margin-top-3">
     Read our case studies
   </a>
  </div>
</section>

---
layout: post
title:  "Do Not Render the Result"
categories: jekyll update
---
Sometimes posts will contain examples of Liquid code, like this from the [18F blog post about Jekyll and webhooks](https://18f.gsa.gov/2014/11/17/taking-control-of-our-website-with-jekyll-and-webhooks/):

```html
<p class="authors">
  by {% raw %}{% author chrisc %}{% endraw %}, {%raw %}{% author mhz %}{% endraw %}, and {% raw %}{% author nick %}{% endraw %}
</p>
```

If we render the `pages.json` corpus, the Liquid tags will generate text that is not properly JSON-escaped, rendering the corpus as invalid JSON.

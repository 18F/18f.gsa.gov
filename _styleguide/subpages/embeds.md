---
title: 18F site UI style guide
subpage: Embeds
permalink: /styleguide/embeds/
---

There are plenty of instances where we want to be able to embed content from other web pages. Where there are several ways to do this successfully, we recommend using a Jekyll filter, `oembed`, to handle embeddable content in a consistent way.

{% capture embed_codeblock %}{% raw %}{% oembed https://www.youtube.com/watch?v=8wcFK2jYlWw %}{% endraw %}{% endcapture %}


{% include details-code.html
   title='embeds'
   content=embed_codeblock
   lang="html"
   description='We are using a Jekyll plugin called `jekyll_oembed`. The URL string should be address of the content, not a URL provided to embed content. If content is private, it might be necessary to directly add HTML in this way as the service will reject any requests by`jekyll_oembed`.'
   other_ref='https://github.com/18F/jekyll-oembed#usage'
%}

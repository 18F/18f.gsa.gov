---
title: 18F site UI style guide
subpage: Embeds
permalink: /styleguide/embeds
---

Here is an example embed and how to use it

{% capture embed_codeblock %}{% raw %}{% oembed https://www.youtube.com/watch?v=8wcFK2jYlWw %}{% endraw %}{% endcapture %}


{% include details-code.html
   title='embeds'
   content=embed_codeblock
   lang="html"
   description='We are using a Jekyll plugin called `jekyll_oembed`.'
   other_ref='https://github.com/18F/jekyll-oembed#usage'
%}

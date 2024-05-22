#Plugins!

The 18F site uses a variety of custom plugins to modify how the site is rendered.

* [Filters](#filters)
  * [staff_photo](#staff_photo)
  * [staff_link](#staff_link)
  * [embed](#embed)
* [Markdown rendering](#markdown-rendering)
  * [markdown.rb](markdown.rb)
  * [redcarpet.rb](redcarpet.rb)

## Filters

### staff_photo
**Accepts the author's name as the first argument. Lives in [team.rb](team.rb)**

Example usage:

```liquid
{{ 'brian' | staff_photo }}
```

Yields:

```html
<img class="img-circle team-img bio-clip" src="/assets/img/team/brian.jpg" alt="18F team member Brian Hedberg">
```

### staff_link
**Will look for an entry in the authors data file named "boone" and return a link labeled Greg Boone and linked to his author page. Lives in [author.rb](author.rb)**


### embed
**Creates an iframe with the specified link. Lives in [embed.rb](embed.rb)**

*This is being deprecated* It still works, but the preferable usage is [here](https://github.com/18F/jekyll-oembed#usage), for the `jekyll_oembed` gem.

Example usage:

```liquid
  {{ "https://youtube-nocookie.com/blahblahblah/" | embed: "some title" }}
```

Returns:

```<div class='embed-container'>
  <iframe src='https://youtube-nocookie.com/blahblahblah/'
          title='some title'
          width='560'
          height='315'
          frameborder='0'
          allowfullscreen></iframe>
</div>```

#### match_posts
**Finds posts that match a pages' property. If the property is not specified, it defaults to `tags`.**

Example:
```
{{ page | match_posts }}
```

Example matching authors
```
{{ page | match_posts: 'authors' }}
```

Will look for all the posts on the entire site and return a list of posts that have any properties
that matches the list defined in a given project's frontmatter

### hash_link
**Returns a hashed version of a given link. Lives in [utility.md](utility.md).**

Example:
```bash
{{ 'how-we-work' | has_link }}
> #how-we-work
```


### matches_url
**Determines if the current page url (`page_url`) exactly matches a given `url`. Lives in [utility.md](utility.md).**

Example:
```bash
{{ '/contact/partnership-playbook/' | matches_url: '/contact/' }}
> nil

{{ '/contact/partnership-playbook/' | matches_url: '/contact/partnership-playbook/' }}
> true
```

### liquify
** A liquid parser that will take raw content as an argument and return a liquid parsed version of that content.**

Example:
```bash
{% capture raw_content %}
{% raw %}
{{ 'how-we-work' | has_link }}
{% endraw %}
{% endcapture %}

{{ raw_content | liquify }}
> '#how-we-work'
```


### debug
**Debugging tool to pull up a erb shell at a given point in the liquid markup.**

Example:
```bash
{{ variable | debug }}

```

#Plugins!

The 18F site uses a variety of custom plugins to modify how the site is rendered.

* [Custom tags](#custom-tags)
  * [authored_posts](#authored_posts)
* [Filters](#filters)
  * [team_photo](#team_photo)
  * [lookup](#lookup)
  * [embed](#embed)
* [Markdown rendering](#markdown-rendering)
  * [markdown.rb](markdown.rb)
  * [redcarpet.rb](redcarpet.rb)

### Custom tags

#### authored_posts: This tag will return a list of authors based on a pages' list of authors, as specified in the frontmatter.

This tag accepts an option, `heading` that sets a heading tag above the list of authors. If there is no heading tag specified, the tag defaults to an h2 tag.

Usage:

```liquid
{% authored_posts heading=h2 %}
```

### Filters

#### team_photo: accepts the author's name as the first argument. Lives in [team.rb](team.rb)

Example usage:

```liquid
{{ 'brian' | team_photo }}
```

Yields:

```html
<img class="img-circle team-img bio-clip" src="/assets/img/team/brian.jpg" alt="18F team member Brian Hedberg">
```

#### lookup: that takes an author slug as `input` and extracts from the dataset in the first arg the value of the key in the second arg for `input`. Lives in [author.rb](author.rb)

Takes two arguments, `input` and `args`

```ruby
lookup(input, args)
```

Example usage:

```liquid
  {{ "boone" | lookup:"authors, full_name" }}
```

#### team_link: will look for an entry in the authors data file named "boone" and return a link labeled Greg Boone and linked to his author page. Lives in [author.rb](author.rb)


#### embed: Creates an iframe with the specified link. Lives in [embed.rb](embed.rb)

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

#### match_posts: finds posts that match a pages' property. If the property is not specified, it defaults to `tags`

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

#### hash_link: returns a hashed version of a given link. Lives in [utility.md](utility.md).

Example:
```bash
{{ 'how-we-work' | has_link }}
> #how-we-work
```

#### dasherize: returns a dash-delimited version of the same string. Lives in [utility.md](utility.md).

Example:
```bash
{{ 'how we work' | dasherize }}
> how we work

{{ 'how we work' | dasherize | hash_link }}
> #how we work
```

#### matches_url: determines if the current page url (`page_url`) exactly matches a given `url`. Lives in [utility.md](utility.md).

Example:
```bash
{{ '/hire/partnership-playbook/' | matches_url: '/hire/' }}
> nil

{{ '/hire/partnership-playbook/' | matches_url: '/hire/partnership-playbook/' }}
> true
```

#### matches_url_parent: determines if the current page url is a path decendent of a given url. Lives in [utility.md](utility.md).

Accepts two arguments, `page`, the current page that is being evaluated, and `item`, the navigation item that is being checked (from `navigation.yml`). If a collection is specified in the navigation item, it will first check if the item collection and page collection match.

#### find_page: looks at the list of navigation fields in [navigation.yml](navigation.yml) and find the object that corresponds with a given url. Lives in [utility.md](utility.md).

It takes two arguments, `page_url` and `nav_items`, where `nav_items` is either the entire navigation.yml data file, or a subset of it.

Returns a nested set of navigation originating at the object corresponding to the defined `page_url`

Example:
```bash
{{ '/how-we-work/' | find_page: nav_items }}
> {
  text: How we work
  href: pages/how-we-work.md
  permalink: /how-we-work/
  in_menu: true
  in_drawer: true
  in_footer: false
  children: nil
}
```


#### check_type: debugging tool to pull up a erb shell at a given point in the liquid markup

Example:
```bash
{{ variable | check_type }}

```

### Markdown rendering

#### [markdown.rb](markdown.rb)

This file allows us to use markdown syntax highlighting within a Markdown Block.

Example usage:

```markdown
```markdown
  ### Example header
```
```

#### [redcarpet.rb](redcarpet.rb)

Our primary markdown rendering engine is redcarpet. This file merges the redcarpet extensions as specified in the `_config.yml` file on the root of the site directory with overrides to different block level markdown renderings.

For example, we have specified a new version of how to render headers. This allows us to take headings

```markdown
  ### Some example header
```

Automatically returns the following, via the `header(title, level)` method:

```html
  <h3 id="some-example-header">Some example header</h3>
```

And it is smart, so that duplicate headers will be given separate IDs, for accessibility purposes.


```markdown
  ### Same header
  ### Same header
```

Returns:

```html
  <h3 id="same-header">Same header</h3>
  <h3 id="same-header_1">Same header</h3>
```

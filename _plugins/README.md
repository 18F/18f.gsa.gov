#Plugins!

The 18F site uses a variety of custom plugins to modify how the site is rendered.

* [Filters](#filters)
  * [team_photo](#team_photo)
  * [lookup](#lookup)
  * [embed](#embed)
* [Markdown rendering](#markdown-rendering)
  * [markdown.rb](markdown.rb)
  * [redcarpet.rb](redcarpet.rb)
* [Classes and Modules](#classes-and-modules)
  * [AuthorData](#author-data)

## Filters

### team_photo
**Accepts the author's name as the first argument. Lives in [team.rb](team.rb)**

Example usage:

```liquid
{{ 'brian' | team_photo }}
```

Yields:

```html
<img class="img-circle team-img bio-clip" src="/assets/img/team/brian.jpg" alt="18F team member Brian Hedberg">
```

### lookup
**That takes an author slug as `input` and extracts from the dataset in the first arg the value of the key in the second arg for `input`. Lives in [author.rb](author.rb)**

Takes two arguments, `input` and `args`

```ruby
lookup(input, args)
```

Example usage:

```liquid
  {{ "boone" | lookup:"authors, full_name" }}
```

### team_link
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

## Markdown rendering

### [markdown.rb](markdown.rb)

This file allows us to use markdown syntax highlighting within a Markdown Block.

Example usage:

<code>
```markdown
  ### Example header
```
</code>


## Classes and Modules

### SiteData

The site data modules contains a single class, `AuthorData` and can be found in [author_data.rb](author_data.rb)

### AuthorData

Located in [author_data.rb](author_data.rb), `AuthorData` can be referenced within any of the plugins as `SiteData::AuthorData`.

It is used to access data pertaining to certain authors. It is _sometimes_ preferable to referencing authors data via Jekyll Collections because it contains _all_ the author data, not just the data of the authors that have made blog posts.

AuthorData has a few methods, `update`, `fetch`, `exists?`, `all_authors`, `published_authors`, and `unpublished_authors`.

#### `update`
Used to update an author's file. If I wanted to update the file `brian.md` to `published: true`, for instance, I could do as follows:

```ruby
author_data = SiteData::AuthorData.new
author_data.update('brian.md', 'published', true)
```

#### `fetch`
Can be used to find an attribute associated with an author. If I wanted to confirm that the `published` attribute was changed, I could do as follows:

```ruby
author_data.fetch('brian', 'published')
>> true
```

#### `exists?`
Returns a Boolean and can be used to verify that an author has a file to update or fetch:

    def exists?(name)
      File.exist? "#{@path}/#{name}.md"
    end

```ruby
author_data.exists? 'brian'
>> true
```

#### `all_authors`
Returns an Array of all the authors who exist on the site.

```ruby
author_data.all_authors
>> [..., ...]
```

#### `published_authors`
Returns an Array of all the authors who have published blog posts on [18f.gsa.gov](https://18f.gsa.gov).

```ruby
author_data.published_authors
>> [..., ...]
```

#### `all_authors`
returns an Array of all the authors who exist on the site, but have not published any blog posts.

```ruby
author_data.unpublished_authors
>> [..., ...]
```

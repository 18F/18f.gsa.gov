# jekyll-oembed

oEmbed plugin for jekyll that creates an `oembed` liquid tag

## Installation

### With bundler
Within your project's `Gemfile`, add the following within the `:jekyll_plugins` group:

```ruby
# Gemfile
group :jekyll_plugins do
  gem 'jekyll_oembed'
end
```

### Standalone

Add [the code](lib/jekyll_oembed.rb) directly to your `_plugins` directory
Create the following plugin in your projects _plugins directory.

If you do this, you will also need to add [`ruby-oembed`](https://github.com/ruby-oembed/ruby-oembed) to your `Gemfile`

```ruby
# Gemfile
gem "ruby-oembed"
```

## Usage

To use an oembed, simply do the following. Pass the embedded url as plain text, not wrapped in quotes like a string.

```liquid
  # Correct
  {% oembed https://www.youtube.com/watch?v=GPUaUgjbbsA %}

  # Incorrect
  {% oembed "https://www.youtube.com/watch?v=GPUaUgjbbsA" %}
```

`jekyll_oembed` does not support customizing width, height, or adding any attributes directly to the embedded HTML.


## Limitations

Protected URLs: some URLs are private. If this is the case, oembed _may_ not function properly


## Attribution

Thank you to:
- @vanto for the [plugin code](https://gist.github.com/vanto/1455726) that powers the gem
- @stereobooster for creating a [different version](https://github.com/stereobooster/jekyll_oembed) of the gem

This will automatically require all of the gems specified in your Gemfile.

## Resources

- [oEmbed providers](http://www.oembed.com/#section7.1)
- [`ruby-oembed`](https://github.com/ruby-oembed/ruby-oembed)


## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

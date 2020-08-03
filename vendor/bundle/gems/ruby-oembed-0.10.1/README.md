# ruby-oembed

[![Gem](https://img.shields.io/gem/v/ruby-oembed.svg)](https://rubygems.org/gems/ruby-oembed)
[![Travis branch](https://img.shields.io/travis/ruby-oembed/ruby-oembed/master.svg)](https://travis-ci.org/ruby-oembed/ruby-oembed/branches)
[![Code Climate](https://img.shields.io/codeclimate/github/ruby-oembed/ruby-oembed.svg)](https://codeclimate.com/github/ruby-oembed/ruby-oembed)
[![Coveralls](https://coveralls.io/repos/github/ruby-oembed/ruby-oembed/badge.svg?branch=coveralls)](https://coveralls.io/github/ruby-oembed/ruby-oembed?branch=coveralls)
![Maintenance](https://img.shields.io/maintenance/yes/2016.svg)


An oEmbed consumer library written in Ruby, letting you easily get embeddable HTML representations of supported web pages, based on their URLs. See [oembed.com](http://oembed.com) for more about the protocol.

# Installation

  gem install ruby-oembed

# Get Started

## Providers

Get information about a URL via an OEmbed::Provider. This library comes with many Providers built right in, to make your life easy.

```ruby
resource = OEmbed::Providers::Youtube.get("http://www.youtube.com/watch?v=2BYXBC8WQ5k")
resource.video? #=> true
resource.thumbnail_url #=> "http://i3.ytimg.com/vi/2BYXBC8WQ5k/hqdefault.jpg"
resource.html #=> <<-HTML
  <object width="425" height="344">
    <param name="movie" value="http://www.youtube.com/v/2BYXBC8WQ5k?fs=1"></param>
    <param name="allowFullScreen" value="true"></param>
    <param name="allowscriptaccess" value="always"></param>
    <embed src="http://www.youtube.com/v/2BYXBC8WQ5k?fs=1" type="application/x-shockwave-flash" width="425" height="344" allowscriptaccess="always" allowfullscreen="true"></embed>
  </object>
HTML
```

If you'd like to use a provider that isn't included in the library, it's easy to create one. Just provide the oEmbed API endpoint and URL scheme(s).

```ruby
my_provider = OEmbed::Provider.new("http://my.cool-service.com/api/oembed_endpoint.{format}")
my_provider << "http://*.cool-service.com/image/*"
my_provider << "http://*.cool-service.com/video/*"
resource = my_provider.get("http://a.cool-service.com/video/1") #=> OEmbed::Response
resource.provider.name #=> "My Cool Service"
```

To use multiple Providers at once, simply register them.

```ruby
OEmbed::Providers.register(OEmbed::Providers::Youtube, my_provider)
resource = OEmbed::Providers.get("http://www.youtube.com/watch?v=2BYXBC8WQ5k") #=> OEmbed::Response
resource.type #=> "video"
resource.provider.name #=> "Youtube"
```

Last but not least, ruby-oembed supports both [oohEmbed](http://oohembed.com) and [Embedly](http://embed.ly). These services are provider aggregators. Each supports a wide array of websites ranging from [Amazon.com](http://www.amazon.com) to [xkcd](http://www.xkcd.com).

## Formatters

This library works wonderfully on its own, but can get a speed boost by using 3rd party libraries to parse oEmbed data. To use a 3rd party Formatter, just be sure to require the library _before_ ruby-oembed.

```ruby
require 'json'
require 'xmlsimple'
require 'oembed'

OEmbed::Formatter::JSON.backend #=> OEmbed::Formatter::JSON::Backends::JSONGem
OEmbed::Formatter::XML.backend  #=> OEmbed::Formatter::XML::Backends::XmlSimple
```

The following, optional, backends are currently supported:
* The [JSON implementation for Ruby](http://flori.github.com/json/)
* Rails' ActiveSupport::JSON (confirmed to work with Rails 3.0.x and should work with Rails 2.0+)
* [XmlSimple](http://xml-simple.rubyforge.org/)

# Lend a Hand

Code for the ruby-oembed library is [hosted on GitHub](https://github.com/ruby-oembed/ruby-oembed).

```bash
# Get the code.
git clone git://github.com/ruby-oembed/ruby-oembed.git
cd ruby-oembed
# Install all development-related gems.
gem install bundler
bundle install
# Run the tests.
bundle exec rake
# or run the test continually
bundle exec guard
```

If you encounter any bug, feel free to [create an Issue](https://github.com/ruby-oembed/ruby-oembed/issues).

We gladly accept pull requests! Just [fork](http://help.github.com/forking/) the library and commit your changes along with relevant tests. Once you're happy with the changes, [send a pull request](http://help.github.com/pull-requests/).

We do our best to [keep our tests green](http://travis-ci.org/ruby-oembed/ruby-oembed)

# Contributors

Thanks to [all who have made contributions](https://github.com/ruby-oembed/ruby-oembed/contributors) to this gem, both large and small.

# License

This code is free to use under the terms of the MIT license.

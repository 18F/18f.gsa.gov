##
# OEmbed Liquid Tag for Jekyll
#   - requires https://github.com/judofyr/ruby-oembed/
#
# Copyright 2011 Tammo van Lessen
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
##

# Example Usage
# {% oembed https://www.youtube.com/watch?v=5l-7vmArLJY %}
#
# You can also specify attributes that will be placed directly on the iframe
# {% oembed https://www.youtube.com/watch?v=5l-7vmArLJY width=200 %}
#
# Accepted parameters:
#
# - title
# - width
# - height
# - type
# - provider
#

require 'oembed'

# register all default OEmbed providers
::OEmbed::Providers.register_all()
# since register_all does not register all default providers, we need to do this here. See https://github.com/judofyr/ruby-oembed/issues/18
::OEmbed::Providers.register(::OEmbed::Providers::Instagram, ::OEmbed::Providers::Slideshare, ::OEmbed::Providers::Yfrog, ::OEmbed::Providers::MlgTv)
::OEmbed::Providers.register_fallback(::OEmbed::ProviderDiscovery, ::OEmbed::Providers::Embedly, ::OEmbed::Providers::OohEmbed)


module Jekyll
  class OEmbedPlugin < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      arguments = text.strip.split(' ')
      @text = arguments[0]
      @attributes = map_to_object(arguments[1..-1])
    end

    def render(context)
      # pipe param through liquid to make additional replacements possible
      url = Liquid::Template.parse(@text).render context
      url = url.strip! || url.strip

      # oembed look up
      result = ::OEmbed::Providers.get(url)

      attributes = extend(result, @attributes)

      extracted_html = extract_html(result)

      iframe = "<iframe title=\"#{attributes['title']}\"" \
        "width=\"#{attributes['width']}\" height=\"#{attributes['height']}\"" \
        "src=\"#{extracted_html}\" frameborder=\"0\"" \
        "allowfullscreen></iframe>"
      "<div class=\"embed-container #{attributes['type']} #{attributes['provider']}\">#{iframe}</div>"
    end

    private

    def map_to_object(array)
      obj = {}
      array.each do |m|
        key_value_pair = m.split('=')
        obj[key_value_pair[0]] = key_value_pair[1]
      end
      obj
    end

    def extend(result, attributes)
      obj = {}
      obj['title']       = result.title
      obj['width']       = result.width
      obj['height']      = result.height
      obj['type']        = result.type
      obj['provider']    = result.fields['provider_name'] || result.fields['provider-name'] || 'unknown'

      attributes.map do |attribute|
        obj[attribute[0]] = attribute[1]
      end
      obj
    end

    def extract_html(result)
      result.html[result.html.index('src="')..-1].split('"')[1]
    end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbedPlugin)

require 'oembed'

# Register all default OEmbed providers
::OEmbed::Providers.register_all
# Since register_all does not register all default providers,
# we need to do this here.
# See https://github.com/judofyr/ruby-oembed/issues/18
::OEmbed::Providers.register(
  ::OEmbed::Providers::Instagram,
  ::OEmbed::Providers::Slideshare,
  ::OEmbed::Providers::Yfrog,
  ::OEmbed::Providers::MlgTv
)
::OEmbed::Providers.register_fallback(
  ::OEmbed::ProviderDiscovery,
  ::OEmbed::Providers::Embedly,
  ::OEmbed::Providers::OohEmbed
)

module Jekyll
  class OEmbedPlugin < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      # Pipe param through liquid to make additional replacements possible
      url = Liquid::Template.parse(@text).render context
      url = url.strip! || url.strip
      begin
        # OEmbed look up
        result = ::OEmbed::Providers.get(url)

        html_output(result)
      rescue
        error_message(url)
        ''
      end
    end

    def html_output(result)
      "<div class=\"embed-container #{result.fields['type']} " \
        "#{result.fields['provider']}\">#{result.html}</div>"
    end

    def error_message(url)
      # Silent error. This seems preferable to a hard fail
      # because a user could make a URL private anytime.
      puts "OEmbedError: The url, #{url}, is not available as an oembed. " \
        'Consider using an HTML embed instead.'.red
    end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbedPlugin)

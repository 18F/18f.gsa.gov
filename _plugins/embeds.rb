module Jekyll
  module EmbedFilter
    # Pass a url like {{ "https://youtube-nocookie.com/blahblahblah/" | embed }}
    # It will spit out a standardized embed
    def embed(input)
      "<div class='embed-container'><iframe src='#{input}' width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::EmbedFilter)

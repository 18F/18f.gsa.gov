module Jekyll
  module EmbedFilter
    # Given a URL, returns an embed
    # Example:
    #   {{ "https://youtube-nocookie.com/blahblahblah/" | embed: "some title" }}
    def embed(input, title = "")
      title = title.empty? ? input : title
      "<div class='embed-container'><iframe src='#{input}' title='#{title}'" \
        " width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::EmbedFilter)

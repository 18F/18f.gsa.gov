module Jekyll
  module EmbedFilter
    # Pass a url like {{ "https://youtube-nocookie.com/blahblahblah/" | embed: "some title" }}
    # It will spit out a standardized embed
    def embed(input, title = nil)
      title ||= input
      "<div class='embed-container'><iframe src='#{input}' title='#{title}'" \
        " width='560' height='315' frameborder='0' allowfullscreen></iframe></div>"
    end
    module_function :embed
  end
end

Liquid::Template.register_filter(Jekyll::EmbedFilter)

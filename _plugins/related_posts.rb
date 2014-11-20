module Jekyll
  class RelGenerator < Liquid::Tag

    def initialize(related_posts, text, tokens)
      super
      @text = text
    end

    def render(context)
      tags = context['page']['tags']
      siteTags = context['site']['tags']
      other_posts = []
      for tag in tags
        other_posts.push( siteTags[tag] )
        other_posts = other_posts.flatten.uniq
        if other_posts.size > 5
          other_posts = other_posts.drop(5)
        end
      end
      related_posts = "<ul>"
      i = 0
      for post in other_posts.flatten
        if i < 5 then
          related_posts << "<li><a href='#{post.url}' class='related_posts'>#{post.title}</a></li>"
          i += 1
        else
          next
        end
      end
      related_posts << "</ul>"
    end
  end
end
Liquid::Template.register_tag('related_posts', Jekyll::RelGenerator)

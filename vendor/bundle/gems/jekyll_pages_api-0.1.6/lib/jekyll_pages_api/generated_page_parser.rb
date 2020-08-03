# @author Mike Bland (michael.bland@gsa.gov)

module JekyllPagesApi
  # Contains helper methods for parsing values from HTML.
  class GeneratedPageParser
    # Parses elements from a generated page's content needed by GeneratedPage.
    # @param content see {GeneratedPage#initialize}
    # @param title_prefix see {GeneratedSite#initialize}
    # @param body_element_tag see {GeneratedSite#initialize}
    # @return [Hash<String, String>, String] the metadata hash containing the
    #   `title`, `tags`, and `skip-index` elements; and the body content
    #   stripped of boilerplate
    def self.parse_generated_page(content, title_prefix, body_element_tag)
      data = {}
      head_element = self.parse_basic_tag 'head', content
      return data, "" if head_element.nil?

      title = self.parse_basic_tag 'title', head_element
      if !title.nil? && title.start_with?(title_prefix)
        title = title[title_prefix.size..title.size]
      end
      data['title'] = title
      data.merge!(self.parse_meta_tags head_element)
      return data, self.parse_content_from_body(content, body_element_tag)
    end

    # Parses a value from content from between tags that cannot be nested,
    # e.g. <head>, <body>, <title>.
    # @param tag_name [String] name of the tag to parse
    # @param content [String] HTML content from which to parse a value
    # @return [String] if a value is successfully parsed
    # @return [nil] if the tag isn't present in content, or is not well-formed
    def self.parse_basic_tag(tag_name, content)
      open_tag = "<#{tag_name}"
      close_tag = "</#{tag_name}>"
      open_i = content.index open_tag
      return nil if open_i.nil?
      open_i = content.index('>', open_i + open_tag.size) + 1
      close_i = content.index close_tag, open_i
      return nil if close_i.nil?
      content[open_i..close_i-1]
    end

    # Parses the (name, content) pairs from <meta> tags in the <head> element.
    # Note that it parses _only_ the `name` and `content` fields.
    # @param head_element [String] <head> element from an HTML document
    # @return [Hash<String, String>] a collection of (name, content) values
    def self.parse_meta_tags(head_element)
      open_tag = "<meta "
      open_i = head_element.index open_tag
      meta_tags = {}

      until open_i.nil? do
        # -1 to remove the space at the end.
        open_i += open_tag.size - 1
        close_i = head_element.index '>', open_i
        return meta_tags if close_i.nil?

        current = head_element[open_i..close_i]
        attrs = {'name' => nil, 'content' => nil}

        attrs.keys.each do |attr|
          attr_begin = " #{attr}="
          attr_begin_i = current.index attr_begin
          unless attr_begin_i.nil?
            attr_begin_i += attr_begin.size + 1
            delim = current[attr_begin_i-1]
            attr_end_i = current.index delim, attr_begin_i
            next if attr_end_i.nil?
            attr_end_i -= 1
            attrs[attr] = current[attr_begin_i..attr_end_i]
          end
        end
        meta_name = attrs['name']
        meta_tags[meta_name] = attrs['content'] unless meta_name.nil?
        close_i += 1
        open_i = head_element.index open_tag, close_i
      end
      meta_tags
    end

    # Parse actual content from an HTML page, leaving out boilerplate.
    # @param content [String] content of an HTML document
    # @param body_element_tag see {GeneratedSite#initialize}
    def self.parse_content_from_body(content, body_element_tag)
      body = parse_basic_tag 'body', content
      return content if body.nil?
      start_body = body.index body_element_tag unless body_element_tag.empty?
      return body if start_body.nil?

      start_body += 1
      end_name_i = body.index ' ', start_body
      bracket_i = body.index '>', start_body
      end_name_i = bracket_i if bracket_i < end_name_i
      tag_name = body[start_body..end_name_i-1]
      open_tag = "<#{tag_name}"
      end_tag = "</#{tag_name}>"

      start_body = bracket_i + 1
      search_i = start_body
      open_tag_i = body.index open_tag, search_i
      end_tag_i = body.index end_tag, search_i
      depth = 1
      until depth == 0
        if end_tag_i.nil?
          raise "End tag missing: #{end_tag}"
        end
        if !open_tag_i.nil? && open_tag_i < end_tag_i
          depth += 1
          search_i = open_tag_i + open_tag.size
          open_tag_i = body.index open_tag, search_i
        else
          depth -= 1
          search_i = end_tag_i + end_tag.size
          end_tag_i = body.index end_tag, search_i unless depth == 0
        end
      end
      body[start_body..end_tag_i-1]
    end
  end
end

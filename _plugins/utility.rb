module Jekyll
  module Utility
    attr_reader :match

    def clip_char(str, char = '-')
      str = str.to_s
      str = if str[0] == char
              str[1...str.length]
            else
              str
            end
      if str[-1] == char
        str[0...-1]
      else
        str
      end
    end

    def hash_link(str)
      if str[0] == '#'
        str.to_s
      else
        "##{str}"
      end
    end

    def matches_url(page_url, url)
      page_url = clip_char(page_url.to_s.downcase, '/')
      url = clip_char(url.to_s.downcase, '/')
      page_url == url || nil
    end

    def matches_collections(page, nav_item)
      returned_page = nil
      collections = nav_item['collections'] || nil
      collections&.each do |collection|
        returned_page = true if page['collection'] == collection
      end
      returned_page
    end

    def matches_permalink_alt(page_url, item)
      url_alt = item['permalink_alt']
      url_alt = clip_char(url_alt.to_s.downcase, '/')
      page_url[0...url_alt.length] == url_alt || nil
    end

    def matches_url_parent(page, item)
      is_match = matches_collections(page, item)

      if !is_match
        url = item['permalink']
        page_url = page['url']
        page_url = clip_char(page_url.to_s.downcase, '/')
        url = clip_char(url.to_s.downcase, '/')
        is_match = page_url[0...url.length] == url || nil
        if !is_match && item['permalink_alt']
          matches_permalink_alt(page_url, item)
        else
          is_match
        end
      else
        is_match
      end
    end

    def crawl_pages(item, page_url)
      if matches_url(page_url, item['permalink'])
        @match = item
      elsif item['children']
        item['children'].each do |child|
          crawl_pages(child, page_url)
        end
      end
    end

    def find_page(page_url, nav_items)
      unless @match
        nav_items.each do |item|
          break if @match
          crawl_pages(item, page_url)
        end
      end
      @match
    end

    def check_type(value, second_value = nil, third_value = nil)
      _type = value.class
      _second_type = second_value.class
      _third_type = third_value.class
      puts '---------------------'
      puts "#{value} is a #{_type}"
      puts '---------------------'
      binding.pry
    end

    def find_collection(site, collection)
      document = site.collections.select { |c| c.label == collection }[0].docs
      document.map(&:data)
    end

    def where_obj(array, filter)
      array = array.map do |object|
        next unless !object[filter].nil? && !object[filter].empty?
        object
      end.compact.uniq
      array
    end

    def in_groups(array, groups)
      array.in_groups(groups)
    end
  end
end

class Array
  def in_groups(num_groups)
    return [] if num_groups.zero?
    slice_size = (size / Float(num_groups)).ceil
    each_slice(slice_size).to_a
  end
end
Liquid::Template.register_filter(Jekyll::Utility)

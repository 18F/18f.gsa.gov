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
      if url.is_a? Array
        urls = url.map do |u|
          page_url = clip_char(page_url.to_s.downcase, '/').split('/')[0]
          u = clip_char(u.to_s.downcase, '/').split('/')[0]
          # if the url group is 'blog', match date strings
          is_blog_post = (u == 'blog') && (page_url.to_i.positive?)
          matching_url = (page_url == u) || is_blog_post
          matching_url || nil
        end
        urls.compact.any? || nil
      else
        page_url = clip_char(page_url.to_s.downcase, '/')
        url = clip_char(url.to_s.downcase, '/')
        page_url == url || nil
      end
    end

    # active: debugging
    def debug(value, second_value = nil, third_value = nil)
      _type = value.class
      _second_type = second_value.class
      _third_type = third_value.class
      # puts '---------------------'
      # puts "#{value} is a #{_type}"
      # puts '---------------------'
      # binding.pry
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
      array.in_groups(groups, false)
    end

    def weighted_sort(array, weight_name, sort_name)
      weighted_group = []
      az_group = []
      array.each do |item|
        if item[weight_name]
          weighted_group << item
        else
          az_group << item
        end
      end

      az_group = az_group.sort_by do |key, _value|
        key[sort_name].downcase
      end

      weighted_group = weighted_group.sort_by do |key, _value|
        key[sort_name].downcase
      end.reverse

      weighted_group = weighted_group.sort_by do |key, _value|
        key[weight_name].to_f
      end.reverse

      weighted_group + az_group
    end
  end
end

class Array
  # From Rails#in_groups
  # http://api.rubyonrails.org/classes/Array.html#method-i-in_groups
  def in_groups(number, fill_with = nil)
    # size.div number gives minor group size;
    # size % number gives how many objects need extra accommodation;
    # each group hold either division or division + 1 items.
    division = size.div number
    modulo = size % number

    # create a new array avoiding dup
    groups = []
    start = 0

    number.times do |index|
      length = division + (modulo.positive? && modulo > index ? 1 : 0)
      groups << last_group = slice(start, length)
      last_group << fill_with if fill_with != false &&
                                 modulo.positive? && length == division
      start += length
    end

    if block_given?
      groups.each { |g| yield(g) }
    else
      groups
    end
  end
end
Liquid::Template.register_filter(Jekyll::Utility)

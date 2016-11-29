require 'pry'
require 'rb-readline'

module Jekyll
  module Utility
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

    def hash_link(text)
      "##{text}"
    end

    def dasherize(text)
      text = text.to_s
      text = text.downcase.gsub(/[^a-z\0-9\s]/, '').gsub(/\W+/, '-')
      clip_char(text)
    end

    def matches_url(page_url, url)
      page_url = clip_char(page_url.to_s.downcase, '/')
      url = clip_char(url.to_s.downcase, '/')
      page_url == url || nil
    end

    def matches_url_parent(page_url, url)
      page_url = clip_char(page_url.to_s.downcase, '/')
      url = clip_char(url.to_s.downcase, '/')
      page_url[0...url.length] == url || nil
    end

    def crawl_pages(item, page_url, _debug)
      if matches_url(page_url, item['permalink'])
        # puts "found #{item['text'].inspect}"
        @match = item
        # puts "setting @match to #{@match['text'].inspect} for #{_debug.inspect}"
      elsif item['children']
        # puts "skipping #{item['text'].inspect}"
        item['children'].each do |child|
          # puts "recurse for #{child['text'].inspect}"
          crawl_pages(child, page_url, child['text'])
        end
      end
    end

    def find_page(page_url, nav_items)
      nav_items.each do |item|
        break if @match
        crawl_pages(item, page_url, item['text'])
      end
      @match
    end

    def check_type(value)
      type = value.class
      # puts '---------------------'
      # puts "#{value} is a #{type}"
      # puts '---------------------'
      # binding.pry
    end
  end
end
Liquid::Template.register_filter(Jekyll::Utility)

require 'pry'
require 'rb-readline'

def clean_tags(tags)
  cleaned_tags = []
  tags.each do |tag|
    cleaned_tags << tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze
  end
  cleaned_tags
end

def clean_tag(tag)
  tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze

end

def update_tags(tags)
  tags.map {|key, array| clean_tag(tag) }
end

module Jekyll
  # class Site
  #   def initialize(config)
  #     binding.pry
  #   end
  # end
  module Archives

    def initialize(config = nil)
      # binding.pry
      if config['jekyll-archives'].nil?
        @config = DEFAULTS
      else
        @config = Utils.deep_merge_hashes(DEFAULTS, config['jekyll-archives'])
      end

    end

    def render
      # binding.pry
      payload = @site.site_payload
      @archives.each do |archive|
        archive.render(@site.layouts, payload)
      end

    end

    class Archive
      def initialize(site, title, type, posts)
        binding.pry
        'day in the life' if title == 'day-in the life'

        @site   = site
        @posts  = site.posts.docs[0]

        @type   = type
        @title  = title
        @config = site.config['jekyll-archives']

        # Generate slug if tag or category (taken from jekyll/jekyll/features/support/env.rb)
        if title.is_a? String
          @slug = Jekyll::Utils.slugify(title)
        end

        # Use ".html" for file extension and url for path
        @ext  = File.extname(relative_path)
        @path = relative_path
        @name = File.basename(relative_path, @ext)

        @data = {
          "layout" => layout
        }
        @content = ""
      end
    end
  end
end
Jekyll::Hooks.register :documents, :post_init do |document|
  binding.pry
end

Jekyll::Hooks.register :site, :pre_render do |site|

  # binding.pry
  tags = {}
  consolidated_arr = []
  # binding.pry
  # site.tags = Hash[*site.tags.map { |k,a| [clean_tag(k), a] }.flatten]
  test_hash = {
    'user centered design' => [1, 2],
    'user-centered design' => [3, 4]
  }

  # test_hash.inject(test_hash) do |hash, (k,v)|
    #   new_k = clean_tag(k)
    #   consolidated_arr << test_hash[k]
    #   hash[new_k] = consolidated_arr.flatten
    #   if new_k != k
    #     hash.delete(k)
    #   end
    # hash
  # end

  site.tags.inject(site.tags) do |hash, (k,v)|
    new_k = clean_tag(k)
    consolidated_arr << site.tags[k]
    hash[new_k] = consolidated_arr.flatten
    if new_k != k
      hash.delete(k)
    end
    hash
  end

  Jekyll.sites[0].config['archives'].each do |archive|
    # binding.pry
  end


  site.posts.docs.each do |post|
    binding.pry
    tags = post.data['tags'] || []
    if tags.any?
      # binding.pry
      post.data['tags'] = clean_tags(post.data['tags'])
    end
  end

  site.pages.each do |page|
    tags = page.data['tags'] || []
    page_posts = page['posts'] || []
    if page_posts.any? and !page_posts.nil?
      # binding.pry
      page_posts.each do |page_post|
        # binding.pry
        if page_post.data['tags'].include? 'user centered design'
          # binding.pry
        end
      end

      # page.data['tags'] = clean_tags(page.data['tags'])
    end
  end

end

Jekyll::Hooks.register :site, :post_render do |site|
  site.posts.docs.each do |post|
    tags = post.data['tags'] || []
    if tags.any?
      # if tags.include? 'user-centered design' or tags.include? 'user centered design'
      #   binding.pry
      # end
      post.data['tags'] = clean_tags(post.data['tags'])
    end
  end
  # binding.pry
end


Jekyll::Hooks.register :pages, :pre_render do |page|
  Jekyll.sites[0].config['archives'].each do |archive|
    # binding.pry
    posts = archive.posts || []
    # if posts.any?

      if archive['title'] == 'day-in the life' or archive['title'] == 'day in the life'
        # binding.pry
      end

      # puts "post_title: #{archive['title']}"
      # puts "post_tags: #{archive['tags']}"


    # end
  end

  tags = page.data['tags'] || []

  if tags.any?
    if tags.include? 'user centered design'
      binding.pry
    end
    # page.data['tags'] = clean_tags(post.data['tags'])
  end
end

Jekyll::Hooks.register :posts, :post_init do |post|
  binding.pry
end
Jekyll::Hooks.register :posts, :pre_render do |post|
  # binding.pry
  tags = post.data['tags'] || []
  # post.data['tags'] ||= []
  if tags.any?
    # binding.pry
    if tags.include? 'user-centered design'
        binding.pry
      end
    post.data['tags'] = clean_tags(post.data['tags'])

  end
end

require 'parallel'

module Jekyll
  class RelatedPostsGenerator < Generator
    safe :true
    priority :lower

    # Calculate related posts.
    # Returns [<Post>]
    def related_posts(me, posts)
      return [] unless posts.docs.size > 1
      highest_freq = @tag_freq.values.max
      related_scores = Hash.new(0)

      posts.docs.each do |post|
        if @use_categories
          post.data['categories'].each do |category|
            if me.data['categories'].include?(category) && post != me
              cat_freq = @tag_freq[category]
              related_scores[post] += (1 + highest_freq - cat_freq)
            end
          end
        end
        if @use_tags
          post.data['tags'].each do |tag|
            if me.data['tags'].include?(tag) && post != me
              cat_freq = @tag_freq[tag]
              related_scores[post] += (1 + highest_freq - cat_freq)
            end
          end
        end

        next unless @use_authors
        post.data['authors'].each do |author|
          if me.data['authors'].include?(author) && post != me
            cat_freq = @tag_freq[author]
            related_scores[post] += (1 + highest_freq - cat_freq)
          end
        end
      end

      sort_related_posts(related_scores)
    end

    # Calculate the frequency of each tag.
    # Returns {tag => freq, tag => freq, ...}
    def tag_freq(posts)
      @tag_freq = Hash.new(0)
      posts.docs.each do |post|
        post.data['categories'].each { |category| @tag_freq[category] += 1 } if @use_categories
        post.data['tags'].each { |tag| @tag_freq[tag] += 1 } if @use_tags

        post.data['authors'].each { |author| @tag_freq[author] += 1 } if @use_authors
      end
    end

    # Sort the related posts in order of their score and date
    # and return just the posts
    def sort_related_posts(related_scores)
      related_scores.sort do |a, b|
        if a[1] < b[1]
          1
        elsif a[1] > b[1]
          -1
        else
          b[0].date <=> a[0].date
        end
      end.collect { |post, _freq| post }
    end

    def create_presets(site)
      @use_tags = true
      @use_authors = true
      @use_categories = false
      @use_categories = true if site.config['related_categories']
      @use_tags = false if !site.config['related_tags'].nil? && site.config['related_tags'] != true
      @use_authors = false if !site.config['related_authors'].nil? && site.config['related_authors'] != true
    end

    def in_threads(site)
      site.config['n_cores'] ? site.config['n_cores'] : 1
    end

    def generate(site)
      return unless site.config['related_posts']
      n_posts = site.config['related_posts']

      create_presets(site)
      tag_freq(site.posts)

      Parallel.map(site.posts.docs.flatten, in_threads: in_threads(site)) do |post|
        rp = related_posts(post, site.posts)[0, n_posts]

        post.data.merge!('related_posts' => rp) if rp.size.positive?
      end
    end
  end
end

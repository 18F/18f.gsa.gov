require 'jekyll'
require 'pry'
require 'rb-readline'

module Jekyll
  module Archives
    # Internal requires
    autoload :Archive, 'jekyll-archive'
    autoload :VERSION, 'jekyll-archives-version'

    class Archives < Jekyll::Generator
      safe true

      DEFAULTS = {
        'layout' => 'archive',
        'enabled' => [],
        'permalinks' => {
          'year' => '/:year/',
          'month' => '/:year/:month/',
          'day' => '/:year/:month/:day/',
          'tag' => '/tag/:name/',
          'category' => '/category/:name/'
        }
      }

      def initialize(config = nil)
        if config['jekyll-archives'].nil?
          @config = DEFAULTS
        else
          @config = Utils.deep_merge_hashes(DEFAULTS, config['jekyll-archives'])
        end
      end

      def generate(site)
        # binding.pry
        @site = site
        @posts = site.posts
        @archives = []

        @site.config['jekyll-archives'] = @config

        read
        @site.pages.concat(@archives)

        @site.config["archives"] = @archives
      end

      # Read archive data from posts
      def read
        read_tags
        read_categories
        read_dates
      end

      def read_tags
        if enabled? "tags"
          tags.each do |title, posts|
            @archives << Archive.new(@site, title, "tag", posts)
          end
        end
      end

      def read_categories
        if enabled? "categories"
          categories.each do |title, posts|
            @archives << Archive.new(@site, title, "category", posts)
          end
        end
      end

      def read_dates
        years.each do |year, posts|
          @archives << Archive.new(@site, { :year => year }, "year", posts) if enabled? "year"
          months(posts).each do |month, posts|
            @archives << Archive.new(@site, { :year => year, :month => month }, "month", posts) if enabled? "month"
            days(posts).each do |day, posts|
              @archives << Archive.new(@site, { :year => year, :month => month, :day => day }, "day", posts) if enabled? "day"
            end
          end
        end
      end

      # Checks if archive type is enabled in config
      def enabled?(archive)
        @config["enabled"] == true || @config["enabled"] == "all" || if @config["enabled"].is_a? Array
          @config["enabled"].include? archive
        end
      end

      # Write archives to their destination
      def write
        @archives.each do |archive|
          archive.write(@site.dest) if archive.regenerate?
          archive.add_dependencies
        end
      end

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

      def tags
        # binding.pry
        # @site.post_attr_hash('tags')

        # def post_attr_hash(post_attr)
        #   # Build a hash map based on the specified post attribute ( post attr =>
        #   # array of posts ) then sort each array in reverse order.
        #   hash = Hash.new { |h, key| h[key] = [] }
        #   posts.docs.each do |p|
        #       p.data[post_attr].each { |t| hash[t] << p } if p.data[post_attr]
        #     end
        #     hash.values.each { |posts| posts.sort!.reverse! }
        #     hash
        # end

        hash = Hash.new { |h, key| h[key] = [] }

        # In Jekyll 3, Collection#each should be called on the #docs array directly.
        if Jekyll::VERSION >= '3.0.0'
          @posts.docs.each do |p|
            p.data['tags'] ||= []
            p.data['tags'] = clean_tags(p.data['tags'])
            # binding.pry
            p.data['tags'].each { |t| hash[t] << p } if p.data['tags']
            # hash['tags'] << p
            # binding.pry

            # hash[p.date.strftime("%Y")] << p
          end
        else
          # @posts.each { |p| hash[p.date.strftime("%Y")] << p }
        end
        hash.values.each { |posts| posts.sort!.reverse! }
        hash
        # binding.pry
      end

      def categories
        @site.post_attr_hash('categories')
      end

      # Custom `post_attr_hash` method for years
      def years
        hash = Hash.new { |h, key| h[key] = [] }

        # In Jekyll 3, Collection#each should be called on the #docs array directly.
        if Jekyll::VERSION >= '3.0.0'
          @posts.docs.each { |p| hash[p.date.strftime("%Y")] << p }
        else
          @posts.each { |p| hash[p.date.strftime("%Y")] << p }
        end
        hash.values.each { |posts| posts.sort!.reverse! }
        hash
      end

      def months(year_posts)
        hash = Hash.new { |h, key| h[key] = [] }
        year_posts.each { |p| hash[p.date.strftime("%m")] << p }
        hash.values.each { |posts| posts.sort!.reverse! }
        hash
      end

      def days(month_posts)
        hash = Hash.new { |h, key| h[key] = [] }
        month_posts.each { |p| hash[p.date.strftime("%d")] << p }
        hash.values.each { |posts| posts.sort!.reverse! }
        hash
      end
    end
  end
end

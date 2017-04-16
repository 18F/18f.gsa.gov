require 'pry'
if ENV['JEKYLL_ENV'] == 'production'
  require 'twitter'
end
module Jekyll

  class AutoTweet < Generator
    safe true
    def initialize(site)
      @site           = site
      @tw_api_key     = ENV['TW_API_KEY'] || false    # 'Missing Consumer Key (API Key)'
      @tw_api_secret  = ENV['TW_API_SECRET'] || false  # 'Missing Consumer Secret (API SECRET)'
      @tw_token       = ENV['TW_TOKEN'] || false         # 'Missing Access Token'
      @tw_secret      = ENV['TW_SECRET'] || false        # 'Missing Access Token Secret'
      @jekyll_env     = ENV['JEKYLL_ENV'] || false
    end

    def prepare_api()
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = @tw_api_key
        config.consumer_secret     = @tw_api_secret
        config.access_token        = @tw_token
        config.access_token_secret = @tw_secret
      end
      return client
    end

    def send_tweet(tweet_content, client)
      client.update(tweet_content)
    end

    def post_new?(dest, id)
      if File.exists?(File.join(dest, id, 'index.html'))
        return false
      else
        return true
      end
    end

    def prepare_update(site, client)
      for post in site.posts
        if post_new?(site.dest, post.id)
          tweet = post.tweet
          binding.pry
          url = site.config['url'] + post.url
        else
          tweet = false
        end
      end
      if title && desc
        url_size = client.configuration.short_url_length_https
        max_length = 140-url_size
        begin_tweet = "New post from @#{client.current_user.username}: #{title}"
        if begin_tweet.length < max_length
          remain = max_length - begin_tweet.length
          end_tweet = desc[0, remain-3]
          tweet = "#{begin_tweet}, #{end_tweet} #{url}"
        end
      end
      return tweet
    end

    def generate(site)
      if  @jekyll_env == 'production'
        client = prepare_api()
        tweet_content = prepare_update(site, client)
        send_tweet(tweet_content, client)
      else
        puts "      Your tweet about could not be sent because this is not a #{@jekyll_env} environment."
      end
    end
  end

end

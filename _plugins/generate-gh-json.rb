require 'pry'
require 'curb'
module Jekyll
  class GitHubGenerator < Generator
    def generate(site)
      @gh_key = ENV['GH_KEY']
      @gh_org = ENV['GH_ORG']
      @projects = site.data['projects']
      @gh_url = 'https://api.github.com/repos/' + @gh_org
      @gh_data = {}
      i = 0
      for project in @projects
        if rate() >= 1
          name = project['name']
          data = self.fetch(name.to_str)
          @gh_data[name] = {}
          @gh_data[name]['issues'] = data['open_issues']
          @gh_data[name]['stars'] = data['stargazers_count']
          @gh_data[name]['forks'] = data['forks_count']
          i += 1
          @gh_data['generated_time'] = Time.now
          File.open('_data/github.yml', 'w') { |f| f.write @gh_data.to_yaml }
        else
          timediff =  Time.now - Time.at(site.data['github']['generated_time'])
          diff_min = 60 - (timediff / 60)
          binding.pry
          puts('You maxed out the GitHub API rate limit! How could you!? try again in ' + diff_min.to_s + ' minutes.')
        end
        
        # site.data['projects'][i]['github-data'] = @gh_data
      end
    end

    def fetch(name)
      url = @gh_url + '/' + name
      http = Curl::Easy.new(url)
      http.headers["User-Agent"] = "18f-dash"
      http.perform
      data = JSON.parse(http.body_str)
    end

    def rate()
      url = @gh_url + '/rate_limit'
      http = Curl::Easy.new(url)
      http.headers["User-Agent"] = "18f-dash"
      http.perform
      http_headers = http.header_str.split(/[\r\n]+/).map(&:strip)
      data = JSON.parse(http_headers.to_json)
      data[6][-1].to_i
    end

  end
end

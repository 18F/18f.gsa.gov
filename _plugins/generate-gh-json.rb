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
          @gh_data['issues'] = data['open_issues']
          @gh_data['stars'] = data['stargazers_count']
          @gh_data['forks'] = data['forks_count']
          i += 1
        else
          @gh_data['issues'] = site.data['projects'][i]['github-data']['issues']
          @gh_data['stars'] = site.data['projects'][i]['github-data']['stars']
          @gh_data['forks'] = site.data['projects'][i]['github-data']['forks']
          i += 1
        end
        site.data['projects'][i]['github-data'] = @gh_data
      end
    end

    def fetch(name)
      url = @gh_url + '/' + name
      http = Curl::Easy.new(url)
      http.headers["User-Agent"] = "18f-dash"
      http.perform
      binding.pry
      data = JSON.parse(http.body_str)
    end

    def rate()
      binding.pry
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

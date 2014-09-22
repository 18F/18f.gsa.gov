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
        timediff =  Time.now - Time.at(@projects[i]['last_checked'])
        diff_min = 60 - (timediff / 60)
        if ( diff_min / 60 ) >= 60
          name = project['name']
          data = self.fetch(name.to_str)
          project['issues'] = data['open_issues']
          project['stars'] = data['stargazers_count']
          project['forks'] = data['forks_count']
          @projects[i]['generated_time'] = Time.now.to_i
          @projects[i] = project
        else
          project['issues'] = @projects[i]['issues']
          project['stars'] = @projects[i]['stars']
          project['forks'] = @projects[i]['forks']
          project['last_checked'] = @projects[i]['last_checked']
          @projects[i] = project
          puts('You maxed out the GitHub API rate limit! How could you!? try again in ' + diff_min.to_s + ' minutes.')
        end
        i += 1
        File.open('_data/projects.yml', 'w') { |f| f.write @projects.to_yaml }        
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

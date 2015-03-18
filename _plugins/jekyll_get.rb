require 'open-uri'

module Jekyll_Get
  class Generator < Jekyll::Generator
    def generate(site)
      config = site.config['jekyll_get']
      if !config
        return
      end
      if !config.kind_of?(Array)
        config = [config]
      end
      config.each { |d| site.data[d['data']] = JSON.load(open(d['json'])) }
    end
  end
end

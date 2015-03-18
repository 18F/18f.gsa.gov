require 'hash-joiner'
require 'open-uri'

module Jekyll_Get
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.config['jekyll_get']
      if !config
        return
      end
      if !config.kind_of?(Array)
        config = [config]
      end
      config.each do |d|
        target = site.data[d['data']]
        source = JSON.load(open(d['json']))
        if target
          HashJoiner.deep_merge target, source
        else
          site.data[d['data']] = source
        end
      end
    end
  end
end

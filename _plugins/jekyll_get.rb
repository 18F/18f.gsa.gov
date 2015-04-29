require 'json'
require 'open-uri'

module Jekyll_Get
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.config['jekyll_get']
      return if !config
      Array(config).each do |to_get|
        begin
          target = site.data[to_get['data']]
          source = JSON.load(open(to_get['json']))
          if target
            Jekyll::Utils.deep_merge_hashes target, source
          else
            site.data[to_get['data']] = source
          end
          if to_get['cache']
            path = "#{site.config['data_source']}/#{to_get['data']}.json"
            open(path, 'wb') do |file|
              file << JSON.generate(site.data[to_get['data']])
            end
          end
        rescue
          next
        end
      end
    end
  end
end

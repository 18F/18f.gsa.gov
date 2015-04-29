require 'json'
require 'open-uri'

module Jekyll_Get
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      sources_to_fetch = site.config['jekyll_get']
      return if !sources_to_fetch

      Array(sources_to_fetch).each do |to_get|
        begin
          # Only fetch the data if it's not cached already.
          if !(data_from_site(site, to_get) && to_get['cache'])
            new_data = JSON.load(open(to_get['json']))
            merge_with_preexisting_data(site, to_get, new_data)
            if to_get['cache']
              File.write(cache_path(site, to_get), JSON.generate(data_from_site(site, to_get)))
            end
          end
        rescue
          $stderr.puts "Error fetching #{to_get['json']}, skipping."
          next
        end
      end
    end

    private
    def cache_path(site, to_get)
      "#{site.config['data_source']}/#{to_get['data']}.json"
    end

    def merge_with_preexisting_data(site, to_get, new_data)
      preexisting = data_from_site(site, to_get) || {}
      site.data[to_get['data']] = Jekyll::Utils.deep_merge_hashes preexisting, new_data
    end

    def data_from_site(site, to_get)
      site.data[to_get['data']]
    end
  end
end

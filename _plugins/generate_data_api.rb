require 'pry'
module Jekyll

  class DataAPI < Page
    def initialize(site, base, dir, data)
      @site = site
      @base = base
      @dir = dir
      @data = data
      # @name = 'data.json'
      # @tag_title_prefix = site.config['tag_title_prefix']
    end
  end

  class APIGenerator < Generator
    safe true

    def generate(site)
      dir = '_site/api'
      site.data.keys.each do |datum|
        write_data_api(site, File.join(dir, datum), datum)
      end
    end

    def write_data_api(site, dir, datum)
      index = DataAPI.new(site, site.source, dir, datum)
      data_set = site.data[datum]
      binding.pry
      File.open(dir+'.json', 'w+') { |file| file.write(data_set.to_json)}
      binding.pry
    end
  end

end

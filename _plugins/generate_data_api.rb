require 'fileutils'

module Jekyll

  class JSONFile < Jekyll::StaticFile
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @name = name
    end
  end
  class APIGenerator < Generator
    safe true

    def generate(site)
      api_dir = Jekyll.sanitized_path(site.dest, site.config.fetch('api_dir', '/api'))
      data_dir = File.join(api_dir, '/data')
      FileUtils.mkdir_p(api_dir) if !Dir.exists?(api_dir)
      FileUtils.mkdir_p(data_dir) if !Dir.exists?(data_dir)
      site.data.keys.each do |datum|
        write_data_api(site, data_dir, datum)
        site.keep_files << File.join('api', 'data', "#{datum}.json")
      end
    end

    def write_data_api(site, dir, datum)
      data_set = site.data[datum]
      File.open(File.join(dir, "#{datum}.json"), 'w') { |file| file.write(data_set.to_json) }
    end
  end
end

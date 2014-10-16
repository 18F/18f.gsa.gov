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
      dir = '/api' || site.config['api_dir']
      Dir.mkdir(site.dest+dir) if !Dir.exists?(site.dest+dir)
      Dir.mkdir(site.dest+dir+'/data') if !Dir.exists?(site.dest+dir+'/data')
      dir = dir+'/data/'
      site.data.keys.each do |datum|
        write_data_api(site, dir, datum)
        new_static = JSONFile.new(site, site.dest, '/api/data/', datum+'.json')
        site.keep_files << 'api/data/'+datum+'.json'
      end
    end

    def write_data_api(site, dir, datum)
      data_set = site.data[datum]
      File.open(site.dest+dir+datum+'.json', 'w') { |file| file.write(data_set.to_json)}
    end
  end
end

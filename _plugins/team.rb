module Jekyll
  module TeamFilter
    def team_photo(name)
      baseurl = Jekyll.sites[0].config['baseurl']
      default = "<img class='img-circle team-img bio-clip' "\
        "src='#{baseurl}/assets/img/logos/18F-Logo-M.png' alt='18F logo'>"
      author_data = SiteData::AuthorData.new
      person = author_data.exists? name
      if person
        full_name = author_data.fetch(name, 'full_name')
        image = File.join('assets', 'img', 'team', "#{name}.jpg")
        image_file = File.join(Jekyll.sites[0].config['source'], image)
        if File.exist?(image_file)
          "<img class='img-circle team-img bio-clip' "\
          "src='#{baseurl}/#{image}' alt='18F team member #{full_name}'>"
        else
          default
        end
      else
        default
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::TeamFilter)

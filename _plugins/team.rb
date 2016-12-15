module Jekyll
  module TeamFilter
    def team_photo(name)
      author_data = AuthorData.new
      person = author_data.exists? name
      full_name = author_data.fetch(name, 'full_name')
      baseurl = Jekyll.sites[0].config['baseurl']
      image = File.join('assets', 'img', 'team', "#{name}.jpg")

      if person and File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<img class='img-circle team-img bio-clip' src='#{baseurl}/#{image}' alt='18F team member #{full_name}'>"
      else
        "<img class='img-circle team-img bio-clip' src='#{baseurl}/assets/img/logos/18F-Logo-M.png' alt='18F logo'>"
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::TeamFilter)

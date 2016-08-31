module Jekyll
  module TeamFilter
    def team_photo(name)
      person = finder(name)
      baseurl = Jekyll.sites[0].config['baseurl']
      image = File.join('assets', 'img', 'team', "#{name}.jpg")

      if person && File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<img class='img-circle team-img bio-clip' src='#{baseurl}/#{image}' alt='18F team member #{person.data['full_name']}'>"
      else
        "<img class='img-circle team-img bio-clip' src='#{baseurl}/assets/img/logos/18F-Logo-M.png' alt='18F logo'>"
      end
    end

    def finder(name)
      Jekyll.sites[0].collections['team'].docs.find do |member|
        member.data["name"] == name
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::TeamFilter)

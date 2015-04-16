module Jekyll
	module TeamFilter
		# Assumes you have a data file name "team"
    def team_photo(input)
      person = finder(input)
      image = File.join 'assets', 'images', 'team', "#{input}.jpg" 
      if File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<img class='img-circle team-img bio-clip' src='/#{image}' alt='18F team member #{person['full_name']}'>" unless person.nil?
      else
        "<img class='img-circle team-img bio-clip' src='/assets/images/18f.png' alt='18F logo'>"
      end
    end

    def team_full_name(input)
    	person = finder(input)
    	person['full_name'] unless person.nil?
    end
    
    def finder(name)
    	return Jekyll.sites[0].data['team'][name]
    end
  end
end
Liquid::Template.register_filter(Jekyll::TeamFilter)
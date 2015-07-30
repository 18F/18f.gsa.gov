module Jekyll
	module TeamFilter
    def team_photo(input)
      person = finder(input)
      # require 'pry'; binding.pry
      image = File.join 'assets', 'images', 'team', "#{input}.jpg"
      if File.exist?(File.join(Jekyll.sites[0].config['source'], image))
        "<img class='img-circle team-img bio-clip' src='/#{image}' alt='18F team member #{person.data['full_name']}'>" unless person.nil?
      else
        "<img class='img-circle team-img bio-clip' src='/assets/images/18f.png' alt='18F logo'>"
      end
    end

    def team_role(input)
    	person = finder(input)
    	if person['team']
    		return person['team']
    	elsif person['working_groups']
    		return person['working_groups'][0]
    	else
    		return false
    	end
    end

    def finder(name)
      return Jekyll.sites[0].collections['team'].docs.find {|member| member.data["name"] == name}
    end
  end
end
Liquid::Template.register_filter(Jekyll::TeamFilter)

module Jekyll
  class PifData < Generator
    def generate(site)
      (site.data['pif_team'] || []).each {|name, data| data['name'] = name}
    end
  end
end

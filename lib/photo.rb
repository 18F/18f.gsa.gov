# This Photo class handles the logic behind fetching
# and displaying photos of team members.
class Photo
  attr_reader :slug, :full_name, :config

  def initialize(slug:, full_name: nil, config: Jekyll.sites[0].config)
    @slug = slug
    @full_name = full_name || humanized_name
    @config = config
  end

  def tag(pre: nil)
    src, alt = image_src_and_alt(pre: pre)
    "<img class='circle-15' src='#{src}' alt='#{alt}'>"
  end

  def path
    File.join("assets", "img", "team", "#{slug}.jpg")
  end

  def url
    File.join(baseurl, path)
  end

  private

  def baseurl
    config.fetch("baseurl")
  end

  def image_src_and_alt(pre: nil)
    if File.exist?(File.join(*[pre, path].compact))
      [url, "Photo of post author #{full_name}"]
    else
      [placeholder_url, "Placeholder image for post author #{full_name} (18F logo)"]
    end
  end

  def placeholder_url
    File.join(baseurl, "assets", "img", "logos", "18F-Logo-M.png")
  end

  def humanized_name
    slug.split("-").map(&:capitalize).join(" ")
  end
end

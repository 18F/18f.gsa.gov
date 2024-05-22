class Photo

  attr_reader :slug, :full_name, :config

  def initialize(slug: , full_name: nil, config: Jekyll.sites[0].config)
    @slug = slug
    @full_name = full_name || humanized_name
    @config = config
  end

  def tag
    src, alt = image_src_and_alt
    "<img class='circle-15' src='#{src}' alt='#{alt}'>"
  end

  private

  def image_src_and_alt
    if File.exist?(photo_path)
      [photo_path, "Photo of post author #{full_name}"]
    else
      [placeholder_path, "Placeholder image for post author #{full_name} (18F logo)"]
    end
  end

  # @todo Change "team" to "author"
  def photo_path
    File.join(config.fetch("baseurl"), "assets", "img", "team", "#{slug}.jpg")
  end

  def placeholder_path
    @memo ||= File.join(config.fetch("baseurl"), "assets", "img", "logos", "18F-Logo-M.png")
  end

  def humanized_name
    slug.split("-").map(&:capitalize).join(" ")
  end
end

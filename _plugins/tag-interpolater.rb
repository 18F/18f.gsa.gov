require 'pry'
require 'rb-readline'

Jekyll::Hooks.register :pages, :pre_render do |page|
  # code to call after Jekyll renders a post
  # def clean_tags(tags)
  #   cleaned_tags = []
  #   tags.each do |tag|
  #     cleaned_tags << tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze
  #   end
  #   cleaned_tags
  # end

  # if post.data['tags']
  #   # binding.pry
  #   post.data['tags'] = clean_tags(post.data['tags'])

  # end
  page.data['tags'] ||= []
  permalink = page.data['permalink'] || ''

  # if page.name.include? 'index' && page.data['tags'].any?
  if permalink.include? 'tags/'
    binding.pry
  end

end

Jekyll::Hooks.register :posts, :pre_render do |post|
  # code to call after Jekyll renders a post
  def clean_tags(tags)
    cleaned_tags = []
    tags.each do |tag|
      cleaned_tags << tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze
    end
    cleaned_tags
  end

  post.data['tags'] ||= []
  if post.data['tags'].any?
    # binding.pry
    post.data['tags'] = clean_tags(post.data['tags'])

  end
end

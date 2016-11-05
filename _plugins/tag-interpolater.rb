require 'pry'
require 'rb-readline'

def clean_tags(tags)
  cleaned_tags = []
  tags.each do |tag|
    cleaned_tags << tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze
  end
  cleaned_tags
end

def clean_tag(tag)
  tag.gsub(/[^0-9A-Za-z]/, ' ').squeeze

end


Jekyll::Hooks.register :site, :pre_render do |site|
  tags = {}
  consolidated_arr = []

  # doesn't work because site.tags is immutable
  # site.tags.inject(site.tags) do |hash, (k,v)|
  #   new_k = clean_tag(k)
  #   consolidated_arr << site.tags[k]
  #   hash[new_k] = consolidated_arr.flatten
  #   if new_k != k
  #     hash.delete(k)
  #   end
  #   hash
  # end

end


Jekyll::Hooks.register :posts, :pre_render do |post|
  tags = post.data['tags'] || []
  if tags.any?
    post.data['tags'] = clean_tags(post.data['tags'])

  end
end

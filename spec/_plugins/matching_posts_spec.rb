# require_relative '../../_plugins/matching_posts'

# RSpec.describe Jekyll::MatchingPosts do
#   class MatchingPostsClass
#   end

#   before(:each) do
#     @matching_posts = MatchingPostsClass.new
#     @matching_posts.extend(Jekyll::MatchingPosts)

#     @author_page = YAML.load(File.read(File.join(Dir.pwd, 'spec/_posts/page.rb')))
#   end

#   describe 'd ' do

# 	  it "takes returns an embed given one variable" do

# 	    posts = @matching_posts.match_posts(@author_page, 'tags')
# 	    binding.pry
# 	    expected_count = 7
# 	    actual_count = posts.count

# 	    expect(expected_count).to eq actual_count
# 	  end
# 	end
# end

# require_relative '../../_plugins/matching_posts'

# RSpec.describe Jekyll::MatchingPosts do
#   class DummyClass
#   end

#   before(:each) do
#     @dummy_class = DummyClass.new
#     @dummy_class.extend(Jekyll::MatchingPosts)
#   end

#   it "takes returns an embed given one variable" do
#     # binding.pry
#     author_page = {"draft"=>false,
#      "categories"=>[],
#      "layout"=>"default-profile",
#      "name"=>"18F",
#      "first_name"=>"18F",
#      "last_name"=>nil,
#      "full_name"=>"18F",
#      "role"=>"Organization",
#      "city"=>nil,
#      "state"=>nil,
#      "github"=>"18F",
#      "twitter"=>"18F",
#      "team"=>"18F",
#      "redirect_from"=>"/team/18F/",
#      "published"=>true,
#      "title"=>"18f",
#      "slug"=>"18F",
#      "ext"=>".md",
#      "tags"=>[],
#      "date"=>"2016-12-30 11:45:32 -0600"
#    }

#     posts = @dummy_class.match_posts(author_page, 'authors')

#     expected_count = 8
#     actual_count = posts.count

#     expect(expected_count).to eq actual_count
#   end
# end

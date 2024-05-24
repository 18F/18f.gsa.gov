# require_relative "../../_plugins/author_filters"

# RSpec.describe Jekyll::TeamMemberPhotoFilter do
#   before(:each) do
#     @team_filter = Class.new.new.extend(Jekyll::TeamMemberPhotoFilter)
#     config = Jekyll.configuration(source: "./", destination: "./_site", baseurl: "spec/support")
#     @site = Jekyll::Site.new(config)
#   end

#   context "with an author" do
#     context "who has an image" do
#       it "returns an author image" do
#         photo = @team_filter.staff_photo("matt-cloyd")
#         expect(photo).to match("matt-cloyd.jpg")
#         expect(photo).to match("Photo of post author Matt Cloyd")
#       end
#     end
#     context "who does not have an image" do
#       it "returns a placeholder image" do
#         photo = @team_filter.staff_photo("alan")
#         expect(photo).to match "assets/img/logos/18F-Logo-M.png"
#         expect(photo).to match /Placeholder image for post author Alan deLevie \(18F logo\)/
#       end
#     end
#   end

# end

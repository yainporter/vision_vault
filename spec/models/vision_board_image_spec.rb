# require "rails_helper"

# RSpec.describe VisionBoardImage, type: :model do
#   describe "class methods" do
#     describe ".search_images" do
#       let!(:user) { create(:user) }

#       context "a valid parameter is passed" do
#         it "returns results ignoring the case" do
#           images = create_list(:image, 5, name: "bag", user_id: user.id)

#           expect(Image.search_images("BAG")).to eq(images)
#         end
#       end

#       context "a matching parameter is passed in uppercase" do
#         it "returns results ignoring the case" do
#           images = create_list(:image, 5, name: "bag", user_id: user.id)

#           expect(Image.search_images("BAG")).to eq(images)
#         end
#       end

#       context "a blank parameter is passed" do
#         it "returns nothing" do
#           create_list(:image, 5, name: "bag", user_id: user.id)

#           expect(Image.search_images("")).to eq(nil)
#         end
#       end

#       context
#     end
#   end
# end

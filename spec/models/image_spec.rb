require "rails_helper"

RSpec.describe Image, type: :model do
  describe "class methods" do
    describe ".search_images" do
      let!(:user) { create(:user) }

      context "a valid parameter is passed" do
        it "returns VisionBoardImage results" do
          create_list(:image, 5, name: "bag", user_id: user.id)
          vision_board_images = Image.search_vision_board_images("BAG")

          vision_board_images.each do |vision_board|
            expect(vision_board).to be_a VisionBoardImage
          end
        end
      end

      context "a matching parameter is passed in uppercase" do
        it "returns results ignoring the case" do
          images = create_list(:image, 5, name: "bag", user_id: user.id)

          expect(Image.search_vision_board_images("BAG")).to eq(images)
        end
      end

      context "a blank parameter is passed" do
        it "returns nothing" do
          create_list(:image, 5, name: "bag", user_id: user.id)

          expect(Image.search_vision_board_images("")).to eq(nil)
        end
      end

      context
    end
  end
end

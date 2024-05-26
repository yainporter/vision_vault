require "rails_helper"

RSpec.describe "Image Index", type: :feature do
  describe "Search function" do
    context "a User adds an image result to their visionboard" do
      it "creates a VisionBoardImage for the User's VisionBoard" do
        user = create(:user)
        create(:vision_board, user_id: user.id)
        user2 = create(:user)
        image = create(:image, name: "Dog", user_id: user2.id)

        require 'pry'; binding.pry
        expect{
          login_as(user)
          visit images_path
          fill_in "Search", with: "dog"
          click_button "Search"
          within "#results-#{image.id}" do
            click_link "Add"
            save_and_open_page
            click_button "Add Image"
          end
        }.to change {user.vision_board_images}.by(1)
      end
    end
  end
end

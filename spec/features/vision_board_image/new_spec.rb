require "rails_helper"

RSpec.describe "New Vision Board Image", type: :feature do
  context "a User adds an image result to their visionboard" do
    it "creates a VisionBoardImage for the User's VisionBoard" do
      user = create(:user)
      create(:vision_board, user_id: user.id)
      user2 = create(:user)
      image = create(:image, name: "Dog", user_id: user2.id)

      expect{
        login_as(user)
        visit new_vision_board_image_path(image_id: image.id)
        click_button "Add Image"
      }.to change {user.vision_board_images.count}.by(1)
    end
  end
end

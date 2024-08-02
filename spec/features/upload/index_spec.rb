require "rails_helper"

RSpec.describe "Image Index", type: :feature do
  describe "Search function" do
    context "a user searches for images by name" do
      let!(:user) { create(:user) }

      xit "displays a max list of 20 images" do
        create_list(:upload, 30, name: "Bag", user_id: user.id)
        login_as(user)

        visit uploads
        fill_in "Search", with: "bag"
        click_button "Search"

        within "#search-results" do
          expect(page).to have_css('.image-results', count: 20)
        end
      end
    end

    context "a User adds an image result to their visionboard" do
      xit "creates a VisionBoardImage for the User's VisionBoard" do
        user = create(:user)
        create(:vision_board, user_id: user.id)

        user2 = create(:user)
        create(:upload, name: "Dog", user_id: user2.id)

        expect{
          login_as(user)
          visit uploads
          fill_in "Search", with: "dog"
          click_button "Search"
          within "#results-#{}" do
            click_button "Add"
            find("button", text: "Add Image").click
          end
        }.to change {user.vision_board_images}.by(1)
      end
    end
  end
end

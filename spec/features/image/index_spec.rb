require "rails_helper"

RSpec.describe "Image Index", type: :feature do
  describe "Search function" do
    let!(:user) { create(:user) }

    context "a user searches for images by name" do
      it "displays a max list of 20 images" do
        create_list(:image, 30, name: "Bag", user_id: user.id)
        login_as(user)

        visit images_path
        save_and_open_page
        fill_in "Search", with: "bag"
        click_button "Search"

        within "#search-results" do
          expect(page).to have_css('.image', count: 20)
        end
      end
    end
  end
end

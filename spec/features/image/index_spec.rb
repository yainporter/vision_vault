require "rails_helper"

RSpec.describe "Image Index", type: :feature do
  describe "Search function" do
    let!(:user) { create(:user) }

    context "a user searches for images by name" do
      it "displays a max list of 20 images" do
        create_list(:image, 30, name: "Bag")

        visit images_path
        fill_in "Search", with: "bag"
        click_button "Search"

        within "#search-results" do
          expect(page).to have_css('.image', count: 20)
        end
      end
    end
  end
end

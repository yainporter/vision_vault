require "rails_helper"

RSpec.describe "Vision Board New", type: :feature do

  describe "Creating a new Vision Board" do
    context "a user fills out the information to create a new Vision Board" do
      it "appears on the User's dashboard", :vcr do
        user = User.new(email: "test@test.test", password: "testing")
        login_as(user)

        visit dashboard_path

        expect(page).to_not have_content("D&D")

        click_button("New Vision Board")
        
        within "#new-vision-board" do
          fill_in "Name", with: "D&D"
          click_button "Create"
        end

        expect(page).to have_content("D&D")
      end
    end
  end
end

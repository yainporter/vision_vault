require "rails_helper"

RSpec.describe "User Edit", type: :feature do

  describe "User image upload" do
    context "avatar uploads successfully" do
      it "displays an image next to the User information", :vcr do
        user = User.new(email: "test@test.test", password: "testing")
        login_as(user)

        visit edit_user_registration_path
        
        attach_file('user[avatar]', Rails.root.join('spec', 'fixtures', 'Turing.png'))

        fill_in "Current password", with: "testing"

        save_and_open_page

        visit edit_user_registration_path
        expect(page).to have_selector('img[alt="profile-avatar"]')

      end
    end
  end
end

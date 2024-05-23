require "rails_helper"

RSpec.describe "User Edit", type: :feature do

  describe "User image upload" do
    context "avatar uploads successfully" do
      it "displays an image next to the User information", :vcr do
        user = User.new(email: "test@test.test", password: "testing")
        user.attach
        profile_image = find("img[alt='profile-avatar']")
        expect(page).to have(profile_image)
      end
    end
  end
end

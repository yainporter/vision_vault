require "rails_helper"

RSpec.describe "User Edit", type: :feature do

  describe "User image upload" do
    let!(:user) { create(:user) }
    let!(:vision_board) { create(:vision_board, user_id: user.id)}

    context "a User uploads an image and fills out the current password" do
      it "attaches an image to the User avatar" do
        login_as(user)
        visit edit_user_registration_path
        attach_file('user[avatar]', Rails.root.join('spec', 'fixtures', 'Turing.png'))
        fill_in "Current password", with: "#{user.password}"
        click_button "Update User"

        user.reload

        expect(user.avatar.attached?).to be true
      end

      # Is this a necessary test?
      it "displays the image on the page" do
        login_as(user)
        visit edit_user_registration_path

        expect(page).to_not have_selector('img[alt="profile-avatar"]')

        attach_file('user[avatar]', Rails.root.join('spec', 'fixtures', 'Turing.png'))
        fill_in "Current password", with: "#{user.password}"
        click_button "Update User"

        expect(page).to have_selector('img[alt="profile-avatar"]')
      end
    end
  end
end

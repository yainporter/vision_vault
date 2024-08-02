require "rails_helper"

RSpec.describe "User Uploads", type: :feature do
  let!(:user) { create(:user) }
  let!(:vision_board) { create(:vision_board, user_id: user.id)}

  context "a user fills out all fields and attaches upload" do
    it "creates a new Upload for the User" do
      login_as(user)
      visit new_upload_path

      attach_file('upload[image]', Rails.root.join('spec', 'fixtures', 'Turing.png'))
      expect {
        fill_in "Name", with: "Dragon"
        fill_in "Description", with: "Dragon breathing fire"
        click_button "Create Upload"
      }.to change {Upload.count}.by(1)
    end
  end

  context "a user leaves required fields blank" do
    it "does not create an upload" do
      login_as(user)
      visit new_upload_path

      attach_file('upload[image]', Rails.root.join('spec', 'fixtures', 'Turing.png'))

      expect {
        fill_in "Name", with: ""
        click_button "Create Upload"
      }.not_to change {Upload.count}
    end

    context "a user does not attach an image" do
      it "does not create an upload" do
        login_as(user)
        visit new_upload_path

        expect {
          fill_in "Name", with: "Dragon"
          fill_in "Description", with: "Dragon breathing fire"
          click_button "Create Upload"
        }.not_to change {Upload.count}
      end
    end
  end
end

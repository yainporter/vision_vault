require "rails_helper"

RSpec.describe "New upload", type: :feature do
  describe "Creating a new upload" do
    let!(:user) { create(:user) }
    let!(:vision_board) { create(:vision_board, user_id: user.id)}

    context "a user fills out form with image name and attaches upload" do
      it "creates a new Image for the User" do
        login_as(user)
        visit dashboard_path

        attach_file('image[upload]', Rails.root.join('spec', 'fixtures', 'Turing.png'))
        expect {
          fill_in "Name", with: "Dragon"
          click_button "Create Upload"
        }.to change {Upload.count}.by(1)
      end
    end

    context "a user leaves the name blank" do
      it "does not create an upload" do
        login_as(user)
        visit dashboard_path

        attach_file('image[upload]', Rails.root.join('spec', 'fixtures', 'Turing.png'))

        expect {
          fill_in "Name", with: ""
          click_button "Create upload"
        }.not_to change {Upload.count}
      end

      context "a user does not attach an upload" do
        it "does not create an upload" do
          login_as(user)
          visit dashboard_path

          expect {
            fill_in "Name", with: ""
            click_button "Create upload"
          }.not_to change {Upload.count}
        end
      end
    end
  end
end

require "rails_helper"

RSpec.describe "New Image", type: :feature do
  describe "Creating a new Image" do
    let!(:user) { create(:user) }
    let!(:vision_board) { create(:vision_board, user_id: user.id)}

    context "a user fills out form with image name and attaches image" do
      it "creates a new Image for the User" do
        login_as(user)
        visit dashboard_path

        attach_file('image[image]', Rails.root.join('spec', 'fixtures', 'Turing.png'))
        expect {
          fill_in "Name", with: "Dragon"
          click_button "Create Image"
        }.to change {Image.count}.by(1)
      end
    end

    context "a user leaves the name blank" do
      it "does not create an Image" do
        login_as(user)
        visit dashboard_path

        attach_file('image[image]', Rails.root.join('spec', 'fixtures', 'Turing.png'))

        expect {
          fill_in "Name", with: ""
          click_button "Create Image"
        }.not_to change {Image.count}
      end

      context "a user does not attach an image" do
        it "does not create an Image" do
          login_as(user)
          visit dashboard_path

          expect {
            fill_in "Name", with: ""
            click_button "Create Image"
          }.not_to change {Image.count}
        end
      end
    end
  end
end

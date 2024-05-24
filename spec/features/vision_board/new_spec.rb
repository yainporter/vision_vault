require "rails_helper"

RSpec.describe "Vision Board New", type: :feature do
  describe "Creating a new Vision Board" do
    let(:user) { create(:user) }

    context "a user fills out title create a new Vision Board" do
      it "creates a new VisionBoard for the User" do
        login_as(user)
        visit new_vision_board_path

        expect {
          fill_in "Title", with: "D&D"
          click_button "Create Vision board"
        }.to change {VisionBoard.count}.by(1)
      end
    end

    context "a user leaves the title blank" do
      it "does not create a VisionBoard" do
        login_as(user)
        visit new_vision_board_path

        expect {
          fill_in "Title", with: "D&D"
          click_button "Create Vision board"
        }.to change {VisionBoard.count}.by(1)
      end
    end
  end
end

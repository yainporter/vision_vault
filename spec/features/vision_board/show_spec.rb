require "rails_helper"

RSpec.describe "Vision Board Show", type: :feature do
  let!(:user) { create(:user) }
  let!(:vision_board) { create(:vision_board, user_id: user.id) }

  describe "image deletion" do
    it "deletes an image from a User's Vision Board" do
      upload = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
      upload2 = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
      upload3 = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
      VisionBoardImage.create!(upload_id: upload.id, vision_board_id: vision_board.id)
      VisionBoardImage.create!(upload_id: upload2.id, vision_board_id: vision_board.id)
      VisionBoardImage.create!(upload_id: upload3.id, vision_board_id: vision_board.id)


      login_as(user)

      expect{

        visit "vision_boards/#{vision_board.id}"
      save_and_open_page
        within "#upload-2" do
          click_link("Delete Image")
        end
      }.to change{ VisionBoardImage.count }.by(-1)
    end
  end
end

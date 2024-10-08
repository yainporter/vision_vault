require "rails_helper"

RSpec.describe VisionBoardImage, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:vision_board) { create(:vision_board, user_id: user.id) }

  describe "instance methods" do
    describe ".find_image_attachments" do
      it "returns all the Uploads attached to a VisionBoard" do
        upload = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload2 = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload3 = create(:upload, user_id:user2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload3.id, vision_board_id: vision_board.id)

        images = VisionBoardImage.image_attachment
        expect(images).to eq([upload, upload2, upload3])
      end

      it "returns Uploads with an image file attached" do
        upload = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload2 = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload3 = create(:upload, user_id:user2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload3.id, vision_board_id: vision_board.id)

        uploads = VisionBoardImage.image_attachment
        uploads.each do |upload|
          expect(upload.image.attached?).to be true
        end
      end
    end
  end

  describe "class methods" do
    describe ".find_image" do
      it "returns the VisionBoardImage that matches the argument" do
        upload = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload2 = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        upload3 = create(:upload, user_id:user2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload2.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(upload_id: upload3.id, vision_board_id: vision_board.id)

        ids = { upload_id: upload2.id, vision_board_id: vision_board.id }
        find_image = VisionBoardImage.find_image(ids)

        expect(find_image).to eq(VisionBoardImage.second)
      end
    end
  end
end

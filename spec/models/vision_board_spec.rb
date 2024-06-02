require "rails_helper"

RSpec.describe VisionBoard, type: :model do
  describe "instance methods" do
    describe "#unsplash_ids" do
      let(:user) { create(:user) }
      let(:vision_board) { create(:vision_board, user_id: user.id) }

      it "returns the ids of all unsplash_ids for a User's VisionBoard" do
        upload = create(:upload, user_id:user.id, vision_board_id: vision_board.id)
        unsplash = "gKXKBY-C-Dk"
        unsplash2 = "CEx86maLUSc"
        VisionBoardImage.create!(upload_id: upload.id, vision_board_id: vision_board.id)
        VisionBoardImage.create!(unsplash_id: unsplash, vision_board_id: vision_board.id)
        VisionBoardImage.create!(unsplash_id: unsplash2, vision_board_id: vision_board.id)

        ids = vision_board.unsplash_ids

        expect(ids).to eq(["gKXKBY-C-Dk", "CEx86maLUSc"])
      end
    end
  end
end

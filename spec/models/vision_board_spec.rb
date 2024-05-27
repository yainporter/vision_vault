require "rails_helper"

RSpec.describe VisionBoard, type: :model do
  describe "class methods" do
    describe ".find_image_attachments" do
      let(:user) { create(:user) }
      let(:user2) { create(:user) }
      let(:vision_board) { create(:vision_board, user_id: user.id) }
    end
  end
end

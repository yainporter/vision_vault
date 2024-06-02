class VisionBoardImage < ApplicationRecord
  belongs_to :upload, optional: true
  belongs_to :vision_board
  has_one_attached :vision_image

  def self.image_attachment
    Upload.joins(:vision_board_images)
  end
end

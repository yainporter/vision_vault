class VisionBoardImage < ApplicationRecord
  belongs_to :upload
  belongs_to :vision_board
  has_one_attached :vision_image

  def self.image_attachment
    Upload.joins(:vision_board_images)
  end

  def self.search_uploads(keyword)

  end
end

class VisionBoardImage < ApplicationRecord
  belongs_to :upload
  belongs_to :vision_board
  has_one_attached :vision_image

  def upload_name
    self.image.name
  end

  def self.search_uploads(keyword)

  end
end

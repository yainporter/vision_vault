class VisionBoardImage < ApplicationRecord
  belongs_to :image
  belongs_to :vision_board
  has_one_attached :vision_image

  def image_name
    self.image.name
  end

  def self.search_images(keyword)

  end
end

class VisionBoardImage < ApplicationRecord
  belongs_to :image
  belongs_to :vision_board
  has_one_attached :image
end

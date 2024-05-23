class VisionBoard < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :vision_board_images
  validates :title, presence: true
end

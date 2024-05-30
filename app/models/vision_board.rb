class VisionBoard < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :uploads, through: :user
  has_many :vision_board_images
  validates :title, presence: true

  def image_attachments
    Upload.joins(:vision_boards).where("vision_boards.id = ?", self.id)
  end
end

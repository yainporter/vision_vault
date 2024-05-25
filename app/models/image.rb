class Image < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :name, presence: true

  def self.search_vision_board_images(keyword)
    unless keyword.empty?
      VisionBoardImage.joins(:image).where("images.name ILIKE ?", "%#{keyword.downcase}%")
    end
  end
end

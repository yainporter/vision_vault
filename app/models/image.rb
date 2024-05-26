class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, presence: true

  def self.search_vision_board_images(keyword)
    unless keyword.empty?
      Image.where("images.name ILIKE ?", "%#{keyword.downcase}%")
    end
  end
end

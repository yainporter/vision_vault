class Upload < ApplicationRecord
  belongs_to :user
  has_many :vision_board_images
  has_one_attached :image
  validates :name, presence: true

  def self.image_search(keyword)
    unless keyword.empty?
      Upload.where("uploads.name ILIKE ?", "%#{keyword.downcase}%")
    end
  end
end

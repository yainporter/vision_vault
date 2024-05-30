class Upload < ApplicationRecord
  belongs_to :user
  has_many :vision_board_images
  has_many :vision_boards, through: :vision_board_images
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validate :image_presence

  def self.image_search(keyword)
    unless keyword.empty?
      Upload.where("uploads.name ILIKE ?", "%#{keyword.downcase}%")
    end
  end

  private

  def image_presence
    if image.attached?
      true
    else
      errors.add(:image, "must be attached")
    end
  end
end

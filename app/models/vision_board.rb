class VisionBoard < ActiveModel
  has_many_attached :images
  belongs_to :user
end

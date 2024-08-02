class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :vision_boards
  has_many :uploads
  has_many :vision_board_images, through: :vision_boards
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(email: "test@test.test", password: "testing")
vision_board = VisionBoard.create!(title: Faker::Book.title, user_id: user.id)
50.times do
  Image.create!(name: Faker::Creature::Animal.name, user_id:user.id, vision_board_id: vision_board.id )
end

images = Image.all
images.each do |image|
  image.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
  vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board.id, image_id: image.id)
  vision_board_image.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
end


user2 = User.create!(email: "testing@testing.testing", password: "testing")
vision_board2 = VisionBoard.create!(title: "D&D", user_id: user2.id)
dragon = Image.create!(name: "D&D Dragon!", user_id:user2.id, vision_board_id: vision_board2.id )
dragon.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dnd-5e-dragon.jpg')), filename: 'dnd-5e-dragon.jpg', content_type: 'image/jpg')
vision_board_image2 = VisionBoardImage.create!(vision_board_id: vision_board2.id, image_id: dragon.id)
vision_board_image2.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dnd-5e-dragon.jpg')), filename: 'dnd-5e-dragon.jpg', content_type: 'image/jpg')

warlock = Image.create!(name: "D&D Warlock!", user_id:user2.id, vision_board_id: vision_board2.id )
warlock.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'warlock.jpeg')), filename: 'warlock.jpeg', content_type: 'image/jpg')
vision_board_image3 = VisionBoardImage.create!(vision_board_id: vision_board2.id, image_id: warlock.id)
vision_board_image3.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'warlock.jpeg')), filename: 'warlock.jpeg', content_type: 'image/jpg')

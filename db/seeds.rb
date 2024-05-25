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
  vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board.id, image_id: image.id)
  vision_board_image.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
end

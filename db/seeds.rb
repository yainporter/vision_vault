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
  Upload.create! do |upload|
    upload.name =  Faker::Creature::Animal.name
    upload.user_id = user.id
    upload.vision_board_id =  vision_board.id
    upload.description = Faker::Lorem.sentences(number: 1)
    upload.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
  end

end

images = Upload.all
images.each do |image|
  vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board.id, upload_id: image.id)
  vision_board_image.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
end


user2 = User.create!(email: "testing@testing.testing", password: "testing")
vision_board2 = VisionBoard.create!(title: "D&D", user_id: user2.id)
dragon = Upload.create! do |upload|
  upload.name =  "D&D Dragon"
  upload.user_id = user2.id
  upload.vision_board_id =  vision_board2.id
  upload.description = Faker::Lorem.sentences(number: 1)
  upload.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dnd-5e-dragon.jpg')), filename: 'dnd-5e-dragon.jpg', content_type: 'image/jpg')
end

VisionBoardImage.create!(vision_board_id: vision_board2.id, upload_id: dragon.id)


warlock = Upload.create! do |upload|
  upload.name =  "D&D Warlock!"
  upload.user_id = user2.id
  upload.vision_board_id =  vision_board2.id
  upload.description = Faker::Lorem.sentences(number: 1)
  upload.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'warlock.jpeg')), filename: 'warlock.jpeg', content_type: 'image/jpg')
end

VisionBoardImage.create!(vision_board_id: vision_board2.id, upload_id: warlock.id)

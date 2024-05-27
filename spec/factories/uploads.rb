FactoryBot.define do
  factory :upload do
    name { Faker::Fantasy::Tolkien.character }

    after(:create) do |image|
      vision_board = create(:vision_board, user_id: image.user.id)
      vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board.id, upload_id: image.id)
      vision_board_image.vision_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
    end
  end
end

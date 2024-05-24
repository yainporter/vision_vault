FactoryBot.define do
  factory :image do
    name { Faker::Fantasy::Tolkien.character }

    after(:create) do |image|
      image.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
    end
  end
end

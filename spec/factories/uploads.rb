FactoryBot.define do
  factory :upload do
    name { Faker::Fantasy::Tolkien.character }
    description { Faker::Lorem.sentences(number: 1) }
    before(:create) do |image|
      image.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'Turing.png')), filename: 'Turing.png', content_type: 'image/png')
    end
  end
end

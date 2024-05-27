require "rails_helper"

RSpec.describe Upload, type: :model do
  describe "class methods" do
    describe ".image_search" do
      let!(:user) { create(:user) }

      context "a valid parameter is passed" do
        it "returns Upload results" do
          create_list(:upload, 5, name: "bag", user_id: user.id)
          image_search = Upload.image_search("BAG")

          image_search.each do |image|
            expect(image).to be_an Upload
          end
        end
      end

      context "a matching parameter is passed in uppercase" do
        it "returns results ignoring the case" do
          images = create_list(:upload, 5, name: "bag", user_id: user.id)

          expect(Upload.image_search("BAG")).to eq(images)
        end
      end

      context "a blank parameter is passed" do
        it "returns nothing" do
          create_list(:upload, 5, name: "bag", user_id: user.id)

          expect(Upload.image_search("")).to eq(nil)
        end
      end

      context
    end
  end
end

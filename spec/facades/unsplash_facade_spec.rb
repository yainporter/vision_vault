require "rails_helper"

RSpec.describe UnsplashFacade do
  describe ".search" do
    it "returns UnsplashImage poros from the Unsplash API call", :vcr do
      search_results = UnsplashFacade.search("dogs")
      search_results.each do |result|
        expect(result).to be_an(UnsplashImage)
      end
    end
  end

  describe ".find_images" do
    context "an array of valid unsplash ids" do
      it "returns an array of UnsplashImages", :vcr do
        ids = ["gKXKBY-C-Dk", "CEx86maLUSc"]
        id_results = UnsplashFacade.find_images(ids)
        id_results.each do |result|
          expect(result).to be_an(UnsplashImage)
        end
      end
    end
  end
end

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
end

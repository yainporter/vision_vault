class UnsplashFacade
  def self.search(keyword)
    search_data = Unsplash::Photo.search(keyword)
    search_data.map do |search|
      UnsplashImage.new(search)
    end
  end
end

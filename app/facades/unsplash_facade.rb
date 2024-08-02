class UnsplashFacade
  def self.search(keyword)
    search_data = Unsplash::Photo.search(keyword)
    search_data.map do |search|
      UnsplashImage.new(search)
    end
  end

  def self.find_images(ids)
    find_data = []
    ids.each do |id|
      if id.present?
        find_data << Unsplash::Photo.find(id)
      end
    end
    find_data.map do |data|
      UnsplashImage.new(data)
    end
  end
end

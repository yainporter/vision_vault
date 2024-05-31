class UnsplashImage
  attr_reader :title, :description, :alt_description, :regular_size, :full_size, :small
  def initialize(data)
    @title = data[:slug]
    @description = data[:description]
    @alt_description = data[:alt_description]
    @regular_size = data[:urls][:regular]
    @full_size = data[:urls][:full]
    @small = data[:urls][:small]
  end
end

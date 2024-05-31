class UnsplashImage
  attr_reader :id, :title, :description, :alt_description, :regular_size, :full_size, :small, :created_at
  def initialize(data)
    @id = data[:id]
    @created_at = data[:created_at]
    @title = data[:slug]
    @description = data[:description]
    @alt_description = data[:alt_description]
    @regular_size = data[:urls][:regular]
    @full_size = data[:urls][:full]
    @small = data[:urls][:small]
  end
end

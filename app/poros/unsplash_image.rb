class UnsplashImage
  attr_reader :id, :title, :description, :alt_description, :regular_size, :full_size, :small, :created_at, :custom_size
  def initialize(data)
    @id = data[:id]
    @created_at = data[:created_at]
    @title = data[:slug]
    @description = data[:description]
    @alt_description = data[:alt_description]
    @custom_size = data[:urls][:raw] + "&w=300&h=300"
    @regular_size = data[:urls][:regular]
    @full_size = data[:urls][:full]
    @small = data[:urls][:small]
  end
end

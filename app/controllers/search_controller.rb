class SearchController < ApplicationController
  def index
    begin
      @uploaded_images = Upload.image_search(keyword)
      @unsplash_images = UnsplashFacade.search(keyword)
    rescue ActionController::ParameterMissing
      @pagy, @uploads = pagy(Upload.all)
    end
  end

  private
  def keyword
    params.require(:image_search)[:search]
  end

  def all_images
    @uploaded_images = Upload.image_search(keyword)
    @unsplash_images = UnsplashFacade.search(keyword)
    [uploaded_images, unsplash_images].flatten
  end
end

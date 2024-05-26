class ImagesController < ApplicationController
  def index
    begin
      @pagy, @search_images = pagy(Image.search_vision_board_images(keyword))
    rescue ActionController::ParameterMissing
      @pagy, @images = pagy(Image.all)
    end
  end

  def new
    @image = Image.new
    @vision_boards = current_user.vision_boards
  end

  def create
    upload = current_user.images.create!(image_params)
    upload.image.attach(params[:image][:image])
    redirect_to dashboard_path
    if params[:image][:image].present?
      vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board_id, image_id: upload.id)
      vision_board_image.vision_image.attach(params[:image][:image])
      redirect_to dashboard_path
    else
      flash[:error] = "Please attach an image, try again."
      redirect_to dashboard_path
    end
  end

  private

  def keyword
    params.require(:image_search)[:search]
  end

  def image_params
    params.require(:image).permit(:name, :vision_board_id, images:[])
  end

  def vision_board_id
    params[:image][:vision_board_id].last
  end
end

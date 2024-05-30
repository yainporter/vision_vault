class UploadsController < ApplicationController
  def index
    begin
      @pagy, @search_uploads = pagy(Upload.image_search(keyword))
    rescue ActionController::ParameterMissing
      @pagy, @uploads = pagy(Upload.all)
    end
  end

  def new
    @upload = Upload.new
    @vision_boards = current_user.vision_boards
  end

  def create
    upload = current_user.uploads.new(upload_params)
    if upload.save! && upload_params[:image]
      upload.image.attach(upload_params[:image])
      VisionBoardImage.create!(vision_board_id: upload_params[:vision_board_id], upload_id: upload.id)

      flash[:alert] = "Successfully added to your vision board!"
      redirect_to new_upload_path
    else
      flash[:error] = "Please attach an image, try again."
      redirect_to new_upload_path
    end
  end

  private

  def keyword
    params.require(:image_search)[:search]
  end

  def upload_params
    params.require(:upload).permit(:name, :vision_board_id, :image, :description)
  end
end

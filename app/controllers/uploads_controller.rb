class UploadsController < ApplicationController
  def index
    begin
      @pagy, @search_uploads = pagy(Upload.search_vision_board_uploads(keyword))
    rescue ActionController::ParameterMissing
      @pagy, @uploads = pagy(Upload.all)
    end
  end

  def new
    @upload = Upload.new
    @vision_boards = current_user.vision_boards
  end

  def create
    upload = current_user.uploads.create!(upload_params)
    upload.image.attach(params[:image][:image])
    if params[:image][:image].present?
      vision_board_image = VisionBoardUpload.create!(vision_board_id: vision_board_id, upload_id: upload.id)
      vision_board_Upload.vision_Upload.attach(params[:image][:image])
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

  def upload_params
    params.require(:upload).permit(:name, :vision_board_id, uploads:[])
  end

  def vision_board_id
    params[:image][:vision_board_id].last
  end
end

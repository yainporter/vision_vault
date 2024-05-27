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
    upload = current_user.uploads.create!(upload_params)
    if params[:image][:image].present?
      upload.image.attach(params[:image][:image])
      VisionBoardImage.create!(vision_board_id: vision_board_id, upload_id: upload.id)

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

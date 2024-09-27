class UploadsController < ApplicationController
  def new
    @upload = Upload.new
    @vision_boards = current_user.vision_boards
  end

  def create
    upload = current_user.uploads.new(upload_params)
    if upload.save! && upload_params[:image]
      upload.image.attach(upload_params[:image])
      VisionBoardImage.create!(vision_board_id: upload_params[:vision_board_id], upload_id: upload.id)
      respond_to do |format|
        format.turbo_stream do
          flash.now[:alert] = "Successfully added #{upload.name} to your vision board!"
          render turbo_stream: turbo_stream.replace("image-upload", partial: "uploads/upload", locals: { upload: upload })
        end
      end
    else
      flash[:error] = "Please attach an image, try again."
      redirect_to new_upload_path
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :vision_board_id, :image, :description)
  end
end

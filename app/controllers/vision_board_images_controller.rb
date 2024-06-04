class VisionBoardImagesController < ApplicationController
  def new
    @vision_board_image = VisionBoardImage.new
    @vision_boards = current_user.vision_boards
    @upload_id = params[:upload_id]
    @unsplash_id = params[:unsplash_id]
  end

  def create
    vision_board_image = VisionBoardImage.new(vision_board_image_params)
    if vision_board_image.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("create-vision-board-image-#{upload_or_unsplash_id}", partial: "/shared/successful_creation")
        end
      end
    else
      flash[:error] = "Did not pass"
      redirect_to new_vision_board_image_path(upload_id: vision_board_image_params[:upload_id])
    end
  end

  def destroy
    vision_board_image = current_user.vision_board_images.find_image(id)
    vision_board_image.destroy!

    redirect_to vision_board_path(params[:vision_board_id])
  end

  private

  def id
    params.permit(:unsplash_id, :upload_id, :vision_board_id)
  end

  def upload_or_unsplash_id
    if vision_board_image_params[:unsplash_id].empty?
      vision_board_image_params[:upload_id]
    elsif vision_board_image_params[:upload_id].empty?
      vision_board_image_params[:unsplash_id]
    end
  end

  def vision_board_image_params
    params.require(:vision_board_image).permit(:vision_board_id, :upload_id, :unsplash_id)
  end

  def image
    Image.find(vision_board_image_params[:upload_id])
  end
end

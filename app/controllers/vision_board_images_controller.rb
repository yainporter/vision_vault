class VisionBoardImagesController < ApplicationController
  def new
    @vision_board_image = VisionBoardImage.new
    @vision_boards = current_user.vision_boards
    @image_id = params[:image_id]
  end

  def create
    vision_board_image = VisionBoardImage.new(vision_board_image_params)
    vision_board_image.image_id = 10000
    if vision_board_image.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("create-vision-board-image-#{vision_board_image_params[:image_id]}", partial: "/shared/successful_creation")
        end
      end
    else
      flash[:error] = "Did not pass"
      redirect_to new_vision_board_image_path(image_id: vision_board_image_params[:image_id])
    end
  end

  private

  def vision_board_image_params
    params.require(:vision_board_image).permit(:vision_board_id, :image_id)
  end
end

class ImagesController < ApplicationController

  def new
    @image = Image.new
    @vision_boards = current_user.vision_boards
  end

  def create
    upload = current_user.images.create!(image_params)
    require 'pry'; binding.pry
    vision_board_image = VisionBoardImage.create!(vision_board_id: vision_board_id, image_id: upload.id)
    vision_board_image.image.attach(image)

    redirect_to dashboard_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :vision_board_id, images:[])
  end

  def image
    params[:image][:image]
  end

  def vision_board_id
    params[:image][:vision_board_id].last
  end
end

class VisionBoardsController < ApplicationController
  def index

  end

  def show
    @vision_board = VisionBoard.find(params[:id])
    @uploads = @vision_board.image_attachments
    @unsplash = UnsplashFacade.find_images(@vision_board.unsplash_ids)
  end

  def new
    @vision_board = VisionBoard.new
  end

  def create
    current_user.vision_boards.create!(vision_board_params)
    redirect_to dashboard_path
  end

  private

  def vision_board_params
    params.require(:vision_board).permit(:title)
  end
end

class VisionBoardsController < ApplicationController
  def index

  end

  def show
    
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

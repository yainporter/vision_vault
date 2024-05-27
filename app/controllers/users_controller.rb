class UsersController < ApplicationController
  def show
    @vision_boards = current_user.vision_boards
    @upload = Upload.new
  end

  def edit

  end

  def update

  end
end

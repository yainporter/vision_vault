class UsersController < ApplicationController
  def show
    @vision_boards = current_user.vision_boards
  end

  def edit

  end

  def update

  end
end

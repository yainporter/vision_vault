class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def invalid_record(error)
    flash[:error] = error.message
    redirect_to new_vision_board_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

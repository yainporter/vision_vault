class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
before_action :authenticate_user!

  def invalid_record(error)
    flash.now[:error] = error.message
    redirect_to dashboard_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

class ApplicationController < ActionController::Base
  include Pagy::Backend
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_object
  before_action :authenticate_user!

  def invalid_record(error)
    flash[:error] = error.message
    redirect_to dashboard_path
  end

  def invalid_object
    flash[:error] = "Error, doesn't exist. Try again"
    redirect_to dashboard_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

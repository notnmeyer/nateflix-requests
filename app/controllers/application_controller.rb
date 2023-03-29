class ApplicationController < ActionController::Base
  def authenticate_user!
    return if admin_signed_in?
    super
  end
end

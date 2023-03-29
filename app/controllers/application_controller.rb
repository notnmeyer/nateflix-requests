class ApplicationController < ActionController::Base
  def current_user
    return current_admin if admin_signed_in?

    super
  end

  def authenticate_user!
    return if admin_signed_in?

    super
  end
end

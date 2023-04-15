class ApplicationController < ActionController::Base
  def check_admin
    return if current_user.admin?

    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(root_path)
  end
end

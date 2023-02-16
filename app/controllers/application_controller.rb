class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
  helper_method :admin?
  helper_method :writer?
  helper_method :reviewer?
  def admin?
    current_user && current_user.role == "admin"
  end
  def writer?
    current_user && current_user.role == "writer"
  end
  def reviewer?
    current_user && current_user.role == "reviewer"
  end

end

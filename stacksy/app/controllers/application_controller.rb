class ApplicationController < ActionController::Base
  protect_from_forgery

  
  private
  helper_method :home_page_based_on_role
  def home_page_based_on_role
    if current_user.role == "admin"
      users_path
    elsif current_user.role == "new"
      current_user.update_attributes(role: "basic")
      user_interest_sign_up_path(current_user)
    else
      user_home_path(current_user)
    end
  end

  before_filter :authenticate_user!

  protected
  def after_sign_in_path_for(resource)
    home_page_based_on_role
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_membership_path , alert: "You can't access this page. Upgrade your Membership for more privileges."
  end



  # def after_sign_up_path_for(resource)
  #   '/users/:id/interests'
  # end

end

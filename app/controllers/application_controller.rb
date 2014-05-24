class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_home_path(current_user), notice: "You can't access that page. Perhaps you should upgrade your membership."
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to user_home_path(current_user), notice: "Whoops! That record does not appear to exist."
  end

  
  private
  helper_method :home_page_based_on_role
  def home_page_based_on_role
    if current_user.role == "admin"
      users_path
    elsif current_user.role == "new"
      current_user.update_attributes(role: "basic")
      user_gender_zipcode_sign_up_path(current_user)
    else
      user_home_path(current_user)
    end
  end

  before_filter :authenticate_user!

  protected
  def after_sign_in_path_for(resource)
    home_page_based_on_role
  end


end

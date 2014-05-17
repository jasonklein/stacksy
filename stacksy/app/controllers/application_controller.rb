class ApplicationController < ActionController::Base
  protect_from_forgery
  
private
  helper_method :home_page_based_on_role
  def home_page_based_on_role
    if current_user.role == "admin"
      render "users/index"
    else
      render "users/show"
    end
  end

end

class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    data = request.env["omniauth.auth"]
    user = User.from_omniauth(data)
    if user.persisted?
      if !user.profile
        user_profile = Profile.new(image_1: data.info.image, fb_interests: data.info.interests, user_id: user.id)
        user_profile.save
      end

      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end    
  end
end

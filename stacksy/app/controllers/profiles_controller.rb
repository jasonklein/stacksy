class ProfilesController < ApplicationController
 
  def show
    @user = User.find(current_user.id) 
    @profile = @user.profile
    if @profile.user != current_user
      @profile.add_track(current_user)
    end
  end

  def edit
  end

  def update
  end

end
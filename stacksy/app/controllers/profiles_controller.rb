class ProfilesController < ApplicationController

  
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    if @user != current_user
      @profile.add_track(current_user)
    end
  end

  def edit

  end

  def update
  end

end
class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    if @profile.user != current_user
      @profile.add_track(current_user)
    end
  end

  def edit
  end

  def update
  end

end
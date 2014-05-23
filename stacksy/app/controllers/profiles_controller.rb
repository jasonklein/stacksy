class ProfilesController < ApplicationController

  
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    if @user != current_user
      @profile.add_track(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
    @profile = @user.profile 
    @genders = Gender.all
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to profile_path(current_user), notice: "Updated."
    else
      render 'edit'
    end
  end

end
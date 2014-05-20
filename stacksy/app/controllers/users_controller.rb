class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result  
  end

  def search
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def home
    @users = User.all
    
  end

  def interests
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to user_home_path, notice: 'Your preferences were succesfully saved!'}
        format.json {head :no_content}
      else
        format.html{render action: "edit"}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end







end
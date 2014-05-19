class UsersController < ApplicationController

  def index
      
  end

  def search

  end

  def home
    @users = User.all
    
  end







end
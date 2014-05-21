class PingsController < ApplicationController
  def index
    @pings = current_user.pings
  end

  def create
    @ping = Ping.new
    @ping.pinged_id = (params[:user_id])
    @ping.pinger_id = current_user.id  

    respond_to do |format|
      if @ping.save
        format.js 
        format.html { redirect_to user_home_path(current_user), notice: 'You have pinged #{@ping.pinged.name}. Sweet!' }
        format.json { render json: @ping, status: :created, location: @ping }
      else
        format.js 
        format.html { render action: "new" }
        format.json { render json: @ping.errors, status: :unprocessable_entity }
      end
    end
  end


end
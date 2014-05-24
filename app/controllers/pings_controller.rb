class PingsController < ApplicationController

  authorize_resource :user
  authorize_resource :ping, through: :user
  
  def index
    current_user.mark_unviewed_pings_viewed
    @sent_pings = current_user.sent_pings.sent_pings_list
    @received_pings = current_user.received_pings.received_pings_list     
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


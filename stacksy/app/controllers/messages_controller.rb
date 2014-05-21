class MessagesController < ApplicationController
  authorize_resource :user 
  authorize_resource :message, through: :user
  
  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json {render json: @message}
    end
  end

  def create

    @message = Message.new(params[:message])
    @message.recipient_id = params[:recipient_id]
    @message.recipient_name = @message.recipient.name
    @message.sender_id = current_user.id
    @message.sender_name = current_user.name


    @messages = current_user.messages

    respond_to do |format|
      if @message.save
        format.js 
        format.html { redirect_to user_home_path(current_user), notice: 'Sent to #{@message.recipient.name}. Sweet!' }
        # format.json { render json: @message, status: :created, location: @message }
      else
        format.js 
        format.html { render action: "new" }
        # format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.remove_current_user_or_destroy(current_user)

    redirect_to user_messages_path(current_user), notice: "Message deleted."
  end



  

end
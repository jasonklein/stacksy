class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json {render json: @message}
    end
  end

  def create
    binding.pry

  end

  

end
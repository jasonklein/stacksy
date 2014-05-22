class TracksController < ApplicationController
  authorize_resource 

  def index
    @sent_tracks = current_user.sent_tracks
    @received_tracks = current_user.received_tracks
  end

end

class TracksController < ApplicationController
  def tracker_index
    @sent_tracks = current_user.sent_tracks
  end

  def tracked_index
    @received_tracks = current_user.received_tracks
  end
end

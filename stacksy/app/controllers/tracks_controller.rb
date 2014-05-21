class TracksController < ApplicationController
  def tracker_index
    @tracks = current_user.sent_tracks
  end

  def tracked_index
    @tracks = current_user.received_tracks
  end
end

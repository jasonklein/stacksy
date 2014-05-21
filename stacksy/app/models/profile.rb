class Profile < ActiveRecord::Base
  attr_accessible :fav_characters, :fav_places, :fav_spots, :fb_interests, :flags, :guilty_pleasure, :icon, :image_1, :image_2, :image_3, :image_4, :image_5, :interests, :link, :occupation, :quip, :user_id

  belongs_to :user

  def add_track(tracker)
    track = Track.new(tracker_id: tracker.id, tracked_id: self.user.id)
    track.save!
  end


end

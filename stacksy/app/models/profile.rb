class Profile < ActiveRecord::Base
  attr_accessible :fav_characters, :fav_places, :fav_spots, :fb_interests, :flags, :guilty_pleasure, :icon, :image_1, :image_2, :image_3, :image_4, :image_5, :interests, :link, :occupation, :quip, :user_id, :industry, :why_tech, :stack

  belongs_to :user

  def add_track(tracker)
    track = Track.new(tracker_id: tracker.id, tracked_id: self.user.id)
    track.save!
  end

  def images
    images = []
    if self.image_1
      images << self.image_1
    end
    if self.image_2
      images << self.image_2
    end
    if self.image_3
      images << self.image_3
    end
    if self.image_4
      images << self.image_4
    end
    if self.image_5
      images << self.image_5
    end
    images
  end



end

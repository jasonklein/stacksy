class Track < ActiveRecord::Base
  belongs_to :tracker, class_name: "User"
  belongs_to :tracked, class_name: "User"
  
  attr_accessible :tracker_id, :tracked_id
  
end

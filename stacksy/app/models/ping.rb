class Ping < ActiveRecord::Base
  attr_accessible :ping_type, :pinged_id, :pinger_id

  belongs_to :pinger, class_name: "User"
  belongs_to :pinged, class_name: "User"


end

class Ping < ActiveRecord::Base
  attr_accessible :ping_type, :pinged_id, :pinger_id

  belongs_to :pinger, class_name: "User"
  has_one :pinged, class_name: "User"

  accepts_nested_attributes_For :pinger
end

class Ping < ActiveRecord::Base
  attr_accessible :ping_type, :pinged_id, :pinger_id

  belongs_to :pinger, class_name: "User"
  belongs_to :pinged, class_name: "User"


scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }


scope :sent_pings_list, order("pinged_id, created_at").group(:pinged_id)


scope :received_pings_list, order("pinger_id, created_at").group(:pinger_id)



end

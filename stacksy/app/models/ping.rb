class Ping < ActiveRecord::Base
  attr_accessible :ping_type, :pinged_id, :pinger_id
end

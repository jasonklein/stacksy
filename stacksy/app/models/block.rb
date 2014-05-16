class Block < ActiveRecord::Base
  attr_accessible :blocked_id, :blocker_id
end

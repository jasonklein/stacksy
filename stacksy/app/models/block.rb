class Block < ActiveRecord::Base
  attr_accessible :blocked_id, :blocker_id

  belongs_to :blocker, class_name: "User"
  has_one :blocked, class_name: "User"

  accepts_nested_attributes_For :blocker

end

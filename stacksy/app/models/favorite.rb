class Favorite < ActiveRecord::Base
  attr_accessible :favorited_id, :favoriter_id

  belongs_to :favoriter, class_name: "User"
  has_one :favorited, class_name: "User"

  accepts_nested_attributes_For :favoriter
end

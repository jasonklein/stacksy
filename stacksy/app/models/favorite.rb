class Favorite < ActiveRecord::Base
  attr_accessible :favorited_id, :favoriter_id

  belongs_to :favoriter, class_name: "User"
  belongs_to :favorited, class_name: "User"

  
end

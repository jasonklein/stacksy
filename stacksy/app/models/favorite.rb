class Favorite < ActiveRecord::Base
  attr_accessible :favorited_id, :favoriter_id
end

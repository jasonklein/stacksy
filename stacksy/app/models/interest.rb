class Interest < ActiveRecord::Base
  attr_accessible :gender_id, :user_id

  belongs_to :user
  belongs_to :gender
end





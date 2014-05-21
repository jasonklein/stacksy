class Interest < ActiveRecord::Base
  attr_accessible :gender_interested_in_id, :person_interested_id


  belongs_to :person_interested, class_name "User"
  belongs_to :gender_interested_in, class_name "Gender"
end

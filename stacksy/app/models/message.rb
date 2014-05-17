class Message < ActiveRecord::Base
  attr_accessible :content, :recepient_id, :sender_id

  belongs_to :sender, class_name: "User"
  belongs_to :recepient, class_name: "User"


end

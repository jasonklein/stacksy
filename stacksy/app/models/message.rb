class Message < ActiveRecord::Base
  attr_accessible :content, :recepient_id, :sender_id

  belongs_to :sender, class_name: "User"
  has_one :recepient

  accepts_nested_attributes_for :sender
end

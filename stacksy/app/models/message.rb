class Message < ActiveRecord::Base
  attr_accessible :content, :recepient_id, :sender_id
end

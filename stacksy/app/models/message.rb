class Message < ActiveRecord::Base
  attr_accessible :content, :recipient_id, :sender_id

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :content, presence: true

  default_scope order('created_at DESC')


end

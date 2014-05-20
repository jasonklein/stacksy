class Message < ActiveRecord::Base
  attr_accessible :content, :recipient_id, :sender_id

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :content, presence: true

  default_scope order('created_at DESC')

  def date
    self.created_at.strftime('%d %b %y')
  end

  def new_since_last_login?(user)
    self.created_at > user.last_sign_in_at
  end

  


end

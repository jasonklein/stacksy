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

  def recipient_is_current_user?(user)
    self.recipient == user
  end

  def classname_for_user(user)
    if recipient_is_current_user?(user)
      self.new_since_last_login?(user) ? 'warning' : 'info'
    end
  end

  def ids
    ids_array = []
    ids_array << self.sender_id
    ids_array << self.recipient_id
    ids_array
  end

  def remove_current_user_or_destroy(user)
    if self.ids.include?(0)
      self.destroy
    else
      if self.sender_id == user.id
        self.update_attributes(sender_id: 0)
      else
        self.update_attributes(recipient_id: 0)
      end
    end
  end

  
end

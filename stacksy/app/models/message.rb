class Message < ActiveRecord::Base
  attr_accessible :content, :recipient_id, :sender_id

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :content, presence: true

  #default_scope order('created_at DESC')

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

  def set_recipient_and_render_reply_partial(user)
    if recipient_is_current_user?(user)
      "render partial: 'reply', locals: {recipient: message.sender}"
    else
      "render partial: 'reply', locals: {recipient: current_user}"
    end
  end

  
end

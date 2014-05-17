class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :age, :gender, :location, :name, :other, :relationship_status, :role, :user_id

  has_one :profile, dependent: :destroy
  has_many :interests, dependent: :destroy

  has_many :messages, foreign_key: "sender_id"
  has_many :messages, foreign_key: "recipient_id"

  has_many :pings, foreign_key: "pinger_id"
  has_many :pings, foreign_key: "pinged_id"

  has_many :favorites, foreign_key: "favoriter_id", dependent: :destroy
  
  has_many :blocks, foreign_key: "blocker_id", dependent: :destroy
   has_many :blocks, foreign_key: "blocked_id", dependent: :destroy

  def self.from_omniauth(auth)
    raise
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.email = auth.info.email
        user.location = auth.info.location
        user.gender = auth.extra.raw_info.gender    
        user.birthday = auth.extra.raw_info.birthday
      end
    end
  end
  
end




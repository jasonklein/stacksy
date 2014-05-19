class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :age, :gender_id, :location, :name, :other, :relationship_status, :role, :profile_attributes

  has_one :profile, dependent: :destroy
  belongs_to :gender
  has_many :interests, dependent: :destroy

  has_many :messages, foreign_key: "sender_id"
  has_many :messages, foreign_key: "recipient_id"

  has_many :pings, foreign_key: "pinger_id"
  has_many :pings, foreign_key: "pinged_id"

  has_many :favorites, foreign_key: "favoriter_id", dependent: :destroy
  
  has_many :blocks, foreign_key: "blocker_id", dependent: :destroy
  has_many :blocks, foreign_key: "blocked_id", dependent: :destroy

  accepts_nested_attributes_for :profile

  def self.from_omniauth(data)
    
    if user = User.find_by_email(data.info.email)
      user.provider = data.provider
      user.uid = data.uid
      user
    else
      where(data.slice(:provider, :uid)).first_or_create do |user|
        user.provider = data.provider
        user.uid = data.uid
        user.password = Devise.friendly_token[0,20]
        user.name = data.info.name
        user.email = data.info.email
        if data.info.location?  
          user.location = data.info.location
        else
          user.location = "London"
        end

        gender = data.extra.raw_info.gender

        case gender
        when 'male'
          user.gender_id = 1
        when 'female'
          user.gender_id = 2
        else
          user.gender_id = 5
        end     
        
        birthday = data.extra.raw_info.birthday
        user.birthday = Date.strptime(birthday, '%m/%d/%Y')
        user.role = "new"
      end
    end
  end

  
end




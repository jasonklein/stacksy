class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :age, :gender_id, :location, :name, :other, :relationship_status, :role, :profile_attributes, :sent_messages_attributes, :received_messages_attributes, :zipcode, :latitude, :location, :longitude, :gender_interest_ids


  geocoded_by :address
  after_validation :geocode

  has_one :profile, dependent: :destroy
  belongs_to :gender

  has_many :interests
  has_many :gender_interests, through: :interests, source: :gender

  has_many :sent_messages, class_name: 'Message', foreign_key: "sender_id"
  has_many :received_messages, class_name: 'Message', foreign_key: "recipient_id"

  has_many :sent_pings, class_name: 'Ping', foreign_key: "pinger_id", dependent: :destroy
  has_many :received_pings, class_name: 'Ping', foreign_key: "pinged_id", dependent: :destroy
  
  has_many :sent_blocks, class_name: 'Block', foreign_key: "blocker_id", dependent: :destroy
  has_many :received_blocks, class_name: 'Block', foreign_key: "blocked_id", dependent: :destroy

  has_many :sent_tracks, class_name: 'Track', foreign_key: "tracker_id", dependent: :destroy
  has_many :received_tracks, class_name: 'Track', foreign_key: "tracked_id", dependent: :destroy

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :sent_messages
  accepts_nested_attributes_for :received_messages


  ### For Facebook Test Users profile images

  def men
    ["http://www.india-forums.com/images/celebrity/m_10046.jpg", "http://ezinearticles.com/members/mem_pics/Mike-Budhani_1276433.jpg", "http://www.hairstylesdb.com/wp-content/uploads/2014/04/short-hairstyles-for-asian-guy-150x150.jpg", "http://www.hairstyle-medium.com/wp-content/uploads/2014/02/asian-men-short-hairstyle-772-150x150.jpg", "http://www.cruzine.com/wp-content/uploads/2012/03/008-bw-portrait-photography-150x150.jpg", "http://blackhaircuts2014.com/wp-content/uploads/2013/10/hairstyles-for-thick-hair-men-2013-150x150.jpg", "http://www.lifenfashion.com/wp-content/uploads/2014/05/Top-Actor-and-Model-Azfar-Rehman-Biography-9-150x150.jpg", "http://thenordiccountries.com/wp-content/uploads/2012/12/The-Nordic-Countries-Norwegian-actor-Aksel-Hennie-150x150.jpeg"]
  end

  def women
    ["http://www.moviepics99.com/wp-content/uploads/2014/04/Cute-Smiling-Shraddha-Kapoor-in-Aashiqui-2-wallpapers-150x150.jpg", "http://i2.wp.com/www.moviepics99.com/wp-content/uploads/2014/04/Nagababu-daughter-tollywood-entry-150x150.jpg?resize=150%2C150", "http://www.minorityperspective.co.uk/wp-content/uploads/2010/05/SHABANA-CUT-OUT-150x150.jpg", "http://leadsupport.net/wp-content/uploads/2014/05/asian-female-1-150x150.jpg", "http://www.djssa.com/wp-content/uploads/2013/08/BOITUMELO-MAOHUNYE-3-150x150.jpg", "http://www.talkingdrum-entertainment.com/wp-content/uploads/2014/01/Ava-DuVernay1-150x150.jpg", "http://3i26kd3p1usa3cefqi1ay96t13o6.wpengine.netdna-cdn.com/wp-content/uploads/2013/12/bresha-webb1-150x150.jpg", "http://www.michaelwharley.com/wp-content/uploads/2012/12/headshot-headshots-actor-headshots-actors-headshots-london-michael-wharely-156-150x150.jpg", "http://www.wharleywords.co.uk/wp-content/uploads/2013/02/headshot-headshots-actor-headshots-actors-headshots-london-michael-wharely-175-150x150.jpg"]
  end

  def set_user_image(facebook_image)
    case self.gender_id
    when 1
      men.sample
    when 2
      women.sample
    else
      facebook_image
    end
  end

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
          user.location = "London, England"
        end

        gender = data.extra.raw_info.gender
        if gender == 'male'
          user.gender_id = 1
        elsif gender == 'female'
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


  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def messages
    sent_ids = Message.where(sender_id: self.id, sender_readability: true)
    received_ids = Message.where(recipient_id: self.id, recipient_readability: true)
    ids = sent_ids + received_ids
    Message.where(id: ids)
  end

  def unviewed_messages
    self.received_messages.unviewed
  end

  def mark_unviewed_messages_viewed
    self.unviewed_messages.each do |message|
      message.update_attributes(viewed: true)
    end
  end

  def pings
    pinged_ids = Ping.where(pinged_id: self.id)
    pinger_ids = Ping.where(pinger_id: self.id)
    ids = pinged_ids + pinger_ids
    Ping.where(id: ids)
  end

  def unviewed_pings
    self.received_pings.unviewed
  end

  def mark_unviewed_pings_viewed
    self.unviewed_pings.each do |ping|
      ping.update_attributes(viewed: true)
    end
  end

  def role?(role)
    self.role.to_s == role.to_s
  end

  def address
    if zipcode
      zipcode + " " + location
    else
      location
    end
  end
  
  scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }


  scope :people_who_would_be_interested_in_me, lambda {|current_user| select{|user| user.gender_interest_ids.include? current_user.gender_id}}

  # scope :people_i_would_be_interested_in, lambda { where(current_user.gender_interest_ids.include? :gender_id)}

  scope :people_i_would_be_interested_in, lambda {|current_user| where(current_user.gender_interest_ids.include? :gender_id)}

  

end




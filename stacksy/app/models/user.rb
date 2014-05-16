class User < ActiveRecord::Base
  attr_accessible :age, :gender, :location, :name, :other, :relationship_status, :role, :user_id

  has_one :profile, dependent: :destroy
  has_many :interests

  has_many :messages, foreign_key "sender_id"
  has_many :favorites, foreign_key "favoriter_id"
  has_many :blocks, foreign_key "blocker_id"
  has_many :pings, foreign_key "pinger_id"
end




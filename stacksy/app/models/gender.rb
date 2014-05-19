class Gender < ActiveRecord::Base
  attr_accessible :type

  has_many :users
  has_many :interests
end

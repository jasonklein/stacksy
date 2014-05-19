class Gender < ActiveRecord::Base
  attr_accessible :title

  has_many :users
  has_many :interests
end

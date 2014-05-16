class User < ActiveRecord::Base
  attr_accessible :age, :gender, :location, :name, :other, :relationship_status, :role, :user_id
end



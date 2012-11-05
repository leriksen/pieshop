class UserType < ActiveRecord::Base
  attr_accessible :level, :typename

  validates_uniqueness_of :typename
<<<<<<< HEAD
  validates_presence_of [:typename, :level]
=======
  validates_presence_of :level
>>>>>>> master
end

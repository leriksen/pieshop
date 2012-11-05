class UserType < ActiveRecord::Base
  attr_accessible :level, :typename

  validates_uniqueness_of :typename
  validates_presence_of :typename, :level
end

class UserType < ActiveRecord::Base
  attr_accessible :level, :typename

  validates_uniqueness_of :typename
  validates_presence_of :typename, :level

  def typename=(new_typename)
    write_attribute(:typename, new_typename.to_sym)
  end

  def is_admin?
    typename == :admin
  end
end

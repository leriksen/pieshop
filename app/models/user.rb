require 'permissions'

class User < ActiveRecord::Base
  has_secure_password

  belongs_to :user_type
  attr_accessible :email, :password, :password_confirmation, :role

  validates_uniqueness_of :email

  def role
    p = read_attribute(:role)
    Permissions.new(p)
  end

  def role=(role)
    p = Permissions.new(role)
    write_attribute(:role, p.to_i)
  end
end

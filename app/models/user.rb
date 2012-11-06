class User < ActiveRecord::Base
  has_secure_password

  belongs_to :user_type
  attr_accessible :email, :password, :password_confirmation, :user_type_id
  accepts_nested_attributes_for :user_type, :allow_destroy => true

  validates_uniqueness_of :email
end

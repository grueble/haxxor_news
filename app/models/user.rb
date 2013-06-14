class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  validates :username, :presence => true, :uniqueness => true, :length => { maximum: 50 }
  validates :password, :presence => true
  
  has_secure_password
end

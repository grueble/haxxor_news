class User < ActiveRecord::Base
  attr_accessible :username, :password

  validates :username, :presence => true, :uniqueness => true, :length => { maximum: 50 }
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  
  has_secure_password
end

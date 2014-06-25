class User < ActiveRecord::Base

  include BCrypt

  has_many :comments
  has_many :votes

  has_secure_password
end

class User < ActiveRecord::Base

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create

  include BCrypt

  has_many :comments
  has_many :votes

  has_secure_password
end

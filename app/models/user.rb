class User < ActiveRecord::Base


  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create

  include BCrypt

  has_many :comments, dependent: :destroy
  has_many :votes

  has_secure_password
  acts_as_voter
end

class Politician < ActiveRecord::Base
  has_many :comments
end

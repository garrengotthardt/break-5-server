class User < ApplicationRecord
  has_many :user_places
  has_many :places, through: :user_places
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
end

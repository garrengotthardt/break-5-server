class User < ApplicationRecord
  has_many :user_places
  has_many :places, through: :user_places
  has_secure_password
end

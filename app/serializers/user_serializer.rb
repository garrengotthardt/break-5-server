class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :address, :lat, :long
  has_many :places, through: :user_places
end

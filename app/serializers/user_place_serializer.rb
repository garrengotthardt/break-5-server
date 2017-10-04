class UserPlaceSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :user_id
  belongs_to :user
  has_many :places
end

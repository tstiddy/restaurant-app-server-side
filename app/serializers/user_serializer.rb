class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :firstname, :lastname, :favoriteIds

  has_many :bookings
  def favoriteIds
    object.favorites.map do |favorite|
      favorite.restaurant_id
    end
  end
end

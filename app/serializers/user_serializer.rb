class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :favoriteIds

  def favoriteIds
    object.favorites.map do |favorite|
      favorite.restaurant_id
    end
  end
end

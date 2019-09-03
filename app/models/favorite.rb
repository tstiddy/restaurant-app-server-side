class Favorite < ApplicationRecord
  belongs_to :user

  validates :restaurant_id, :presence => true, :uniqueness => true
end

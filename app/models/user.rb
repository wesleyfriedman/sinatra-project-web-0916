class User < ActiveRecord::Base
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants

  def favorite_restaurants
  	restaurant_ids = UserRestaurant.where(favorites: true, user_id: self.id).pluck(:restaurant_id)
  	Restaurant.where(id: restaurant_ids)
  end
end
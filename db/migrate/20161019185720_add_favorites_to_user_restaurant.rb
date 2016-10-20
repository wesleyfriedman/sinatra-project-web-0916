class AddFavoritesToUserRestaurant < ActiveRecord::Migration
  def change
    add_column :user_restaurants, :favorites, :boolean
  end
end

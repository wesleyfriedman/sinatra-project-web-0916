class AddFavoritesToUserRestaurant < ActiveRecord::Migration
  def change
    add_column :user_restaurants, :favorites, :integer
  end
end

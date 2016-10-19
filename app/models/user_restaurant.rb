# user_id
# restaurant_id

class UserRestaurant < ActiveRecord::Base
  # attr_accessor(columns)
  belongs_to :user
  belongs_to :restaurant

  # def favorites=(favorite)
  #   if favorite == 'favorite'
  #     @favorites = true
  #   else
  #     @favorites = false
  #   end
  # end
end
# params[:user] = {user_id: 1, restaurant_id: 2, favorite: 'favorite'}
# UserRestaurant.create(params[:user])

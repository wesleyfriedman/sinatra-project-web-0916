class UsersController<ApplicationController

    get '/users' do
        @users = User.all
        erb :'/users/index'
    end

    get '/users/new' do
        erb :'/users/new'
    end

    post '/users' do
        @user = User.create(params)
        redirect to "/users/#{@user.id}"
    end


    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'/users/edit'
    end

    patch '/users/:id' do
        @user = User.find(params[:id])
        @user.update(params[:user])
        redirect to "/users/#{@user.id}"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    delete '/users/:id/delete' do
        User.delete(params[:id])
        redirect to '/users'
    end

    post '/users/:id/add_restaurant' do
        user = User.find(params[:id])
        if params["favorite"] == "favorite" || params["try"] == "try"
            user_restaurant = UserRestaurant.find_or_create_by(user_id: user.id, restaurant_id: params[:restaurant_id])
        end
        if params["favorite"] == "favorite"
            user_restaurant.favorites = true
            user_restaurant.save
        end
        redirect to "/users/#{user.id}"
    end

    post '/users/:id/remove_try' do
        user = User.find(params[:id])
        urs = UserRestaurant.where(user_id: user.id, restaurant_id: params[:restaurant_id])
        urs.destroy_all
        redirect to "/users/#{user.id}"
    end

    post '/users/:id/remove_favorite' do
        user = User.find(params[:id])
        urs = UserRestaurant.where(user_id: user.id, restaurant_id: params[:restaurant_id])
        urs.update_all(favorites: false)
        redirect to "/users/#{user.id}"
    end
end

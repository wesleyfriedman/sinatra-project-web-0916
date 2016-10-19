# class UsersController<ApplicationController
#     get '/users' do
#         @users = User.all
#         erb :'/users/index'
#     end
#     get '/users/new' do
#         erb :'/users/new'
#     end
#     post '/users' do
#         @user = User.create(params)
#         redirect to "/users/#{@user.id}"
#     end
#     post '/users/:id' do
#         @user = User.find(params[:id])
#         @restaurant = Restaurant.find(params[:users][:restaurant_id])
#         @user.restaurants << @restaurant
#         redirect to "/users/#{@user.id}"
#     end
#     get '/users/:id/edit' do
#         @user = User.find(params[:id])
#         erb :'/users/edit'
#     end
#     patch '/users/:id' do
#         @user = User.find(params[:id])
#         @user.update(params[:user])
#         @user.save
#         # insert flash message if we want
#         redirect to "/users/#{@user.id}"
#     end
#     get '/users/:id' do
#         @user = User.find(params[:id])
#         erb :'/users/show'
#     end
#     delete '/users/:id/delete' do
#         User.delete(params[:id])
#         redirect to '/users'
#     end
# end

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
    post '/users/:id' do
      binding.pry
        @user = User.find(params[:id])
        @restaurant = Restaurant.find(params[:users][:restaurant_id])
        @user.restaurants << @restaurant
        redirect to "/users/#{@user.id}"
    end
    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'/users/edit'
    end
    patch '/users/:id' do
        @user = User.find(params[:id])
        @user.update(params[:user])
        # @user.save
        # insert flash message if we want
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
end

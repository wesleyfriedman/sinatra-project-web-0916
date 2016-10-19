class RestaurantsController < ApplicationController

  get '/restaurants' do
    if params[:location] || params[:term]
      @restaurants = Restaurant.search(location: params[:location], term: params[:term])
    else
      @restaurants = Restaurant.all
    end
    erb :'/restaurants/index'
  end

  get '/restaurants/new' do
    erb :'/restaurants/new'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params)
    redirect to "/restaurants/#{@restaurant.id}"
  end

  post '/restaurants/:id' do
    # binding.pry
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:restaurants][:user_id])
    @restaurant.users << @user
    redirect to "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/edit'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect to "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/show'
  end

  delete '/restaurants/:id/delete' do
    Restaurant.delete(params[:id])
    redirect to '/restaurants'
  end

end

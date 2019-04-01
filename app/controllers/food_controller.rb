class FoodsController < ApplicationController 

    get '/foods/new' do
      redirect_if_not_logged_in
      erb :'/foods/new'
    end
  
    post '/foods/new' do
      @user = current_user
      food = @user.foods.create(:name => params[:name], :quantity => params[:quantity], :price => params[:price])
      order = food.orders.create(:name => params[:orders][:name])
      redirect '/orders'
    end
  
    get '/foods/:id/edit' do
      redirect_if_not_logged_in
      @food = Food.find_by_id(params[:id])
      erb :'foods/edit'
    end
  
    patch '/foods/:id' do 
      @food = Food.find_by_id(params[:id])
      @food.name = params[:name]
      @food.quantity = params[:quantity]
      @food.price = params[:price]
      @food.save
      redirect '/orders'
    end
  
    get '/foods/:id/delete' do
      @food = Food.find_by_id(params[:id])
      erb :'foods/delete'
    end
  
    delete '/foods/:id' do 
      @food = Food.find_by_id(params[:id])
      @food.destroy
      redirect '/orders'
    end
  
  end
  
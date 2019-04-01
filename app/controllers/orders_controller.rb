class OrdersController < ApplicationController 

    get '/orders' do
      redirect_if_not_logged_in
      @user = current_user
      @foods = @user.foods
      erb :'orders/show'
    end
  
    get '/orders/new' do 
      redirect_if_not_logged_in
      @user = current_user
      @foods = Food.all
      erb :'/orders/new'
    end
  
    post '/orders/new' do
      Order.create(:name => params[:name], :food_id => params[:food_id])
      redirect '/orders'
    end
  
    get '/orders/new/:id' do
      redirect_if_not_logged_in
      @food = Food.find_by_id(params[:id])
      erb :'/orders/new_food'
    end
  
    post '/orders/new/:id' do
      @food = Food.find_by_id(params[:id])
      Order.create(:name => params[:name], :food_id => params[:id])
      redirect '/orders'
    end
  
    get '/orders/:id/edit' do
      @order = Order.find_by_id(params[:id])
      erb :'/orders/edit'
    end
  
    patch '/orders/:id' do
      @order = Order.find_by_id(params[:id])
      @order.name = params[:name]
      @order.save
      redirect '/orders'
    end
  
    get '/orders/:id/delete' do 
      @order = Order.find_by_id(params[:id])
      erb :'/orders/delete'
    end
  
    delete '/orders/:id' do 
      @order = Order.find_by_id(params[:id])
      @order.destroy
      redirect '/orders'
    end
  
  end
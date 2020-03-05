require 'byebug'

class OrdersController < ApplicationController
  def new
    if params[:location]
      session[:location_id] = params[:location][:id]
    end
    @location = Location.find_by_id(session[:location_id])
    @user_id = session[:user_id]
  end

  def show
  end

  def create
    user_id = session[:user_id]
    location_id = session[:location_id].to_i
    status = "received"
    total_price = session[user_id]["total"]
    order_number = Time.now.to_s + user_id.to_s
    @order = Order.create(user_id:user_id, 
      location_id:location_id, status:status, 
      total_price:total_price, order_number:order_number)
    redirect_to @order
  end

end

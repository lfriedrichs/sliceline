require 'byebug'

class OrdersController < ApplicationController
  def new
    if params[:location]
      session[:location_id] = params[:location][:id]
    end
    @location = Location.find_by_id(session[:location_id])
    @user_id = session[:user_id]
  end

  def update
    order_id = params[:id].to_i
    @order = Order.find_by_id(order_id)
    @order.status = "cancelled"
    @order.save
    redirect_to "/orders/#{@order.order_number}"
  end

  def show
    @order = Order.find_by(order_number: params[:id])
    if session[:user_id] != @order.user_id
      flash[:message] = "You do not have access to this order"
      redirect_to new_order_path 
    end 

  end

  def create
    user_id = session[:user_id]
    location_id = session[:location_id].to_i
    status = "received"
    total_price = session[user_id]["total"]
    order_number = Time.now.to_s.delete(': -') + user_id.to_s
    @order = Order.create(user_id:user_id, 
      location_id:location_id, status:status, 
      total_price:total_price, order_number:order_number)
    session[user_id]["cart"].each {|item_id, quantity| 
      Cart.create(item_id:item_id, quantity:quantity, 
      order_id:@order.id) 
    }
    session.delete user_id
    redirect_to "/orders/#{@order.order_number}"
  end

end

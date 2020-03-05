require 'byebug'
class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def destroy
      User.find_by_id(params[:id]).destroy
      flash[:message] = "You have successfully deleted your account"
    redirect_to '/'
  end

  def orders
    @user = User.find_by_id(params[:id])
    @orders = @user.orders
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, 
      :user_name, :password, :password_confirmation, :email, 
      :phone_number, :address_line_1, :address_line_2, :city, 
      :state, :zipcode)
  end

end

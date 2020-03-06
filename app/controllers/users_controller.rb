class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def new
    if session[:user]
      @user = User.new(session[:user])
      session.delete :user
    else
      @user = User.new
    end
  end

  def create
    session[:user] = {}
    auto_fill(session[:user])
    @user = User.create(user_params)
    if @user.errors
      flash[:message] = @user.errors.messages
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      session.delete :user
      redirect_to @user
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
      User.find_by_id(params[:id]).destroy
      flash[:message] = "You have successfully deleted your account"
    redirect_to '/'
  end

  def orders
    @user = User.find_by_id(params[:id].to_i)
    @orders = @user.orders
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, 
      :user_name, :password, :password_confirmation, :email, 
      :phone_number, :address_line_1, :address_line_2, :city, 
      :state, :zipcode)
  end

  def auto_fill(user)
    user[:first_name] = params[:user][:first_name]
    user[:last_name] = params[:user][:last_name]
    user[:user_name] = params[:user][:user_name]
    user[:email] = params[:user][:email]
    user[:phone_number] = params[:user][:phone_number]
    user[:address_line_1] = params[:user][:address_line_1]
    user[:address_line_2] = params[:user][:address_line_2]
    user[:city] = params[:user][:city]
    user[:state] = params[:user][:state]
    user[:zipcode] = params[:user][:zipcode]
  end

end

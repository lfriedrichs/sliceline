class SessionsController < ApplicationController

  def home
  end

  def new
  end

  def cart
    if params[:user_id] != session[:user_id].to_s
      redirect_to new_order_path
      flash[:meesage] = "You do not have access to this cart"
    end
    @user = User.find_by_id(params[:user_id])
  end

  def remove
    item_id = params[:item_id]
    user_id = params[:user_id]
    if session[:user_id] == user_id.to_i
      if session[user_id]["cart"][item_id]
        session[user_id]["cart"][item_id] -= 1
      else 
        session[user_id]["cart"].delete item_id
      end
      session[user_id]["total"] -= Item.find_by_id(item_id.to_i).price
    end
    if session[user_id]["total"] == 0
      session.delete user_id
      redirect_to new_order_path
    else
      redirect_to "/sessions/#{user_id}/cart"
    end
  end

  def add
    item_id = params[:item_id]
    user_id = params[:user_id]
    if session[:user_id] == user_id.to_i
      session[user_id] ||= {"cart" => {}}
      if session[user_id]["cart"][item_id]
        session[user_id]["cart"][item_id] += 1
      else 
        session[user_id]["cart"][item_id] = 1
      end
      session[user_id]["total"] ||= 0.0
      session[user_id]["total"] += Item.find_by_id(item_id.to_i).price
    end
    redirect_to new_order_path
  end

  def create
    @user = User.find_by(user_name: session_params[:user_name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      if session_params[:user_name] == ""
        flash[:message] = "please enter a username"
      elsif session_params[:password] == ""
        flash[:message] = "please enter a password"
        flash[:user_name] = session_params[:user_name]
      else  
        flash[:message] = "We cannot find an account with this username and password"
        flash[:user_name] = session_params[:user_name]
      end 
      redirect_to '/login' 
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def session_params
    params.require(:user).permit(:user_name, :password)
  end

end

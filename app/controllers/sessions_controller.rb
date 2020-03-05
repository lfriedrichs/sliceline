class SessionsController < ApplicationController

  def home
  end

  def new
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
    session.delete params[:id]
    redirect_to '/'
  end

  private

  def session_params
    params.require(:user).permit(:user_name, :password)
  end

end

class SessionsController < ApplicationController

  def home
  end

  def new
    if session.include? :user_id
      redirect_to '/users/:id'
    end
  end

  def create
    session[:user_id] = params[:user_id]
    redirect_to '/users/:id'
  end

  def destroy
    session.delete params[:id]
    redirect_to '/'
  end

end

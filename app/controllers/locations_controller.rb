class LocationsController < ApplicationController
    
    def index
        @user = User.find_by_id(session[:user_id])
        @locations = Location.all
    end
  
  end
  
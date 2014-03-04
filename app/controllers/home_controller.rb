class HomeController < ApplicationController

  def index	  	
    if current_user.nil? 
      render 'home/index' 
    else
      @messages = current_user.recent_messages
      @objects = current_user.rooms
      render 'home/account' 
    end
  end

  def workspace 
    render 'home/workspace'
  end

end

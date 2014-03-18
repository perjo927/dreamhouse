class HomeController < ApplicationController

  def index	  	
    if current_user.nil? 
      render 'home/index' 
    else
      @messages = current_user.recent_messages.limit 5
      @objects = current_user.rooms.limit 5
      render 'home/account' 
    end
  end

  def workspace
    @messages = current_user.recent_messages
    @objects = current_user.rooms 
    render 'home/workspace'
  end

  def bathrooms

    @rooms = Room.all
    unless current_user.nil?
      @messages = current_user.recent_messages
      @objects = current_user.rooms 
    end
    render 'home/bathrooms'
  end

end

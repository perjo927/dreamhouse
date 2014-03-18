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
    @messages = current_user.recent_messages
    @objects = current_user.rooms 
    render 'home/workspace'
  end

  def bathrooms
    logger.info "@"*100
    @rooms = Room.all
    logger.info "#"*100
    logger.info(@rooms.inspect+"room")
    render 'home/bathrooms'
  end

end

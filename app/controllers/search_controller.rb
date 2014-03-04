class SearchController < ApplicationController
  def newsearch
    @rooms = Room.all.limit(3)
    

    unless current_user.nil? 
	    @messages = current_user.messages
	    @objects = current_user.rooms
    end
    render 'search/results'
  end

end

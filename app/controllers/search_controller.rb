class SearchController < ApplicationController
  def newsearch
    @rooms = Room.all.limit(3)
    @objects = current_user.rooms
    @messages = current_user.messages
    render 'search/results'
  end

end

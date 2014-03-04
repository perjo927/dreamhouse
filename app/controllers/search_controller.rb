class SearchController < ApplicationController
  def newsearch
    @rooms = Room.all.limit(3)
    render 'search/results'
  end

end

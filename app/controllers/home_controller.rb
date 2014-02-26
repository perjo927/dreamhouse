class HomeController < ApplicationController

  def index	  	
    if current_user.nil? 
    	render 'home/index' 
    else
    	render 'home/account' 
    end
  end

  def workspace 
  	render 'home/workspace'
  end

end

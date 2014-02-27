module ApplicationHelper

def current_user
	User.find(session[:user_id])
end

  def current_user=(u)
    session[:user_id] = u.id
  end

end

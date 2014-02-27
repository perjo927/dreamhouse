class RoomController < ApplicationController
  def save
    id = params[:id]
    if current_user
      room = Room.find(id)
      room.user_id = current_user.id
      room.save

      redirect_to :root
    else
      redirect_to "/user/register/#{id}"
    end


  end
end

class HantverkareController < ApplicationController
  def showmessage
    @messages = current_user.messages
    @objects = current_user.rooms
    render 'hantverkare/showmessage'
  end
  def show
    @messages = current_user.messages
    @objects = current_user.rooms
    render 'hantverkare/show'
  end
  def message
    @messages = current_user.messages
    @objects = current_user.rooms
    render 'hantverkare/sendmessage'
  end
  def sendmessage
      @message = Message.create(:title=>params[:title], :message=>params[:message], :read => false, :user_id => current_user.id)

      render :json=>
                 {
                     :status=> 'ok',

                 },
             :status => '200'

    end
  end

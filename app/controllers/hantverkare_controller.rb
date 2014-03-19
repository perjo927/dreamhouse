class HantverkareController < ApplicationController
  def showmessage
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'hantverkare/showmessage'
  end
  def show
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'hantverkare/show'
  end
  def message
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'hantverkare/sendmessage'
  end
  def sendmessage
    msg = 'Hej! Ja vi har tid att utfora ett arbete at dig. Det arbete du efterfragar skulle ta 4 veckor, kosta 30 tusen kronor. Vi ar lediga fran och med nasta vecka. Vi kontaktar dig om en vecka for att plannera in ett mote. Har du mer fragor kan du hora av dig pa 0701234567.'
    title = "Re: #{params[:title]}"
    @message = Message.create(:title=>title, :message=>msg, :read => false, :user_id => current_user.id)

    render :json=>
    {
     :status=> 'ok',

     },
     :status => '200'

   end
 end

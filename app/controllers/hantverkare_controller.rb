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
    msg = 'Vad kul att du kontaktade mig. Självklart skulle jag kunna ge dig rabatt på det här arbetet. Blir fyra kronor bra?'
    title = 'Re: Rabatt'
    @message = Message.create(:title=>title, :message=>msg, :read => false, :user_id => current_user.id)

    render :json=>
    {
     :status=> 'ok',

     },
     :status => '200'

   end
 end

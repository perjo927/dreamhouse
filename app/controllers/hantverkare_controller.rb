class HantverkareController < ApplicationController
  def showmessage
    @messages = Message.all
    render 'hantverkare/showmessage'
  end
  def show
    render 'hantverkare/show'
  end
  def message
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

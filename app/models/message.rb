class Message < ActiveRecord::Base
  belongs_to :user

  def new
    @message = message.create(:title=>params[:title], :message=>params[:message])

    render :json=>
               {
                   :status=> 'ok',

               },
           :status => '200'

  end
end

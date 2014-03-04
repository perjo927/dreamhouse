class Room < ActiveRecord::Base
  #attr_accessible :name, :type, :description
  belongs_to :user
  def new
    @room = Room.create(:name=>params[:name], :type=>params[:type], :description=>params[:description])

    render :json=>
               {
                   :status=> 'ok',

               },
           :status => '200'

  end

end

class UserController < ApplicationController
  def new
    #create new user
    logger.info(params.inspect)
    @user = User.create(:email=>params[:email], :password=>params[:password])
    if (!params[:object_id].blank?)
      room = Room.find(params[:object_id])
      room.user_id = @user.id
      room.save
    end
    session[:user_id] = @user.id
    if params[:not_json].nil?
      render :json=>
                 {
                     :status=> 'ok',

                 },
             :status => '200'
    else
      redirect_to :root
    end

  end
  def show
    #displays all users
    @users = User.all
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'user/show'
  end
  def index
    #displays all users
    @users = User.all
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'user/show'
  end

  def register
    render 'user/register'
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email, password)
    if user.nil?
      render :json=>
                 {
                     :status=>'error'
                 },
             :status=>'400'
    else
      session[:user_id] = user.id
      render :json=>
                 {
                     :status=>'ok'
                 },
             :status=>'200'
    end
  end

  def logout
    reset_session
    redirect_to :root
  end
  def showmessage
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render 'user/message'
  end

  def showobject
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    @object = Room.find(params[:id])
    render 'user/show_object'
  end
  def editobject
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    @object=Room.find(params[:id])
    render '/user/editobject'
  end
  def changetub
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    @object=Room.find(params[:id])
    render '/user/changetub'
  end
  def savetub
  @object = Room.find(params[:id])
  @object.bathtub=params[:name]
  @object.save
  redirect_to action: 'showobject', id: params[:id]
  end
  def changetiles
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    @object=Room.find(params[:id])
    render '/user/changetiles'
  end
  def savetiles
    @object = Room.find(params[:id])
    tilename = params[:name].sub("_", " ")
    @object.tiles=tilename
    @object.save
    redirect_to action: 'showobject', id: params[:id]
  end
  def finalizeorder
    @object = Room.find(params[:id])
    @messages = current_user.recent_messages
    @objects = current_user.rooms
    render '/user/finalize'
  end
end

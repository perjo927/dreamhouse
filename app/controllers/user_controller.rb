class UserController < ApplicationController
  def new
    #create new user
    @user = User.create(:email=>params[:email], :password=>params[:password])
    if params[:object_id]
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
    @messages = current_user.messages
    @objects = current_user.rooms
    render 'user/show'
  end
  def index
    #displays all users
    @users = User.all
    @messages = current_user.messages
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
    @messages = current_user.messages
    @objects = current_user.rooms
    render 'user/message'
  end
end

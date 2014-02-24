class UserController < ApplicationController
  def new
    #create new user
    @user = User.create(:email=>params[:email], :password=>params[:password])

    render :json=>
               {
                   :status=> 'ok',

               },
           :status => '200'

  end
  def show
    #displays all users
     @users = User.all
    render 'user/show'
  end
  def index
    #displays all users
    @users = User.all
    render 'user/show'
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
end

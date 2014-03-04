class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :messages
  has_many :rooms

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def recent_messages
    messages.order('created_at desc').limit(5)
  end

end

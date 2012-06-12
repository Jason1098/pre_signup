class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at

  after_create :send_welcome_email

  #override Devise method
  #no password is required when account is created; validate password when user sets one
  def password_required?
  	if !persisted?
  		false
  	else
  		!password.nil? || !password_confirmation.nil?
  	end
  end

  #overide Devise method for confirmation email

  def confirmation_required?
    false
  end
  
  #overide Devise method

  def active_for_authentication?
    confirmed? || confirmation_period_valid?
  end

  private

  def send_welcome_email
    unless self.email.include?('example.com')
      UserMailer.welcome_email(self).deliver
    end
  end

end

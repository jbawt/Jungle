class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password) 
      user
    else
      nil
    end
  end

  validates :first_name, presence: true 
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_length_of :password, :minimum => 5
  
end

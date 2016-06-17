class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :facilities_users
  has_many :facilities, through: :facilities_users

  #site admin is boolean: current_user.site_admin?

  
end

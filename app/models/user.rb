class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :facilities_users
  has_many :facilities, through: :facilities_users

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  def full_name
    "#{first_name} #{last_name}".strip if first_name.present? || last_name.present?
  end

  def display_name
    full_name || email
  end
end

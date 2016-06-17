class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users

  validates :name, presence: true
end

class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users
  belongs_to :facility_type


  validates :name, presence: true
  validates :facility_type_id, presence: true
end

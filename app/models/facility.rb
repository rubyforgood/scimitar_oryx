class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users
  belongs_to :facility_type
  accepts_nested_attributes_for :facilities_users

  validates :name, presence: true
  validates :facility_type_id, presence: true
end

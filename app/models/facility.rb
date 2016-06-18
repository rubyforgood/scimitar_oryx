class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users
  has_many :pictures, :dependent => :destroy
  belongs_to :facility_type
  belongs_to :facility_expertise

  accepts_nested_attributes_for :facilities_users

  validates :name, presence: true
  validates :facility_type_id, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :pictures
end

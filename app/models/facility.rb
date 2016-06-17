class Facility < ActiveRecord::Base
  has_many :animals
  belongs_to :facility_type

  validates :name, presence: true
  validates :facility_type_id, presence: true
end

class Animal < ActiveRecord::Base
  belongs_to :facility
  belongs_to :species

  validates :name, presence: true
  validates :facility_id, presence: true
  validates :species_id, presence: true
end

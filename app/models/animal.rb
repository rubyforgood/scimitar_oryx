class Animal < ActiveRecord::Base
  belongs_to :facility
  belongs_to :species

  has_many :pictures, :dependent => :destroy

  validates :name, presence: true
  validates :facility_id, presence: true
  validates :species_id, presence: true

  accepts_nested_attributes_for :pictures
end

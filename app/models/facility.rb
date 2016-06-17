class Facility < ActiveRecord::Base
  has_many :animals
  has_many :pictures, :dependent => :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }
end

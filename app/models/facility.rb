class Facility < ActiveRecord::Base
  has_many :animals
  has_many :pictures, :dependent => :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :pictures
end

class Facility < ActiveRecord::Base
  has_many :animals
  has_many :staff
  has_many :users, through: :staff

  validates :name, presence: true
end

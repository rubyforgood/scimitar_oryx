class Facility < ActiveRecord::Base

  validates :name, presence: true
end

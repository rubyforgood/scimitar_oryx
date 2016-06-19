class AnimalMatch < ActiveRecord::Base
  belongs_to :animal
  belongs_to :potential_mate
end

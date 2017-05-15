class AnimalMatch < ApplicationRecord
  belongs_to :animal
  belongs_to :potential_mate
end

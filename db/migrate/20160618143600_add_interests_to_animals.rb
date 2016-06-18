class AddInterestsToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :interests, :text, array: true, default: Animal::VALID_INTERESTS
  end
end

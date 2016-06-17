class AddSpeciesToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :species_id, :integer
    add_index :animals, :species_id
  end
end

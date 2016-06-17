class AddSpeciesToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :species_id, :integer, null: false

    add_index :animals, :species_id
  end
end

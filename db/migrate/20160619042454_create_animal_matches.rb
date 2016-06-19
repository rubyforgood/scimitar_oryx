class CreateAnimalMatches < ActiveRecord::Migration
  def change
    create_table :animal_matches do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :potential_mate, index: true

      t.timestamps null: false
    end

    add_foreign_key :animal_matches, :animals, column: :potential_mate_id
  end
end

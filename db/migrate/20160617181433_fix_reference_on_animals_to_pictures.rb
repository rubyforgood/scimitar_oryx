class FixReferenceOnAnimalsToPictures < ActiveRecord::Migration
  def change
    remove_reference :animals, :picture, index: true, foreign_key: true
    add_reference :pictures, :animal, index: true, foreign_key: true
  end
end

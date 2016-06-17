class AddPictureToAnimal < ActiveRecord::Migration
  def change
    add_reference :animals, :picture, index: true, foreign_key: true
  end
end

class AddTransponderNumberToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :transponder, :string
  end
end

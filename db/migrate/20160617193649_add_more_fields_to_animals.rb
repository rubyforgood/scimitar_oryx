class AddMoreFieldsToAnimals < ActiveRecord::Migration
  def change
    change_table(:animals) do |t|
      t.column :date_of_birth, :date
      t.column :studbook, :string
      t.column :sire, :string
      t.column :dam, :string
      t.column :tag, :string
      t.column :comments, :text
      t.column :searchable, :boolean
      t.column :sex_id, :integer
      t.column :rearing_id, :integer
      t.column :reproductive_status_id, :integer
    end

    add_index :animals, :sex_id
    add_index :animals, :rearing_id
    add_index :animals, :reproductive_status_id
  end
end

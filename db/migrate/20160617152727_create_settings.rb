class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :type
      t.integer :position

      t.timestamps null: false
    end

    add_index :settings, :type
  end
end

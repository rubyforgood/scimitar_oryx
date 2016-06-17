class AddAnimalsToFacility < ActiveRecord::Migration
  def change
    add_column :animals, :facility_id, :integer
    add_index :animals, :facility_id
  end
end

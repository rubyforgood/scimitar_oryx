class AddFacilityTypeToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :facility_type_id, :integer
    add_index :facilities, :facility_type_id
  end
end

class ChangeFacilityInterestsToAList < ActiveRecord::Migration
  def change
    remove_index :facilities, name: "index_facilities_on_facility_expertise_id"
    remove_column :facilities, :facility_expertise_id
    add_column :facilities, :expertise, :text, default: [], array: true 
  end
end

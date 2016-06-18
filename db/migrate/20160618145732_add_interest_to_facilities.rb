class AddInterestToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :interests, :text, array: true, default: [Facility::VALID_INTERESTS.keys.first]
  end
end

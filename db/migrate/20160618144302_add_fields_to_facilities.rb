class AddFieldsToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :spa, :boolean
    add_column :facilities, :acreage, :float
    add_column :facilities, :endangered_acreage, :float
    add_column :facilities, :temperture_controled, :boolean
    add_column :facilities, :water_features, :boolean
    add_column :facilities, :supplemental_feed, :boolean
  end
end

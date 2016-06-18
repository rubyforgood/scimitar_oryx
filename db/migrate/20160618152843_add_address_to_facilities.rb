class AddAddressToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :address, :string
    add_column :facilities, :latitude, :float
    add_column :facilities, :longitude, :float
  end
end

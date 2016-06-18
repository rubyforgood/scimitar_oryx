class AddExpertiseToFacilities < ActiveRecord::Migration
  def change
    add_reference :facilities, :facility_expertise, index: true
  end
end

class AddPictureToFacility < ActiveRecord::Migration
  def change
    add_reference :facilities, :picture, index: true, foreign_key: true
  end
end

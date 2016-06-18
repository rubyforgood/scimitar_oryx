class FixReferenceOnFacilitiesToPictures < ActiveRecord::Migration
  def change
    remove_reference :facilities, :picture, index: true, foreign_key: true
    add_reference :pictures, :facility, index: true, foreign_key: true
  end
end

class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures
    add_attachment :pictures, :image
  end

  def self.down
    remove_attachment :pictures, :image
    drop_table :pictures
  end
end

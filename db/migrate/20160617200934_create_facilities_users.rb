class CreateFacilitiesUsers < ActiveRecord::Migration
  def change
    create_table :facilities_users do |t|
    	t.belongs_to :facility, index: true
    	t.belongs_to :user, index: true
    end
  end


end

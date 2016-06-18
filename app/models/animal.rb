class Animal < ActiveRecord::Base
  belongs_to :facility
  belongs_to :species

  has_many :pictures, :dependent => :destroy

  validates :name, presence: true
  validates :facility_id, presence: true
  validates :species_id, presence: true
  validates :date_of_birth, presence: true

  accepts_nested_attributes_for :pictures

  def age
    ((Time.now - date_of_birth.to_time) / 1.year).round
  end

  def gender
    {1 => 'male', 2 => 'female'}[sex_id]
  end
end

class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users
  has_many :pictures, :dependent => :destroy
  belongs_to :facility_type
  
  accepts_nested_attributes_for :facilities_users

  validates :name, presence: true
  validates :facility_type_id, presence: true

  accepts_nested_attributes_for :pictures

  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  after_validation :geocode, if: ->(facility){ facility.address.present? && facility.address_changed? }

  VALID_INTERESTS = {
    'grow_herd_size'                  => 'Interested in breeding to grow herd size',
    'maintain_herd_size'              => 'Interested in breeding to maintain herd size',
    'decrease_herd_size'              => 'Interested in decreasing herd size',
    'house_post_reproductive_animals' => 'Interested in housing post-reproductive animals',
    'house_new_species'               => 'Interested in housing new species'
  }.freeze

  before_save { |facility| facility.interests = facility.interests.uniq.select{ |e| VALID_INTERESTS.keys.include?(e) }  }

  VALID_INTERESTS.keys.each do |interest|
    define_method("interest_to_#{interest}?"){ interests.include?(interest) }
  end

  FacilityExpertise.all.each do |expertise|
    define_method("expertise_to_#{expertise.id}?"){ expertise.include?(expertise.id)}
  end
end

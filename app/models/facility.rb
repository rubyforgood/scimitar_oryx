class Facility < ActiveRecord::Base
  has_many :animals
  has_many :facilities_users
  has_many :users, through: :facilities_users
  has_many :pictures, :dependent => :destroy
  belongs_to :facility_type
  belongs_to :facility_expertise

  accepts_nested_attributes_for :facilities_users

  validates :name, presence: true
  validates :facility_type_id, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :pictures

  VALID_INTERESTS = {
    'grow_herd_size'                  => 'Breed to grow herd size',
    'maintain_herd_size'              => 'Breed to maintain herd size',
    'decrease_herd_size'              => 'Looking to decrease herd size',
    'house_post_reproductive_animals' => 'Willing to house post-reproductive animals',
    'house_new_species'               => 'Interested in housing new species'
  }.freeze

  before_save { |facility| facility.interests = facility.interests.uniq.select{ |e| VALID_INTERESTS.keys.include?(e) } }

  VALID_INTERESTS.keys.each do |interest|
    define_method("interest_to_#{interest}?"){ interests.include?(interest) }
  end

end

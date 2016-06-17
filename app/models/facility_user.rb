class FacilityUser < Setting
  belongs_to :user
  belongs_to :facility
end

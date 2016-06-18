class Setting < ActiveRecord::Base
  acts_as_list scope: [:type]
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :type }
end

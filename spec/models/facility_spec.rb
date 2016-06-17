require 'rails_helper'

RSpec.describe Facility, type: :model do

  let(:facility) { create(:facility) }

  it 'should be valid' do
    expect(facility).to be_valid
  end

  it 'requires a facility type' do
    facility.facility_type = nil
    expect(facility).to_not be_valid
  end
end

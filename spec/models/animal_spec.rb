require 'rails_helper'

RSpec.describe Animal, type: :model do
  let(:animal) { create(:animal) }

  it "should have valid factory" do
    expect(animal).to be_valid
  end

  it 'requires a species' do
    animal.species = nil
    expect(animal).to_not be_valid
  end

  it 'requires a facility' do
    animal.facility = nil
    expect(animal).to_not be_valid
  end

  it 'require a date of birth' do
    animal.date_of_birth = nil
    expect(animal).to_not be_valid
  end

end

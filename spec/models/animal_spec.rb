require 'rails_helper'

RSpec.describe Animal, type: :model do

  it 'requires a species' do
    animal = Animal.new(name: "JC")
    expect(animal.valid?).to be_falsey
  end
end

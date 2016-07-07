require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  it 'renders attributes in <p>' do
    @animal = create(:animal, name: 'Jeremy')
    @facility = @animal.facility
    @nearby_animals = []

    render

    expect(rendered).to match(/Jeremy/)
  end
end

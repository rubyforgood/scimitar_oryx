require 'rails_helper'

RSpec.describe "animal_matches/show", type: :view do
  before(:each) do
    @animal_match = assign(:animal_match, AnimalMatch.create!(
      :animal => nil,
      :potential_mate => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

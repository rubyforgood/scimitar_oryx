require 'rails_helper'

RSpec.describe "animal_matches/index", type: :view do
  before(:each) do
    assign(:animal_matches, [
      AnimalMatch.create!(
        :animal => nil,
        :potential_mate => nil
      ),
      AnimalMatch.create!(
        :animal => nil,
        :potential_mate => nil
      )
    ])
  end

  it "renders a list of animal_matches" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "animal_matches/edit", type: :view do
  before(:each) do
    @animal_match = assign(:animal_match, AnimalMatch.create!(
      :animal => nil,
      :potential_mate => nil
    ))
  end

  it "renders the edit animal_match form" do
    render

    assert_select "form[action=?][method=?]", animal_match_path(@animal_match), "post" do

      assert_select "input#animal_match_animal_id[name=?]", "animal_match[animal_id]"

      assert_select "input#animal_match_potential_mate_id[name=?]", "animal_match[potential_mate_id]"
    end
  end
end

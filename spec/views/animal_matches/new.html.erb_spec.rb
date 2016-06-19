require 'rails_helper'

RSpec.describe "animal_matches/new", type: :view do
  before(:each) do
    assign(:animal_match, AnimalMatch.new(
      :animal => nil,
      :potential_mate => nil
    ))
  end

  it "renders new animal_match form" do
    render

    assert_select "form[action=?][method=?]", animal_matches_path, "post" do

      assert_select "input#animal_match_animal_id[name=?]", "animal_match[animal_id]"

      assert_select "input#animal_match_potential_mate_id[name=?]", "animal_match[potential_mate_id]"
    end
  end
end

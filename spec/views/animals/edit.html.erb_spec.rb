require 'rails_helper'

RSpec.describe "animals/edit", type: :view do

  it "renders the edit animal form" do
    @animal = create(:animal)

    render

    assert_select "form[action=?][method=?]", animal_path(@animal), "post" do

      assert_select "input#animal_name[name=?]", "animal[name]"
    end
  end
end

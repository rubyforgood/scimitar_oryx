require 'rails_helper'

RSpec.describe "animals/new", type: :view do

  it "renders new animal form" do
    assign :animal, build(:animal)

    render

    assert_select "form[action=?][method=?]", animals_path, "post" do

      assert_select "input#animal_name[name=?]", "animal[name]"
    end
  end
end

require 'rails_helper'

RSpec.describe "animals/edit", type: :view do

  it "renders the edit animal form" do
    @animal = create(:animal)
    @facility = @animal.facility

    render

    action = facility_animal_path(@facility, @animal)
    method = 'post'
    assert_select 'form[action=?][method=?]', action, method do
      assert_select 'input#animal_name[name=?]', 'animal[name]'
    end
  end
end

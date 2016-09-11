require 'rails_helper'

RSpec.describe "animals/new", type: :view do

  it "renders new animal form" do
    @facility = create(:facility)
    @animal = Animal.new

    render

    action = facility_animals_path(@facility)
    method = 'post'
    assert_select 'form[action=?][method=?]', action, method do
      assert_select 'input#animal_name[name=?]', 'animal[name]'
    end
  end
end

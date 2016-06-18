require 'rails_helper'

RSpec.describe "animals/index", type: :view do

  it "renders a list of animals" do
    facility = create(:facility)
    assign(:animals, [
      create(:sample_animal, facility: facility),
    ])

    render
    assert_select "div.animal", :count => 1
  end
end

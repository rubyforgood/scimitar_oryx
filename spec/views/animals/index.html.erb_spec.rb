require 'rails_helper'

RSpec.describe "animals/index", type: :view do

  it "renders a list of animals" do
    assign(:animals, [
      create(:sample_animal),
      create(:sample_animal),
    ])

    render

    assert_select "div.Animal", :count => 2
  end
end

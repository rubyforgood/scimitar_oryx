require 'rails_helper'

RSpec.describe "animals/index", type: :view do

  it "renders a list of animals" do
    @animals = [create(:animal)]
    @facility = @animals.first.facility

    render

    assert_select 'div.animal', count: 1
  end
end

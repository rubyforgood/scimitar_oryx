require 'rails_helper'

RSpec.describe "facilities/edit", type: :view do

  it "renders the edit facility form" do
    @facility = create(:facility)

    render

    assert_select "form[action=?][method=?]", facility_path(@facility), "post" do

      assert_select "input#facility_name[name=?]", "facility[name]"
    end
  end
end

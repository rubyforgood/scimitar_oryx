require 'rails_helper'

RSpec.describe "facilities/new", type: :view do

  it "renders new facility form" do
    assign :facility, build(:facility)

    render

    assert_select "form[action=?][method=?]", facilities_path, "post" do

      assert_select "input#facility_name[name=?]", "facility[name]"
    end
  end
end

require 'rails_helper'

RSpec.describe "facilities/new", type: :view do
  before(:each) do
    assign(:facility, Facility.new(
      :name => "MyString"
    ))
  end

  it "renders new facility form" do
    render

    assert_select "form[action=?][method=?]", facilities_path, "post" do

      assert_select "input#facility_name[name=?]", "facility[name]"
    end
  end
end

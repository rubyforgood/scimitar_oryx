require 'rails_helper'

RSpec.describe "facilities/index", type: :view do
  before(:each) do
    assign(:facilities, [
      Facility.create!(
        :name => "Name"
      ),
      Facility.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of facilities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

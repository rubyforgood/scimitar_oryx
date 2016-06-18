require 'rails_helper'

RSpec.describe "facilities/index", type: :view do

  it "renders a list of facilities" do
    assign(:facilities, [
      create(:facility, :name => "john"),
    ])

    render
    assert_select "tr>td", :text => "john".to_s, :count => 1
  end
end

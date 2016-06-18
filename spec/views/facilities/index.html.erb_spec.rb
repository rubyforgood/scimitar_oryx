require 'rails_helper'

RSpec.describe "facilities/index", type: :view do

  it "renders a list of facilities" do
    facility = create(:sample_facility, :name => "john")

    # todo - unsure of how to authenticate a user, or why rendering the indeed
    # view of facilities requires one to be authenticated. - jeremy

    assign :facilities, [ facility ]
    assign :current_user,
      create(:user, :facility_ids => [ facility.id ])

    render
    assert_select "tr>td", :text => "john".to_s, :count => 1
  end
end
